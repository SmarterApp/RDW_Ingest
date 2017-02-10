package org.rdw.ingest.processor.repositories;

import org.rdw.ingest.processor.model.Assessment;

/**
 * Repository for managing {@link Assessment}
 */
public interface AssessmentRepository {

    /**
     * Finds an {@link Assessment} by the natural id
     *
     * @param id the natural id
     * @return the found {@link Assessment}
     */
    Assessment findAssessmentByNaturalId(String id);

    /**
     * Inserts a new {@link Assessment}
     *
     * @param assessment the {@link Assessment} to be created
     * @return the given {@link Assessment} with the id populated
     */
    Assessment create(Assessment assessment);
}
