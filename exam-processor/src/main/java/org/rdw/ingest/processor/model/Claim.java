package org.rdw.ingest.processor.model;


import javax.validation.constraints.Null;

/**
 * A claim definition
 */
public class Claim extends Identifiable<Integer> {
    private String code;
    @Null
    private Float minScore;
    @Null
    private Float maxScore;

    public String getCode() {
        return code;
    }

    public Float getMinScore() {
        return minScore;
    }


    public Float getMaxScore() {
        return maxScore;
    }


    public static Claim.Builder builder() {
        return new Claim.Builder();
    }

    /**
     * The builder for the {@link Claim}
     */
    public static class Builder {
        private String code;
        @Null
        private Float minScore;
        @Null
        private Float maxScore;

        public Claim build() {
            final Claim claim = new Claim();
            claim.code = code;
            claim.maxScore = maxScore;
            claim.minScore = minScore;
            return claim;
        }

        public Builder withCode(String code) {
            this.code = code;
            return this;
        }

        public Builder withMinScore(Float minScore) {
            this.minScore = minScore;
            return this;
        }

        public Builder withMaxScore(Float maxScore) {
            this.maxScore = maxScore;
            return this;
        }
    }
}
