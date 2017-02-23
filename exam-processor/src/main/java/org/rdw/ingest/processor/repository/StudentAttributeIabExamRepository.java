package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.StudentAttributes;

/**
 * Repository for managing {@link StudentAttributes}
 */
public interface StudentAttributeIabExamRepository {

    long create(StudentAttributes studentAttributes);
}
