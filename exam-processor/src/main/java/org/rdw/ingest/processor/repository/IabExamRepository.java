package org.rdw.ingest.processor.repository;

import org.rdw.ingest.processor.model.IabExam;
import org.rdw.ingest.processor.model.StudentAttributes;

/**
 * Repository for managing {@link IabExam}
 */
public interface IabExamRepository {

    long create(IabExam exam);
}
