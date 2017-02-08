package org.rdw.ingest.service;

import rdw.model.TDSReport;

import java.util.Optional;

/**
 * Service for manipulating exams / test results.
 */
public interface ExamService {

    Optional<TDSReport> submitExam(String xml, String batchId);

    Optional<TDSReport> getExam(String id);
}
