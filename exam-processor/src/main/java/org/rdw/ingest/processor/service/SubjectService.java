package org.rdw.ingest.processor.service;


/**
 * An interface for managing subject codes
 */
public interface SubjectService {
    /**
     * Convert a given code into its id
     *
     * @param code the code to convert to id
     * @return the id
     */
    int toId(String code);
}
