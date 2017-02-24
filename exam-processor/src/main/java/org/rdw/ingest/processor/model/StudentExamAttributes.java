package org.rdw.ingest.processor.model;

/**
 * A student attributes for an {@link AnyExam}
 */
public class StudentExamAttributes {
    private Long studentId;
    private Integer responsibleSchoolId;
    private Integer gradeId;
    private Boolean ideaIndicator;
    private Boolean lep;
    private Boolean section504;
    private Boolean economicDisadvantage;
    private Boolean migrantStatus;
    private String engProfLvl;
    private String t3ProgramType;
    private String languageCode;
    private String primDisabilityType;

    public Long getStudentId() {
        return studentId;
    }

    public Integer getResponsibleSchoolId() {
        return responsibleSchoolId;
    }

    public Integer getGradeId() {
        return gradeId;
    }

    public Boolean getIdeaIndicator() {
        return ideaIndicator;
    }

    public Boolean getLep() {
        return lep;
    }

    public Boolean getSection504() {
        return section504;
    }

    public Boolean getEconomicDisadvantage() {
        return economicDisadvantage;
    }

    public Boolean getMigrantStatus() {
        return migrantStatus;
    }

    public String getEngProfLvl() {
        return engProfLvl;
    }

    public String getT3ProgramType() {
        return t3ProgramType;
    }

    public String getLanguageCode() {
        return languageCode;
    }

    public String getPrimDisabilityType() {
        return primDisabilityType;
    }

    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link StudentExamAttributes}
     */
    public static class Builder {
        private Long id;
        private Long studentId;
        private Integer responsibleSchoolId;
        private Integer gradeId;
        private Boolean ideaIndicator;
        private Boolean lep;
        private Boolean section504;
        private Boolean economicDisadvantage;
        private Boolean migrantStatus;
        private String engProfLvl;
        private String t3ProgramType;
        private String languageCode;
        private String primDisabilityType;

        public StudentExamAttributes build() {
            final StudentExamAttributes studentExamAttributes = new StudentExamAttributes();
            studentExamAttributes.studentId = studentId;
            studentExamAttributes.responsibleSchoolId = responsibleSchoolId;
            studentExamAttributes.gradeId = gradeId;
            studentExamAttributes.ideaIndicator = ideaIndicator;
            studentExamAttributes.lep = lep;
            studentExamAttributes.section504 = section504;
            studentExamAttributes.economicDisadvantage = economicDisadvantage;
            studentExamAttributes.migrantStatus = migrantStatus;
            studentExamAttributes.engProfLvl = engProfLvl;
            studentExamAttributes.t3ProgramType = t3ProgramType;
            studentExamAttributes.languageCode = languageCode;
            studentExamAttributes.primDisabilityType = primDisabilityType;
            return studentExamAttributes;
        }

        public Builder withStudentId(Long studentId) {
            this.studentId = studentId;
            return this;
        }

        public Builder withResponsibleSchoolId(Integer responsibleSchoolId) {
            this.responsibleSchoolId = responsibleSchoolId;
            return this;
        }

        public Builder withGradeId(Integer gradeId) {
            this.gradeId = gradeId;
            return this;
        }

        public Builder withIdeaIndicator(Boolean ideaIndicator) {
            this.ideaIndicator = ideaIndicator;
            return this;
        }

        public Builder withLep(Boolean lep) {
            this.lep = lep;
            return this;
        }

        public Builder withSection504(Boolean section504) {
            this.section504 = section504;
            return this;
        }

        public Builder withEconomicDisadvantage(Boolean economicDisadvantage) {
            this.economicDisadvantage = economicDisadvantage;
            return this;
        }

        public Builder withMigrantStatus(Boolean migrantStatus) {
            this.migrantStatus = migrantStatus;
            return this;
        }

        public Builder withEngProfLvl(String engProfLvl) {
            this.engProfLvl = engProfLvl;
            return this;
        }

        public Builder withT3ProgramType(String t3ProgramType) {
            this.t3ProgramType = t3ProgramType;
            return this;
        }

        public Builder withLanguageCode(String languageCode) {
            this.languageCode = languageCode;
            return this;
        }

        public Builder withPrimDisabilityType(String primDisabilityType) {
            this.primDisabilityType = primDisabilityType;
            return this;
        }
    }
}
