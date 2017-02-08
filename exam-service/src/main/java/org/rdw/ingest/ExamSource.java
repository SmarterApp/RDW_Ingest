package org.rdw.ingest;

/**
 * Abstraction for injecting an exam payload into the message queue.
 */
interface ExamSource {

    void submitExam(String body);
}
