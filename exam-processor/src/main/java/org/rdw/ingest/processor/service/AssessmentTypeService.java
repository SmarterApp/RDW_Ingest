package org.rdw.ingest.processor.service;

/**
 * An interface for managing assessment type codes
 */
public interface AssessmentTypeService {

    /**
     * Convert a given type id into a code
     *
     * @param id an id of an assessment
     * @return a code
     */
    String toCode(int id);
}
