package org.rdw.ingest.processor.service;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.School;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import rdw.model.Examinee;
import rdw.model.Opportunity;
import rdw.model.TDSReport;

import java.util.List;

/**
 * This class defines a template for processing {@link TDSReport} and converting it into a persisted exam
 */
public abstract class ExamProcessor {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessor.class);

    /**
     * A template method that defines a flow for processing {@link TDSReport}
     *
     * @param report     a {@link TDSReport} to process
     * @param assessment an {@link Assessment} that matches the given report
     */
    public void process(final TDSReport report, final Assessment assessment) {

        School school = processInstitution(report.getExaminee());

        long studentId = processStudent(report.getExaminee());

        long examId = processExam(report.getOpportunity(), assessment, school, studentId);

        processExamItems(report.getOpportunity().getItem(), examId);

        //todo: update the status -?
    }

    public abstract String getType();

    protected abstract School processInstitution(final Examinee examinee);

    protected abstract long processStudent(final Examinee examinee);

    protected abstract long processExam(final Opportunity opportunity, final Assessment assessment, final School school, final long studentId);

    protected abstract void processExamItems(final List<Opportunity.Item> items, final long examId);
}