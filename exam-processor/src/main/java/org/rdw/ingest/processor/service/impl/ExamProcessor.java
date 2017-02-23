package org.rdw.ingest.processor.service.impl;

import java.util.List;
import org.rdw.ingest.processor.model.AnyExam;
import org.rdw.ingest.processor.model.AnyExam.Builder;
import org.rdw.ingest.processor.model.Exam;
import org.rdw.ingest.processor.repository.StudentRepository;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.rdw.ingest.processor.service.EthnicityService;
import org.rdw.ingest.processor.service.GenderService;
import org.rdw.ingest.processor.service.GradeService;
import org.rdw.ingest.processor.service.SchoolService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import rdw.model.TDSReport.Opportunity;

//TODO: complete this
@Component
class ExamProcessor extends AnyExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessor.class);

    // TODO - this should not be hardcoded. It needs to come from some configuration. Needs further discussions
    public static String mathClaims[] = {"1", "SOCK_2", "3"};
    public static String elaClaims[] = {"SOCK_R", "SOCK_LS", "2-W", "4-CR"};


    @Autowired
    public ExamProcessor(GenderService genderService,
                         EthnicityService ethnicityService,
                         GradeService gradeService,
                         SchoolService schoolService,
                         StudentRepository studentRepository) {
        super(genderService, ethnicityService, gradeService, schoolService, studentRepository);
    }

    @Override
    public String[] getTypes() {
        return new String[]{"ica"};
    }

    @Override
    protected Builder<? extends AnyExam> getExamBuilder() {
        return Exam.builder();
    }

    @Override
    protected long processExam(Opportunity opportunity, Builder<? extends AnyExam> builder) {
        Exam.Builder examBuilder = (Exam.Builder) builder;
        opportunity.getScore().stream().filter(score -> score.getMeasureOf() == AnyExamProcessor.overallScore).forEach(score -> {
            final String label = score.getMeasureLabel();
            if (label == AnyExamProcessor.scoreMeasureLabel) {
                examBuilder
                        .withScaleScore(Float.parseFloat(score.getValue()))
                        .withScaleScoreStdErr(Float.parseFloat(score.getStandardError()));
            } else if (label == AnyExamProcessor.performanceLevelMeasureLabel) {
                examBuilder
                        .withAchievementLevel(Integer.parseInt(score.getValue()));
            }
        });
        // TODO: complete
        return 0;
    }

    @Override
    protected void processExamItems(List<Opportunity.Item> items, long examId) {

    }


}