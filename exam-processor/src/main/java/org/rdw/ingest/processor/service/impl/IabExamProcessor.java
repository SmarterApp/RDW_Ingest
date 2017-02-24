package org.rdw.ingest.processor.service.impl;

import java.util.List;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.model.IabExam;
import org.rdw.ingest.processor.repository.IabExamRepository;
import org.rdw.ingest.processor.service.AnyExamProcessor;
import org.rdw.ingest.processor.service.ExamineeProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import rdw.model.TDSReport.Opportunity;

import static java.lang.Float.parseFloat;
import static java.lang.Integer.parseInt;

@Component
class IabExamProcessor extends AnyExamProcessor<IabExam, IabExam.Builder> {

    @Autowired
    public IabExamProcessor(final ExamineeProcessor examineeProcessor,
                            final IabExamRepository iabExamRepository) {
        super(examineeProcessor, iabExamRepository);

    }

    @Override
    public String[] getTypes() {
        return new String[]{"iab"};
    }

    @Override
    protected IabExam.Builder buildExam(final Opportunity opportunity, final List<Claim> claims) {
        final IabExam.Builder examBuilder = IabExam.builder();
        opportunity.getScore()
                .stream()
                .filter(score -> IabExamProcessor.overallScore.equals(score.getMeasureOf()))
                .forEach(score -> {
                    switch (score.getMeasureLabel()) {
                        case scoreMeasureLabel:
                            //TODO: handle parse errors
                            examBuilder
                                    .withScaleScore(parseFloat(score.getValue()))
                                    .withScaleScoreStdErr(parseFloat(score.getStandardError()));
                            break;
                        case performanceLevelMeasureLabel:
                            examBuilder
                                    .withCategory(parseInt(score.getValue()));
                            break;
                        default:
                            break;
                    }
                });
        return examBuilder;
    }
}