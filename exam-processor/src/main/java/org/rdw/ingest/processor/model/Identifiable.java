package org.rdw.ingest.processor.model;


import javax.validation.constraints.Null;

/**
 * Something that is identified by an id.
 *
 * @param <T> the type of its id
 */
public abstract class Identifiable<T> {

    @Null
    T id;

    /**
     * @return its id
     */
    public T getId() {
        return id;
    }

}
