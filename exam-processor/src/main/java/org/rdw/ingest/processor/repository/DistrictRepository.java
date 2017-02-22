package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.District;
import org.rdw.ingest.processor.model.School;

/**
 * Repository for managing {@link District}
 */
public interface DistrictRepository {

    int findOrCreate(District district);
}
