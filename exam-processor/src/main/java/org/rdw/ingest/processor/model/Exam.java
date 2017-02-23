package org.rdw.ingest.processor.model;

import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

/**
 * An ICA or Summative Exam
 */
public class Exam extends AnyExam {
    private Integer achievementLevel;

    private List<ExamClaim> examClaims;

    public Integer getAchievementLevel() {
        return achievementLevel;
    }

    public List<ExamClaim> getExamClaims() {
        return examClaims == null ? newArrayList() : newArrayList(examClaims);
    }


    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link Assessment}
     */
    public static class Builder extends AnyExam.Builder<Exam> {
        private Integer achievementLevel;
        private List<ExamClaim> examClaims;

        @Override
        protected Exam createExam() {
            final Exam exam = new Exam();
            exam.achievementLevel = achievementLevel;
            exam.examClaims = examClaims;
            return exam;
        }

        public Builder withAchievementLevel(Integer achievementLevel) {
            this.achievementLevel = achievementLevel;
            return this;
        }

        public Builder withExamClaims(List<ExamClaim> claims) {
            this.examClaims = claims;
            return this;
        }


    }
}
