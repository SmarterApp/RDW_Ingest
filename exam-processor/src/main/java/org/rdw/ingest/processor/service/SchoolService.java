package org.rdw.ingest.processor.service;

import org.rdw.ingest.processor.model.School;


/**
 * An interface for managing {@link School}
 */
public interface SchoolService {
    /**
     * Finds or creates an id of the {@link School} by its natural id
     *
     * @param school the school to find
     * @return the id ø
     */
    int findOrCreateByNaturalId(School school);
}
