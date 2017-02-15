package org.rdw.ingest.service;

import org.rdw.ingest.auth.RdwUser;
import org.rdw.ingest.model.RdwImport;

import java.util.Optional;

/**
 * Service for manipulating exams / test results.
 */
public interface ExamService {

    RdwImport importExam(RdwUser user, String payload, String contentType, String batchId);

    Optional<RdwImport> getImport(String id);
}
