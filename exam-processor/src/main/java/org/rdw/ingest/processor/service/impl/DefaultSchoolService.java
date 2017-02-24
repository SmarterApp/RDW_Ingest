package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.model.School;
import org.rdw.ingest.processor.repository.SchoolRepository;
import org.rdw.ingest.processor.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
class DefaultSchoolService implements SchoolService {

    private SchoolRepository repository;

    @Autowired
    public DefaultSchoolService(final SchoolRepository repository) {
        this.repository = repository;
    }

    //TODO: implement a read through cache
    @Override
    public int findOrCreateByNaturalId(final School school) {
        return repository.findOrCreateByNaturalId(school);
    }
}
