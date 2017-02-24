package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.School;

/**
 * Repository for managing {@link School}
 */
public interface SchoolRepository {
    /**
     * Finds a {@link School} by its natural id if one exists. Otherwise creates a new one.
     *
     * @param school a school to find or create
     * @return an id of the found or created school
     */
    int findOrCreateByNaturalId(School school);
}
