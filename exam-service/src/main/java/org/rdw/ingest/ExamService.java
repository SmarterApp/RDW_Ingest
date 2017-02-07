package org.rdw.ingest;

import org.springframework.stereotype.Service;
import rdw.model.TDSReport;

import java.util.Optional;

/**
 * Service for manipulating exams / test results.
 */
interface ExamService {

    Optional<TDSReport> submitExam(String xml, String batchId);

    Optional<TDSReport> getExam(String id);
}
