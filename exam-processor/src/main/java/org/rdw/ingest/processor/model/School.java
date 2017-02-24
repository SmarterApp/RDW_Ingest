package org.rdw.ingest.processor.model;

import static com.google.common.base.Preconditions.checkArgument;
import static com.mysql.jdbc.StringUtils.isNullOrEmpty;

/**
 * A school
 */
public class School {
    private String name;
    private String naturalId;
    private District district;

    School(String naturalId, String name, District district) {
        this.name = name;
        this.district = district;
        setNaturalId(naturalId);
    }

    public String getName() {
        return name;
    }

    public District getDistrict() {
        return district;
    }

    public String getNaturalId() {
        return naturalId;
    }

    protected void setNaturalId(final String naturalId) {
        checkArgument(!isNullOrEmpty(naturalId), "invalid natural id");
        this.naturalId = naturalId;
    }

    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link School}
     */
    public static class Builder {
        private String name;
        private District district;
        private String naturalId;

        public School build() {
            return new School(naturalId, name, district);
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withDistrict(District district) {
            this.district = district;
            return this;
        }

        public Builder withNaturalId(String naturalId) {
            this.naturalId = naturalId;
            return this;
        }

    }
}
