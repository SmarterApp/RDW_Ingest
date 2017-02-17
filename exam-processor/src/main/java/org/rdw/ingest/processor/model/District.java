package org.rdw.ingest.processor.model;

/**
 * A district
 */
public class District extends IdentifiableWithNaturalId<Integer> {
    private String name;

    public District(final int id, final String name, final String naturalId) {
        setNaturalId(naturalId);
        setId(id);
        this.name = name;
    }
}
