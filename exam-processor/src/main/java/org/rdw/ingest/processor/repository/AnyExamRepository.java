package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.AnyExam;

/**
 * A repository for managing {@link AnyExam}
 * @param <E>
 */
public interface AnyExamRepository <E extends AnyExam> {
    /**
     * Create a new exam
     *
     * @param exam an exam to create
     * @return the id of the newly created exam
     */
    long create(E exam);
}
