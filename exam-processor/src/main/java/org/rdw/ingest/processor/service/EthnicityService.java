package org.rdw.ingest.processor.service;


/**
 * An interface for managing ethnicity codes
 */
public interface EthnicityService {

    /**
     * Convert a given code into its id
     *
     * @param code the code to convert to id
     * @return the id
     */
    int toId(String code);
}
