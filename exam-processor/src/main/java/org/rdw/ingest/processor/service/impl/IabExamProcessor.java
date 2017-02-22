package org.rdw.ingest.processor.service.impl;

import java.util.List;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.Student;
import org.rdw.ingest.processor.model.StudentAttributes;
import org.rdw.ingest.processor.service.EthnicityService;
import org.rdw.ingest.processor.service.ExamProcessor;
import org.rdw.ingest.processor.service.GenderService;
import org.rdw.ingest.processor.service.GradeService;
import org.rdw.ingest.processor.service.SchoolService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import rdw.model.TDSReport;

//TODO: complete this
@Component
class IabExamProcessor extends ExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(IabExamProcessor.class);

    @Autowired
    public IabExamProcessor(GenderService genderService, EthnicityService ethnicityService, GradeService gradeService, SchoolService schoolService) {
        super(genderService, ethnicityService, gradeService, schoolService);
    }

    @Override
    public String getType() {
        return "iab";
    }

    @Override
    protected long processExamStudent(StudentAttributes studentAttributes) {
        return 0;
    }

    @Override
    protected long processExam(TDSReport.Opportunity opportunity, Assessment assessment, int schoolId, long studentId) {
        return 0;
    }

    @Override
    protected void processExamItems(List<TDSReport.Opportunity.Item> items, long examId) {

    }
}