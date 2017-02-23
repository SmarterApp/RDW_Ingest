package org.rdw.ingest.processor.model;

import com.google.common.primitives.Floats;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;


/**
 * This class represents common attributes share by all types of exams
 */
public abstract class AnyExam extends Identifiable<Long> {

    private Date completedAt;
    private long assessmentId;
    private String asmtVersion;
    private int opportunity;
    private int completeness;
    private int administrationConditionId;
    private boolean isValid;
    private String status;
    private String sessionId;
    private StudentAttributes studentAttributes;
    private List<Accommodation> availableAccommodations;
    private float scaleScore;
    private float scaleScoreStdErr;

    public float getScaleScore() {
        return scaleScore;
    }

    public float getScaleScoreStdErr() {
        return scaleScoreStdErr;
    }

    public Date getCompletedAt() {
        return completedAt;
    }

    public long getAssessmentId() {
        return assessmentId;
    }

    public String getAsmtVersion() {
        return asmtVersion;
    }

    public int getOpportunity() {
        return opportunity;
    }

    public int getCompleteness() {
        return completeness;
    }

    public int getAdministrationConditionId() {
        return administrationConditionId;
    }

    public boolean isValid() {
        return isValid;
    }

    public String getStatus() {
        return status;
    }

    public String getSessionId() {
        return sessionId;
    }

    public StudentAttributes getStudentAttributes() {
        return studentAttributes;
    }

    public List<Accommodation> getAvailableAccommodations() {
        return availableAccommodations;
    }

    /**
     * The builder for the {@link AnyExam}
     */
    public static abstract class Builder<E extends AnyExam> {
        private Date completedAt;
        private long assessmentId;
        private String asmtVersion;
        private int opportunity;
        private int completeness;
        private int administrationConditionId;
        private boolean isValid;
        private String status;
        private String sessionId;
        private StudentAttributes studentAttributes;
        private List<Accommodation> availableAccommodations = newArrayList();
        private float scaleScore;
        private float scaleScoreStdErr;

        public E build() {
            final E exam = createExam();
            return (E) init(exam);
        }

        private AnyExam init(final AnyExam exam) {
            exam.administrationConditionId = administrationConditionId;
            exam.completedAt = completedAt;
            exam.assessmentId = assessmentId;
            exam.asmtVersion = asmtVersion;
            exam.opportunity = opportunity;
            exam.completeness = completeness;
            exam.administrationConditionId = administrationConditionId;
            exam.isValid = isValid;
            exam.status = status;
            exam.sessionId = sessionId;
            exam.studentAttributes = studentAttributes;
            exam.availableAccommodations = newArrayList(availableAccommodations);
            exam.scaleScore = scaleScore;
            exam.scaleScoreStdErr = scaleScoreStdErr;
            return exam;
        }

        protected abstract E createExam();

        public Builder withCompletedAt(String completedAt) throws ParseException {
            this.completedAt =  new SimpleDateFormat("yyyyy-mm-dd").parse(completedAt);;
            return this;
        }

        public Builder withAssessmentId(long assessmentId) {
            this.assessmentId = assessmentId;
            return this;
        }

        public Builder withAsmtVersion(String asmtVersion) {
            this.asmtVersion = asmtVersion;
            return this;
        }

        public Builder withOpportunity(int opportunity) {
            this.opportunity = opportunity;
            return this;
        }

        public Builder withCompleteness(int completeness) {
            this.completeness = completeness;
            return this;
        }

        public Builder withScaleScore(Float scaleScore) {
            this.scaleScore = scaleScore;
            return this;
        }

        public Builder withScaleScoreStdErr(Float scaleScoreStdErr) {
            this.scaleScoreStdErr = scaleScoreStdErr;
            return this;

        }

        public Builder withAdministrationConditionId(int administrationConditionId) {
            this.administrationConditionId = administrationConditionId;
            return this;
        }

        public Builder withValid(boolean valid) {
            isValid = valid;
            return this;
        }

        public Builder withStatus(String status) {
            this.status = status;
            return this;
        }

        public Builder withSessionId(String sessionId) {
            this.sessionId = sessionId;
            return this;
        }

        public Builder withStudentAttributes(StudentAttributes studentAttributes) {
            this.studentAttributes = studentAttributes;
            return this;
        }

        public Builder withAvailableAccommodations(List<Accommodation> availableAccommodations) {
            this.availableAccommodations = availableAccommodations;
            return this;
        }
    }
}
