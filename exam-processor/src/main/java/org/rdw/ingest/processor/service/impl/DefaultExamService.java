package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.rdw.ingest.processor.service.AssessmentService;
import org.rdw.ingest.processor.service.AssessmentTypeService;
import org.rdw.ingest.processor.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport;


@Service
class DefaultExamService implements ExamService {

    private ExamProcessorRegistry processorRegistry;
    private AssessmentTypeService assessmentTypeService;
    private AssessmentService assessmentService;

    @Autowired
    public DefaultExamService(final ExamProcessorRegistry processorRegistry,
                              final AssessmentTypeService assessmentTypeService,
                              final AssessmentService assessmentService) {
        this.processorRegistry = processorRegistry;
        this.assessmentTypeService = assessmentTypeService;
        this.assessmentService = assessmentService;
    }

    @Override
    public void process(final TDSReport report) {
        final Assessment assessment = assessmentService.findOneByNaturalId(report.getTest());
        final AnyExamProcessor processor = processorRegistry.getByType(assessmentTypeService.toCode(assessment.getTypeId()));

        //todo: handle error conditions
        processor.process(report, assessment);
    }
}
