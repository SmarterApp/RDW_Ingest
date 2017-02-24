package org.rdw.ingest.processor.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;


/**
 * This class represents common attributes share by all types of exams
 */
public abstract class AnyExam {
    private Date completedAt;
    private long assessmentId;
    private String asmtVersion;
    private int opportunity;
    private int completeness;
    private int administrationConditionId;
    private boolean isValid;
    private String status;
    private String sessionId;
    private StudentExamAttributes studentExamAttributes;
    private List<Accommodation> availableAccommodations;
    private List<ExamItem> examItems;
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

    public StudentExamAttributes getStudentExamAttributes() {
        return studentExamAttributes;
    }

    public List<Accommodation> getAvailableAccommodations() {
        return availableAccommodations == null ? newArrayList() : availableAccommodations;
    }

    public List<ExamItem> getExamItems() {
        return examItems == null ? newArrayList() : examItems;
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
        private StudentExamAttributes studentExamAttributes;
        private List<Accommodation> availableAccommodations;
        private List<ExamItem> examItems;
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
            exam.studentExamAttributes = studentExamAttributes;
            exam.availableAccommodations = availableAccommodations;
            exam.scaleScore = scaleScore;
            exam.scaleScoreStdErr = scaleScoreStdErr;
            exam.examItems = examItems;
            return exam;
        }

        protected abstract E createExam();

        public Builder withCompletedAt(String completedAt) throws ParseException {
            this.completedAt = new SimpleDateFormat("yyyyy-mm-dd").parse(completedAt);
            ;
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

        public Builder withStudentAttributes(StudentExamAttributes studentExamAttributes) {
            this.studentExamAttributes = studentExamAttributes;
            return this;
        }

        public Builder withAvailableAccommodations(List<Accommodation> availableAccommodations) {
            this.availableAccommodations = availableAccommodations;
            return this;
        }

        public Builder withExamItems(List<ExamItem> examItems) {
            this.examItems = examItems;
            return this;
        }
    }
}
