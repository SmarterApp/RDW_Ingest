package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.service.GenderService;
import org.springframework.stereotype.Service;


@Service
public class DefaultGenderService implements GenderService{
    @Override
    public int toId(String code) {
        return 0;
    }
}
