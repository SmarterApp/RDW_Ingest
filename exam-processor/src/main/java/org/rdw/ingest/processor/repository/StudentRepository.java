package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.Student;

/**
 * Repository for managing {@link Student}
 */
public interface StudentRepository {

    long findOrCreate(Student student);
}
