package org.rdw.ingest.service;

/**
 * Abstraction for injecting an exam payload into the message queue.
 */
interface ExamSource {

    /**
     * Submit the given text to the "exam" queue
     *
     * @param body text representing exam / test results
     */
    void submitExam(String body);
}
