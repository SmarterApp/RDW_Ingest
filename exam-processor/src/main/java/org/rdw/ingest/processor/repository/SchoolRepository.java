package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.model.School;

/**
 * Repository for managing {@link School}
 */
public interface SchoolRepository {
    int findOrCreate(School school);
}
