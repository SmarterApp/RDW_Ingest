package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.service.EthnicityService;
import org.rdw.ingest.processor.service.GenderService;
import org.springframework.stereotype.Service;


@Service
public class DefaultEthnicityService implements EthnicityService{
    @Override
    public int toId(String code) {
        return 0;
    }
}
