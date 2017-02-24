package org.rdw.ingest.processor.service;

import org.rdw.ingest.processor.model.Assessment;
import rdw.model.TDSReport;

/**
 * An interface for managing {@link Assessment}
 */
public interface AssessmentService {

    //TODO: this will be changed once we have an assessment loader
    Assessment findOneByNaturalId(TDSReport.Test test);
}
