package org.rdw.ingest.processor.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.District;
import org.rdw.ingest.processor.model.School;
import org.rdw.ingest.processor.model.Student;
import org.rdw.ingest.processor.model.StudentAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import rdw.model.TDSReport;
import rdw.model.TDSReport.Examinee;
import rdw.model.TDSReport.Examinee.ExamineeAttribute;
import rdw.model.TDSReport.Examinee.ExamineeRelationship;
import rdw.model.TDSReport.Opportunity;

import static com.google.common.base.Strings.isNullOrEmpty;
import static com.google.common.collect.Maps.newHashMap;

/**
 * This class defines a template for processing {@link TDSReport} and converting it into a persisted exam
 */
public abstract class ExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessor.class);

    private GenderService genderService;
    private EthnicityService ethnicityService;
    private GradeService gradeService;
    private SchoolService schoolService;

    public ExamProcessor(final GenderService genderService,
                         final EthnicityService ethnicityService,
                         final GradeService gradeService,
                         final SchoolService schoolService) {
        this.genderService = genderService;
        this.ethnicityService = ethnicityService;
        this.gradeService = gradeService;
        this.schoolService = schoolService;
    }

    /**
     * A template method that defines a flow for processing {@link TDSReport}
     *
     * @param report     a {@link TDSReport} to process
     * @param assessment an {@link Assessment} that matches the given report
     */
    public void process(final TDSReport report, final Assessment assessment) {

        try {
            final Map<String, Object> entityBuilders = parseExaminee(report.getExaminee());
            int schoolId = schoolService.findOrCreate(((School.Builder) entityBuilders.get("school")).build());

            long studentId = processStudent(((Student.Builder) entityBuilders.get("student")).build());

            long examId = processExam(report.getOpportunity(), assessment, schoolId, studentId);

            processExamItems(report.getOpportunity().getItem(), examId);
        } catch (ParseException parseException) {
            //TODO:
        }
        //todo: update the status -?
    }


    protected long processStudent(final Student student) {
        return 0;
    }



    public abstract String getType();

    protected abstract long processExamStudent(final StudentAttributes studentAttributes);

    protected abstract long processExam(final Opportunity opportunity, final Assessment assessment, final int schoolId, final long studentId);

    protected abstract void processExamItems(final List<Opportunity.Item> items, final long examId);

    /**
     * Examinee section includes data for {@link School}, {@link District}, {@link Student}, and {@link StudentAttributes}
     *
     * @param examinee the {@link Examinee} to be parsed into objects
     * @return the map of the extracted objects
     */
    private Map parseExaminee(final Examinee examinee) throws ParseException {

        final List<Object> objects = examinee.getExamineeAttributeOrExamineeRelationship();

        Student.Builder studentBuilder = Student.builder();
        StudentAttributes.Builder studentAttributesBuilder = StudentAttributes.builder();
        School.Builder schoolBuilder = School.builder();
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

    private void parseExamineeAttribute(ExamineeAttribute attribute, Student.Builder studentBuilder, StudentAttributes.Builder studentAttributesBuilder) throws ParseException {
        if (attribute.getContext().value() != "FINAL") return;

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
                studentBuilder.withNaturalId(value);
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
                if (value == "YES") studentBuilder.withEthnicityId(ethnicityService.toId(attributeName));
                break;

            case "IDEAIndicator":
                if (value == "YES") studentAttributesBuilder.withIdeaIndicator(true);
                break;
            case "LEPStatus":
                if (value == "YES") studentAttributesBuilder.withLep(true);
                break;
            case "Section504Status":
                if (value == "YES") studentAttributesBuilder.withSection504(true);
                break;
            case "EconomicDisadvantageStatus":
                if (value == "YES") studentAttributesBuilder.withEconomicDisadvantage(true);
                break;
            case "MigrantStatus":
                if (value == "YES") studentAttributesBuilder.withMigrantStatus(true);
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

    private void parseExamineeRelationship(ExamineeRelationship attribute, final School.Builder schoolBuilder, final District.Builder districtBuilder) {
        if (attribute.getContext().value() != "FINAL") return;

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
                //TODO: do we need to do antything about it?
                break;
            default:
                break;
        }
    }

//    public static class Scores {
//        public static final String scoreMeasureLabel = "ScaleScore";
//        public static final String performanceLevelMeasureLabel = "PerformanceLevel";
//
//        public static final String overallScore = "Overall";
//
//        //TODO - this should not be hardcoded. It needs to come from some configuration. Needs further discussions
//        public static String mathClaims[] = {"1", "SOCK_2", "3"};
//        public static String elaClaims[] = {"SOCK_R", "SOCK_LS", "2-W", "4-CR"};
//
//    }
}