package org.rdw.ingest.processor.model;

import com.mysql.jdbc.StringUtils;

import static com.google.common.base.Preconditions.checkArgument;

/**
 * Something that is identified by an natural id in addition to the internal id
 */
abstract class IdentifiableWithNaturalId<T> extends Identifiable<T> {

    private String naturalId;

    /**
     * @return its id
     */
    public String getNaturalId() {
        return naturalId;
    }

    protected void setNaturalId(final String naturalId) {
        checkArgument(!StringUtils.isNullOrEmpty(naturalId), "invalid natural id");
        this.naturalId = naturalId;
    }

}
