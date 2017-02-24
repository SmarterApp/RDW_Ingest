package org.rdw.ingest.processor.model;

/**
 * A district
 */
public class District {
    private String name;
    private String naturalId;

    District(final String naturalId, final String name) {
        this.naturalId = naturalId;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getNaturalId() {
        return naturalId;
    }


    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link District}
     */
    public static class Builder {
        private String name;
        private String naturalId;

        public District build() {
            return new District(naturalId, name);
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withNaturalId(String naturalId) {
            this.naturalId = naturalId;
            return this;
        }
    }
}
