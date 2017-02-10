package org.rdw.ingest.service;

import org.rdw.ingest.model.RdwImport;
import rdw.model.TDSReport;

import java.util.Optional;

/**
 * Service for manipulating exams / test results.
 */
public interface ExamService {

    RdwImport importExam(String xml, String batchId);

    Optional<RdwImport> getImport(String id);
}
