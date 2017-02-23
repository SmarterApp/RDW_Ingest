package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.service.AssessmentService;
import org.rdw.ingest.processor.service.AssessmentTypeService;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.rdw.ingest.processor.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport;


@Service
class DefaultExamService implements ExamService {

    @Autowired
    ExamProcessorRegistry processorRegistry;

    @Autowired
    AssessmentTypeService assessmentTypeService;

    @Autowired
    AssessmentService assessmentService;

    @Override
    public void process(final TDSReport report) {

        final Assessment assessment = assessmentService.findOneByNaturalId(report.getTest());

        final AnyExamProcessor processor = processorRegistry.getByType(assessmentTypeService.toCode(assessment.getTypeId()));

        //todo: handle error conditions
        processor.process(report, assessment);
    }
}
