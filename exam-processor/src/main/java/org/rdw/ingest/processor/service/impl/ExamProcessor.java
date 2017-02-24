package org.rdw.ingest.processor.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.model.Exam;
import org.rdw.ingest.processor.model.ExamClaim;
import org.rdw.ingest.processor.repository.ExamRepository;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.rdw.ingest.processor.service.ExamineeProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import rdw.model.TDSReport.Opportunity;
import rdw.model.TDSReport.Opportunity.Score;

import static java.lang.Float.parseFloat;
import static java.util.stream.Collectors.toMap;

@Component
class ExamProcessor extends AnyExamProcessor<Exam, Exam.Builder> {

    @Autowired
    public ExamProcessor(ExamineeProcessor examineeProcessor,
                         ExamRepository examRepository) {
        super(examineeProcessor, examRepository);
    }

    @Override
    public String[] getTypes() {
        return new String[]{"ica"};
    }

    @Override
    protected Exam.Builder buildExam(final Opportunity opportunity, final List<Claim> claims) {
        final Exam.Builder examBuilder = Exam.builder();

        final Map<String, ExamClaim.Builder> claimBuilders = claims.stream()
                .collect(toMap(Claim::getCode, c -> ExamClaim.builder().withClaimId(c.getId())));

        for (final Score score : opportunity.getScore()) {
            final String scoreOf = score.getMeasureOf();
            final String label = score.getMeasureLabel();

            if (overallScore.equals(scoreOf)) {
                if (scoreMeasureLabel.equals(label)) {
                    //TODO: manage parse errors
                    examBuilder
                            .withScaleScore(parseFloat(score.getValue()))
                            .withScaleScoreStdErr(parseFloat(score.getStandardError()));
                } else if (performanceLevelMeasureLabel.equals(label)) {
                    examBuilder
                            .withAchievementLevel(Integer.parseInt(score.getValue()));
                }
            } else if (claimBuilders.containsKey(scoreOf)) {
                if (scoreMeasureLabel.equals(label)) {
                    claimBuilders.get(scoreOf)
                            .withScaleScore(parseFloat(score.getValue()))
                            .withScaleScoreStdErr(parseFloat(score.getStandardError()));
                } else if (performanceLevelMeasureLabel.equals(label)) {
                    claimBuilders.get(scoreOf)
                            .withCategory(Integer.parseInt(score.getValue()));
                }
            }
        }
        return examBuilder.withExamClaims(claimBuilders.values().stream().map(ExamClaim.Builder::build).collect(Collectors.toList()));
    }
}