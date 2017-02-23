package org.rdw.ingest.processor.service.impl;

import java.util.List;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.repository.AssessmentRepository;
import org.rdw.ingest.processor.service.AssessmentService;
import org.rdw.ingest.processor.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport;

import static com.google.common.collect.Lists.newArrayList;


//TODO: this needs to be replaced by the real one once we can load assessment packages
@Service
public class StubbedOutAssessmentService implements AssessmentService {
    private AssessmentRepository assessmentRepository;

    private SubjectService subjectService;

    private final List<Claim> elaClaims = newArrayList();
    private final List<Claim> mathClaims = newArrayList();

    @Autowired
    StubbedOutAssessmentService(final AssessmentRepository assessmentRepository, SubjectService subjectService) {
        this.assessmentRepository = assessmentRepository;
        this.subjectService = subjectService;

        elaClaims.add(Claim.builder().withCode("SOCK_R").build());
        elaClaims.add(Claim.builder().withCode("SOCK_LS").build());
        elaClaims.add(Claim.builder().withCode("2-W").build());
        elaClaims.add(Claim.builder().withCode("4-CR").build());

        mathClaims.add(Claim.builder().withCode("1").build());
        mathClaims.add(Claim.builder().withCode("SOCK_2").build());
        mathClaims.add(Claim.builder().withCode("3").build());
    }

    @Override
    public Assessment findOneByNaturalId(TDSReport.Test test) {
        Assessment assessment = assessmentRepository.findAssessmentByNaturalId(test.getName());
        if (assessment != null) return assessment;

        final boolean iab = test.getTestId().contains("IAB");
        return assessmentRepository.create(Assessment.builder()
                .withAcademicYear((int) test.getAcademicYear())
                .withGradeId(3)
                .withNaturalId(test.getName())
                .withSubjectId(subjectService.toId(test.getSubject()))
                .withTypeId(iab ? 2 : 1)
                .withClaims(iab ? null : (test.getSubject().equalsIgnoreCase("ela")) ? elaClaims : mathClaims)
                .build());
    }
}
