package org.rdw.ingest.processor.model;

import javax.validation.constraints.Null;

/**
 * Something that is identified by an id.
 *
 * @param <T> the type of its id
 */
public abstract class Identifiable<T> {

    @Null
    private T id;

    /**
     * @return its id
     */
    public T getId() {
        return id;
    }

    protected void setId(final T id) {
        this.id = id;
    }
}
