package org.rdw.ingest.processor.model;

import javax.validation.constraints.Null;
import java.util.List;

/**
 * An assessment definition
 */
public class Assessment extends IdentifiableWithNaturalId<Long> {
    private int gradeId;
    private int typeId;
    private int subjectId;
    private int academicYear;
    @Null
    private String name;
    @Null
    private String label;
    @Null
    private String version;
    private List<Claim> claims;

    Assessment(String naturalId, int gradeId, int typeId, int subjectId, int academicYear) {
        setNaturalId(naturalId);
        this.gradeId = gradeId;
        this.typeId = typeId;
        this.subjectId = subjectId;
        this.academicYear = academicYear;
    }

    public Long getId() {
        return getId();
    }

    public String getName() {
        return name;
    }

    public String getLabel() {
        return label;
    }

    public String getVersion() {
        return version;
    }

    public int getGradeId() {
        return gradeId;
    }

    public int getTypeId() {
        return typeId;
    }

    public int getSubjectId() {
        return subjectId;
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
        private int gradeId;
        private int typeId;
        private int subjectId;
        private int academicYear;
        private String name;
        private String label;
        private String version;

        public Assessment build() {
            final Assessment assessment = new Assessment(naturalId, gradeId, typeId, subjectId, academicYear);
            assessment.setId(id);
            assessment.label = label;
            assessment.name = name;
            assessment.version = version;
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

        public Builder gradeId(int gradeId) {
            this.gradeId = gradeId;
            return this;
        }

        public Builder typeId(int typeId) {
            this.typeId = typeId;
            return this;
        }

        public Builder academicYear(int academicYear) {
            this.academicYear = academicYear;
            return this;
        }

        public Builder subjectId(int subjectId) {
            this.subjectId = subjectId;
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
            gradeId(assessment.getGradeId());
            typeId(assessment.getTypeId());
            subjectId(assessment.getSubjectId());
            academicYear(assessment.getAcademicYear());
            label(assessment.getLabel());
            name(assessment.getName());
            version(assessment.getVersion());
            return this;
        }
    }
}
