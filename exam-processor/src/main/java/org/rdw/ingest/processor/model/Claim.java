package org.rdw.ingest.processor.model;


import javax.validation.constraints.Null;

public class Claim extends Identifiable<Integer> {
    private String code;
    @Null
    private Float minScore;
    @Null
    private Float maxScore;
}
