package org.rdw.ingest.processor.model;


/**
 * An {@link Exam}'s claim scoring data
 */
public class ExamClaim {
    private long claimId;
    private float scaleScore;
    private float scaleScoreStdErr;
    private int category;

    ExamClaim(long claimId, float scaleScore, float scaleScoreStdErr, int category) {
        this.claimId = claimId;
        this.scaleScore = scaleScore;
        this.scaleScoreStdErr = scaleScoreStdErr;
        this.category = category;
    }

    public long getClaimId() {
        return claimId;
    }

    public float getScaleScore() {
        return scaleScore;
    }

    public float getScaleScoreStdErr() {
        return scaleScoreStdErr;
    }

    public int getCategory() {
        return category;
    }

    public static Builder builder(){
        return new Builder();
    }

    public static class Builder {
        private long claimId;
        private float scaleScore;
        private float scaleScoreStdErr;
        private int category;

        public ExamClaim build() {
            return new ExamClaim(claimId, scaleScore, scaleScoreStdErr, category);
        }

        public Builder withClaimId(long claimId) {
            this.claimId = claimId;
            return this;
        }

        public Builder withScaleScore(float scaleScore) {
            this.scaleScore = scaleScore;
            return this;
        }

        public Builder withScaleScoreStdErr(float scaleScoreStdErr) {
            this.scaleScoreStdErr = scaleScoreStdErr;
            return this;
        }

        public Builder withCategory(int category) {
            this.category = category;
            return this;
        }

    }
}
