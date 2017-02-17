package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.School;
import org.rdw.ingest.processor.service.ExamProcessor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import rdw.model.Examinee;
import rdw.model.Opportunity;

import java.util.List;

@Component
class IabExamProcessor extends ExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(IabExamProcessor.class);


    @Override
    public String getType() {
        return null;
    }

    @Override
    protected School processInstitution(Examinee examinee) {
        return null;
    }

    @Override
    protected long processStudent(Examinee examinee) {
        return 0;
    }

    @Override
    protected long processExam(Opportunity opportunity, Assessment assessment, School school, long studentId) {
        return 0;
    }

    @Override
    protected void processExamItems(List<Opportunity.Item> items, long examId) {

    }
}