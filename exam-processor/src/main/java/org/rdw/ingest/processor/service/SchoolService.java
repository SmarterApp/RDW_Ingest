package org.rdw.ingest.processor.service;

import org.rdw.ingest.processor.model.School;


public interface SchoolService {
    int findOrCreate(School school);
}
