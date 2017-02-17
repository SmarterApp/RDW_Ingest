package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.repository.AssessmentRepository;
import org.rdw.ingest.processor.service.AssessmentTypeService;
import org.rdw.ingest.processor.service.ExamProcessor;
import org.rdw.ingest.processor.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport;


@Service
class DefaultExamService implements ExamService {

    @Autowired
    ExamProcessorRegistry processorRegistry;

    @Autowired
    AssessmentRepository assessmentRepository;

    @Autowired
    AssessmentTypeService assessmentTypeService;

    @Override
    public void process(TDSReport report) {
        final Assessment assessment = assessmentRepository.findAssessmentByNaturalId(report.getTest().getName());
        final ExamProcessor processor = processorRegistry.getByType(assessmentTypeService.toCode(assessment.getTypeId()));

        //todo: handle error conditions
        processor.process(report, assessment);
    }
}
