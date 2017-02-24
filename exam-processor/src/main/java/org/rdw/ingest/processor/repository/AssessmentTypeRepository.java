package org.rdw.ingest.processor.repository;


/**
 * Repository for dealing with assessment types
 */
public interface AssessmentTypeRepository {
    /**
     * Convert the given id into the corresponding code
     *
     * @param id an id of an assessment
     * @return a code
     */
    String toCode(int id);
}
