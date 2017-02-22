package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.repository.AssessmentRepository;
import org.rdw.ingest.processor.service.AssessmentService;
import org.rdw.ingest.processor.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport;


@Service
public class StubbedOutAssessmentService implements AssessmentService {
    @Autowired
    AssessmentRepository assessmentRepository;

    @Autowired
    SubjectService subjectService;

    @Override
    public Assessment findOneByNaturalId(TDSReport.Test test) {
        Assessment assessment = assessmentRepository.findAssessmentByNaturalId(test.getName());
        if (assessment != null) return assessment;

        return assessmentRepository.create(Assessment.builder()
                .withAcademicYear((int) test.getAcademicYear())
                .withGradeId(3)
                .withNaturalId(test.getName())
                .withSubjectId(subjectService.toId(test.getSubject()))
                .withTypeId(2)
                .build());


    }
}
