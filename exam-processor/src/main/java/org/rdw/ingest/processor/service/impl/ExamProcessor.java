package org.rdw.ingest.processor.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.rdw.ingest.processor.model.AnyExam;
import org.rdw.ingest.processor.model.AnyExam.Builder;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.model.Exam;
import org.rdw.ingest.processor.model.ExamClaim;
import org.rdw.ingest.processor.repository.ExamRepository;
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
import rdw.model.TDSReport.Opportunity.Item;
import rdw.model.TDSReport.Opportunity.Score;

import static com.google.common.collect.Maps.newHashMap;

//TODO: complete this
@Component
class ExamProcessor extends AnyExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessor.class);
    private ExamRepository examRepository;

    @Autowired
    public ExamProcessor(GenderService genderService,
                         EthnicityService ethnicityService,
                         GradeService gradeService,
                         SchoolService schoolService,
                         StudentRepository studentRepository,
                         ExamRepository examRepository) {
        super(genderService, ethnicityService, gradeService, schoolService, studentRepository);
        this.examRepository = examRepository;
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
    protected long processExam(Opportunity opportunity, Builder<? extends AnyExam> builder, List<Claim> claims) {

        final Map<String, ExamClaim.Builder> claimBuilders = newHashMap();
        for (final Claim claim : claims) {
            claimBuilders.put(claim.getCode(), ExamClaim.builder().withClaimId(claim.getId()));
        }
        final Exam.Builder examBuilder = (Exam.Builder) builder;
        for (final Score score : opportunity.getScore()) {
            final String scoreOf = score.getMeasureOf();
            final String label = score.getMeasureLabel();
            if (AnyExamProcessor.overallScore.equals(scoreOf)) {
                if (AnyExamProcessor.scoreMeasureLabel.equals(label)) {
                    examBuilder
                            .withScaleScore(Float.parseFloat(score.getValue()))
                            .withScaleScoreStdErr(Float.parseFloat(score.getStandardError()));
                } else if (AnyExamProcessor.performanceLevelMeasureLabel.equals(label)) {
                    examBuilder
                            .withAchievementLevel(Integer.parseInt(score.getValue()));
                }
            } else if (claimBuilders.containsKey(scoreOf)) {
                if (AnyExamProcessor.scoreMeasureLabel.equals(label)) {
                    claimBuilders.get(scoreOf)
                            .withScaleScore(Float.parseFloat(score.getValue()))
                            .withScaleScoreStdErr(Float.parseFloat(score.getStandardError()));
                } else if (AnyExamProcessor.performanceLevelMeasureLabel.equals(label)) {
                    claimBuilders.get(scoreOf)
                            .withCategory(Integer.parseInt(score.getValue()));
                }
            }
        }
        examBuilder.withExamClaims(claimBuilders.values().stream().map(ExamClaim.Builder::build).collect(Collectors.toList()));
        return examRepository.create(examBuilder.build());
    }
}