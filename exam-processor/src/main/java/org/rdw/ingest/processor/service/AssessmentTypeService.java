package org.rdw.ingest.processor.service;

/**
 * An interface for managing assessment type codes and ids
 */
public interface AssessmentTypeService {

    /**
     * Convert assessment a given type id to a code
     * @param id an id of an assessment
     * @return a code
     */
    String toCode(int id);
}
