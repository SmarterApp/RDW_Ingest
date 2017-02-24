package org.rdw.ingest.processor.service;

import java.text.ParseException;
import java.util.List;
import org.rdw.ingest.processor.model.AnyExam;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.Claim;
import org.rdw.ingest.processor.model.ExamItem;
import org.rdw.ingest.processor.repository.AnyExamRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import rdw.model.TDSReport;
import rdw.model.TDSReport.Opportunity;

import static com.google.common.base.Strings.isNullOrEmpty;
import static com.google.common.collect.Lists.newArrayList;

/**
 * This class defines a template for processing {@link TDSReport} and converting it into a persisted exam
 */
public abstract class AnyExamProcessor<E extends AnyExam, B extends AnyExam.Builder<E>> {
    private static final Logger logger = LoggerFactory.getLogger(AnyExamProcessor.class);

    protected static final String scoreMeasureLabel = "ScaleScore";
    protected static final String performanceLevelMeasureLabel = "PerformanceLevel";
    protected static final String overallScore = "Overall";

    private ExamineeProcessor examineeProcessor;
    private AnyExamRepository anyExamRepository;

    public AnyExamProcessor(final ExamineeProcessor examineeProcessor, AnyExamRepository<E> anyExamRepository) {
        this.examineeProcessor = examineeProcessor;
        this.anyExamRepository = anyExamRepository;
    }

    /**
     * @return a list of exam types supported
     */
    public abstract String[] getTypes();

    /**
     * This method is responsible for creating a builder for {@link AnyExam} and initializing it with
     * the exam specific data from the given input.
     *
     * @param opportunity the {@link Opportunity} that holds exam data
     * @param claims      the list of {@link Claim} for the exam
     * @return a pre-loaded builder
     */
    protected abstract B buildExam(Opportunity opportunity, List<Claim> claims);

    /**
     * A template method that defines a flow for processing {@link TDSReport}
     *
     * @param report     a {@link TDSReport} to process
     * @param assessment an {@link Assessment} that matches the given report
     */
    public void process(final TDSReport report, final Assessment assessment) {

        Opportunity opportunity = report.getOpportunity();
        try {
            anyExamRepository.create(buildExam(opportunity, assessment.getClaims())
                    .withStudentAttributes(examineeProcessor.process(report.getExaminee()))
                    .withExamItems(parseExamItems(opportunity))
                    .withAssessmentId(assessment.getId())
                    .withAsmtVersion(report.getTest().getAssessmentVersion())
                    //TODO:
                    // .withAdministrationConditionId(opportunity.getAdministrationCondition())
                    //.withCompletedAt(opportunity.getDateCompleted())
                    //.withCompleteness(opportunity.getCompleteStatus())
                    //.withOpportunity(opportunity.getOpportunity())
                    //.withSessionId(opportunity.getSessionId())
                    //.withValid(opportunity.getStatus())
                    .withAdministrationConditionId(1)
                    .withCompletedAt(opportunity.getDateCompleted())
                    .withCompleteness(1)
                    .withOpportunity((int) opportunity.getOpportunity())
                    .withSessionId(opportunity.getSessionId())
                    .withValid(true)
                    .withStatus(opportunity.getStatus()).build());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //todo: update the status -?
    }

    private List<ExamItem> parseExamItems(final Opportunity opportunity) {
        final List<ExamItem> examItems = newArrayList();
        for (final TDSReport.Opportunity.Item item : opportunity.getItem()) {

            final String response = (item.getResponse() != null && !isNullOrEmpty(item.getResponse().getContent())) ?
                    item.getResponse().getContent() : null;
            //TODO: is bank key a number or string?
            examItems.add(new ExamItem(item.getKey(),
                    (new Long(item.getBankKey()).toString()),
                    Float.parseFloat(item.getScore()),
                    item.getScoreStatus(),
                    response));
        }
        return examItems;
    }

}