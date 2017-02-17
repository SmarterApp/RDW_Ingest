package org.rdw.ingest.processor.model;


/**
 * An {@link Exam}'s claim scoring data
 */
public class ExamClaim {
    private long claimId;
    private float scaleScore;
    private float scaleScoreStrErr;
    private int category;

    public ExamClaim(long claimId, float scaleScore, float scaleScoreStrErr, int category) {
        this.claimId = claimId;
        this.scaleScore = scaleScore;
        this.scaleScoreStrErr = scaleScoreStrErr;
        this.category = category;
    }

    public long getClaimId() {
        return claimId;
    }

    public float getScaleScore() {
        return scaleScore;
    }

    public float getScaleScoreStrErr() {
        return scaleScoreStrErr;
    }

    public int getCategory() {
        return category;
    }

}
