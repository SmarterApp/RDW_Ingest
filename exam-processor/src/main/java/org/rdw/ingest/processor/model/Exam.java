package org.rdw.ingest.processor.model;

/**
 * An ICA or Summative Exam
 */
public class Exam extends AnyExam {
    private Integer achievementLevel;

    public Integer getAchievementLevel() {
        return achievementLevel;
    }


    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link Assessment}
     */
    public static class Builder extends AnyExam.Builder<Exam> {
        private Integer achievementLevel;

        @Override
        protected Exam createExam() {
            final Exam exam = new Exam();
            exam.achievementLevel = achievementLevel;
            return exam;
        }

        public Builder withAchievementLevel(Integer achievementLevel) {
            this.achievementLevel = achievementLevel;
            return this;
        }

    }
}
