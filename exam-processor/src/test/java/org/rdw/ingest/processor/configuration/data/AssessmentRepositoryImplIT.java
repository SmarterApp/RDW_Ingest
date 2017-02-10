package org.rdw.ingest.processor.configuration.data;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.repositories.AssessmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class AssessmentRepositoryImplIT {

    @Autowired
    private AssessmentRepository repository;

    @Test
    @Sql(statements = "INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, academic_year, name, label, version) VALUES " +
            "(22, 'exam natural id', 4, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'MTH IAB G4 OperationsAlgebraicThinking', '9835');")
    public void itShouldFindAssessmentByNaturalId() {
        final Assessment assessment = repository.findAssessmentByNaturalId("exam natural id");

        assertThat(assessment.getId()).isEqualTo(22);
        assertThat(assessment.getAcademicYear()).isEqualTo(2016);
        assertThat(assessment.getGrade()).isEqualTo(4);
        assertThat(assessment.getLabel()).isEqualTo("MTH IAB G4 OperationsAlgebraicThinking");
        assertThat(assessment.getName()).isEqualTo("SBAC-IAB-FIXED-G4M-OA-MATH-4");
        assertThat(assessment.getNaturalId()).isEqualTo("exam natural id");
        assertThat(assessment.getSubject()).isEqualTo(1);
        assertThat(assessment.getType()).isEqualTo(2);
        assertThat(assessment.getVersion()).isEqualTo("9835");

    }

    @Test
    public void itShouldCreateAssessment() {
        final Assessment assessment = repository.create(Assessment.builder()
                .naturalId("exam natural id")
                .grade(7)
                .type(2)
                .subject(1)
                .academicYear(2016)
                .name("SBAC-IAB-FIXED-G4M-OA-MATH-4")
                .label("MTH IAB G4 OperationsAlgebraicThinking")
                .version("9835")
                .build());

        assertThat(assessment.getId()).isNotNull();
        assertThat(assessment.getAcademicYear()).isEqualTo(2016);
        assertThat(assessment.getGrade()).isEqualTo(7);
        assertThat(assessment.getLabel()).isEqualTo("MTH IAB G4 OperationsAlgebraicThinking");
        assertThat(assessment.getName()).isEqualTo("SBAC-IAB-FIXED-G4M-OA-MATH-4");
        assertThat(assessment.getNaturalId()).isEqualTo("exam natural id");
        assertThat(assessment.getSubject()).isEqualTo(1);
        assertThat(assessment.getType()).isEqualTo(2);
        assertThat(assessment.getVersion()).isEqualTo("9835");
    }

}