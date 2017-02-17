package org.rdw.ingest.processor.model;

/**
 * A school
 */
public class School extends IdentifiableWithNaturalId<Integer> {
    private String name;
    private District district;

    public School(Integer id, String naturalId, String name, District district) {
        this.name = name;
        this.district = district;
        setId(id);
        setNaturalId(naturalId);
    }

    public String getName() {
        return name;
    }

    public District getDistrict() {
        return district;
    }
}
