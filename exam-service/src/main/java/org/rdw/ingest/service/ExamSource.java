package org.rdw.ingest.service;

import org.rdw.ingest.auth.RdwUser;

/**
 * Abstraction for injecting an exam payload into the message queue.
 */
interface ExamSource {

    /**
     * Submit the given text to the "exam" queue
     *
     * @param user user credentials
     * @param body text representing exam / test results
     * @param contentType content-type of body
     */
    void submitExam(RdwUser user, String body, String contentType);
}
