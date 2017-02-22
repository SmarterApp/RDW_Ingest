package org.rdw.ingest.processor.model;

/**
 * A district
 */
public class District extends IdentifiableWithNaturalId<Integer> {
    private String name;

    District(final Integer id, final String naturalId, final String name) {
        setNaturalId(naturalId);
        setId(id);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static Builder builder() {
        return new Builder();
    }

    /**
     * The builder for the {@link District}
     */
    public static class Builder {
        private String name;
        private Integer id;
        private String naturalId;

        public District build() {
            return new District(id, naturalId, name);
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withId(Integer id) {
            this.id = id;
            return this;
        }

        public Builder withNaturalId(String naturalId) {
            this.naturalId = naturalId;
            return this;
        }
    }
}
