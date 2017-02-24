package org.rdw.ingest.processor.service;

import rdw.model.TDSReport;

/**
 * An interface for processing TDS report
 */
public interface ExamService {
    /**
     * Process the given {@link TDSReport}
     *
     * @param report the report to process
     */
    void process(TDSReport report);
}
