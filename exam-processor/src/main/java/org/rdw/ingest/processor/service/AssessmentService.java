package org.rdw.ingest.processor.service;

import org.rdw.ingest.processor.model.Assessment;
import rdw.model.TDSReport;

/**
 * An interface for managing assessment type codes and ids
 */
public interface AssessmentService {
    Assessment findOneByNaturalId(TDSReport.Test test);
}
