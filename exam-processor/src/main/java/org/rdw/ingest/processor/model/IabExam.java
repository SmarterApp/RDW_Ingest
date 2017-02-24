package org.rdw.ingest.processor.model;


public class IabExam extends AnyExam {
    private Integer category;

    public Integer getCategory() {
        return category;
    }

    public static Builder builder() {
        return new Builder();
    }
    /**
     * The builder for the {@link Assessment}
     */
    public static  class Builder extends AnyExam.Builder<IabExam> {
        private Integer category;

        @Override
        protected IabExam createExam() {
            final IabExam exam = new IabExam();
            exam.category = category;
            return exam;
        }

        public Builder withCategory(Integer category) {
            this.category = category;
            return this;
        }
    }
}
