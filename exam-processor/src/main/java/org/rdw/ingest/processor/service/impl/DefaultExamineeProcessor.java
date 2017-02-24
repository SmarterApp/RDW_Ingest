package org.rdw.ingest.processor.service.impl;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import org.rdw.ingest.processor.model.District;
import org.rdw.ingest.processor.model.School;
import org.rdw.ingest.processor.model.School.Builder;
import org.rdw.ingest.processor.model.Student;
import org.rdw.ingest.processor.model.StudentExamAttributes;
import org.rdw.ingest.processor.repository.StudentRepository;
import org.rdw.ingest.processor.service.EthnicityService;
import org.rdw.ingest.processor.service.ExamineeProcessor;
import org.rdw.ingest.processor.service.GenderService;
import org.rdw.ingest.processor.service.GradeService;
import org.rdw.ingest.processor.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport.Examinee;
import rdw.model.TDSReport.Examinee.ExamineeAttribute;
import rdw.model.TDSReport.Examinee.ExamineeRelationship;

import static com.google.common.base.Strings.isNullOrEmpty;
import static com.google.common.collect.Maps.newHashMap;


@Service
public class DefaultExamineeProcessor implements ExamineeProcessor {
    private final static String finalContext = "FINAL";
    private final static String yes = "YES";

    private GenderService genderService;
    private EthnicityService ethnicityService;
    private GradeService gradeService;
    private SchoolService schoolService;

    private StudentRepository studentRepository;

    @Autowired
    public DefaultExamineeProcessor(final GenderService genderService,
                                    final EthnicityService ethnicityService,
                                    final GradeService gradeService,
                                    final SchoolService schoolService,
                                    final StudentRepository studentRepository) {
        this.genderService = genderService;
        this.ethnicityService = ethnicityService;
        this.gradeService = gradeService;
        this.schoolService = schoolService;
        this.studentRepository = studentRepository;
    }

    @Override
    public StudentExamAttributes process(final Examinee examinee) {
        final Map<String, Object> entityBuilders;
        try {
            entityBuilders = parseExaminee(examinee);
            int schoolId = schoolService.findOrCreateByNaturalId(((Builder) entityBuilders.get("school")).build());
            long studentId = studentRepository.findOrCreateBySsid(((Student.Builder) entityBuilders.get("student")).build());
            return ((StudentExamAttributes.Builder) entityBuilders.get("studentAttributes"))
                    .withResponsibleSchoolId(schoolId)
                    .withStudentId(studentId)
                    .build();

        } catch (ParseException e) {
            //TODO:
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Examinee section includes data for {@link School}, {@link District}, {@link Student}, and {@link StudentExamAttributes}
     *
     * @param examinee the {@link Examinee} to be parsed into objects
     * @return the map of the extracted objects
     */
    private Map parseExaminee(final Examinee examinee) throws ParseException {

        final List<Object> objects = examinee.getExamineeAttributeOrExamineeRelationship();

        Student.Builder studentBuilder = Student.builder();
        StudentExamAttributes.Builder studentAttributesBuilder = StudentExamAttributes.builder();
        Builder schoolBuilder = School.builder();
        District.Builder districtBuilder = District.builder();

        for (final Object object : objects) {
            if (object instanceof ExamineeRelationship) {
                parseExamineeRelationship((ExamineeRelationship) object, schoolBuilder, districtBuilder);

            } else if (object instanceof ExamineeAttribute) {
                parseExamineeAttribute((ExamineeAttribute) object, studentBuilder, studentAttributesBuilder);
            }
        }
        final Map<String, Object> studentData = newHashMap();
        studentData.put("school", schoolBuilder.withDistrict(districtBuilder.build()));
        studentData.put("student", studentBuilder);
        studentData.put("studentAttributes", studentAttributesBuilder);

        return studentData;
    }

    private void parseExamineeAttribute(final ExamineeAttribute attribute,
                                        final Student.Builder studentBuilder,
                                        final StudentExamAttributes.Builder studentAttributesBuilder) throws ParseException {
        if (!finalContext.equals(attribute.getContext().value())) return;

        final String value = attribute.getValue();
        if (isNullOrEmpty(value)) return;

        final String attributeName = attribute.getName();
        switch (attributeName) {
            case "FirstName":
                studentBuilder.withFirstName(value);
                break;
            case "LastOrSurname":
                studentBuilder.withLastOrSurname(value);
                break;
            case "MiddleName":
                studentBuilder.withMiddleName(value);
                break;
            case "StudentIdentifier":
                studentBuilder.withSsid(value);
                break;
            case "Birthdate":
                studentBuilder.withBirthday(value);
                break;
            case "Sex":
                studentBuilder.withGenderId(genderService.toId(value));
                break;
            case "FirstEntryDateIntoUSSchool":
                studentBuilder.withFirsEntryIntoUSSchoolAt(value);
                break;
            case "LimitedEnglishProficiencyEntryDate":
                studentBuilder.withLepEntryAt(value);
                break;
            case "LEPExitDate":
                studentBuilder.withLepExitAt(value);
                break;
            case "GradeLevelWhenAssessed":
                studentAttributesBuilder.withGradeId(gradeService.toId(value));
                break;

            case "HispanicOrLatinoEthnicity":
            case "AmericanIndianOrAlaskaNative":
            case "Asian":
            case "BlackOrAfricanAmerican":
            case "White":
            case "NativeHawaiianOrOtherPacificIslander":
            case "DemographicRaceTwoOrMoreRaces":
                if (yes.equals(value)) studentBuilder.withEthnicityId(ethnicityService.toId(attributeName));
                break;

            case "IDEAIndicator":
                if (yes.equals(value)) studentAttributesBuilder.withIdeaIndicator(true);
                break;
            case "LEPStatus":
                if (yes.equals(value)) studentAttributesBuilder.withLep(true);
                break;
            case "Section504Status":
                if (yes.equals(value)) studentAttributesBuilder.withSection504(true);
                break;
            case "EconomicDisadvantageStatus":
                if (yes.equals(value)) studentAttributesBuilder.withEconomicDisadvantage(true);
                break;
            case "MigrantStatus":
                if (yes.equals(value)) studentAttributesBuilder.withMigrantStatus(true);
                break;
            case "LanguageCode":
                studentAttributesBuilder.withLanguageCode(value);
                break;
            case "EnglishLanguageProficiencLevel":
                studentAttributesBuilder.withEngProfLvl(value);
                break;
            case "TitleIIILanguageInstructionProgramType":
                studentAttributesBuilder.withT3ProgramType(value);
                break;
            case "PrimaryDisabilityType":
                studentAttributesBuilder.withPrimDisabilityType(value);
                break;

            default:
                break;
        }
    }

    private void parseExamineeRelationship(final ExamineeRelationship attribute,
                                           final Builder schoolBuilder,
                                           final District.Builder districtBuilder) {
        if (!finalContext.equals(attribute.getContext().value())) return;

        final String value = attribute.getValue();
        if (isNullOrEmpty(value)) return;

        final String attributeName = attribute.getName();
        switch (attributeName) {
            case "ResponsibleDistrictIdentifier":
                districtBuilder.withNaturalId(value);
                break;
            case "OrganizationName":
                districtBuilder.withName(value);
                break;
            case "ResponsibleInstitutionIdentifier":
                schoolBuilder.withNaturalId(value);
                break;
            case "NameOfInstitution":
                schoolBuilder.withName(value);
            case "StateName":
            case "StateAbbreviation":
                //TODO: do we need to do anything about it?
                break;
            default:
                break;
        }
    }
}
