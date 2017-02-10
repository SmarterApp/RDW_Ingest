package org.rdw.ingest.processor.model;

import javax.validation.constraints.Null;

/**
 * Assessment object
 */
public class Assessment {
    @Null
    private Long id;
    private final String naturalId;
    private int grade;
    private int type;
    private int subject;
    private int academicYear;
    @Null
    private String name;
    @Null
    private String label;
    @Null
    private String version;

    Assessment(String naturalId, int grade, int type, int subject, int academicYear) {
        this.naturalId = naturalId;
        this.grade = grade;
        this.type = type;
        this.subject = subject;
        this.academicYear = academicYear;
    }

    void setId(final Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    void setName(final String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    void setLabel(final String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }

    void setVersion(final String version) {
        this.version = version;
    }

    public String getVersion() {
        return version;
    }

    public String getNaturalId() {
        return naturalId;
    }

    public int getGrade() {
        return grade;
    }

    public int getType() {
        return type;
    }

    public int getSubject() {
        return subject;
    }

    public int getAcademicYear() {
        return academicYear;
    }

    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link Assessment}
     */
    public static class Builder {
        private Long id;
        private String naturalId;
        private int grade;
        private int type;
        private int subject;
        private int academicYear;
        private String name;
        private String label;
        private String version;

        public Assessment build() {
            final Assessment assessment = new Assessment(naturalId, grade, type, subject, academicYear);
            assessment.setId(id);
            assessment.setLabel(label);
            assessment.setName(name);
            assessment.setVersion(version);
            return assessment;
        }

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder naturalId(String naturalId) {
            this.naturalId = naturalId;
            return this;
        }

        public Builder grade(int grade) {
            this.grade = grade;
            return this;
        }

        public Builder type(int type) {
            this.type = type;
            return this;
        }

        public Builder academicYear(int academicYear) {
            this.academicYear = academicYear;
            return this;
        }

        public Builder subject(int subject) {
            this.subject = subject;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder label(String label) {
            this.label = label;
            return this;
        }

        public Builder version(String version) {
            this.version = version;
            return this;
        }

        public Builder copy(Assessment assessment) {
            id(assessment.getId());
            naturalId(assessment.getNaturalId());
            grade(assessment.getGrade());
            type(assessment.getType());
            subject(assessment.getSubject());
            academicYear(assessment.getAcademicYear());
            label(assessment.getLabel());
            name(assessment.getName());
            version(assessment.getVersion());
            return this;
        }
    }
}
