package org.rdw.ingest.processor.service;

import rdw.model.TDSReport;

/**
 * Created by allagorina on 2/16/17.
 */
public interface ExamService {
    void process(TDSReport report);
}
