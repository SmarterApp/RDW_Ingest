package org.rdw.ingest.processor.model;


public class ExamItem extends Identifiable<Long> {
    Long itemId;
    float score;
    String scoreStatus;
    String response;
}
