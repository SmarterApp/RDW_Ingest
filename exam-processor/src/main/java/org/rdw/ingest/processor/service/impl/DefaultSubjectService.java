package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.service.SubjectService;
import org.springframework.stereotype.Service;

@Service
public class DefaultSubjectService implements SubjectService {
    @Override
    public int toId(String code) {
        //TODO:
        return 1;
    }
}
