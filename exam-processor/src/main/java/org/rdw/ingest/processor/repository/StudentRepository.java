package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.Student;

/**
 * Repository for managing {@link Student}
 */
public interface StudentRepository {

    /**
     * Finds a {@link Student} by the student identifier if one exists. Otherwise creates a new one.
     *
     * @param student a school to find or create
     * @return an id of the found or created student
     */
    long findOrCreateBySsid(Student student);
}
