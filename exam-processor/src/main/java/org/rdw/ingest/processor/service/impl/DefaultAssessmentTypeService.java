package org.rdw.ingest.processor.service.impl;


import org.rdw.ingest.processor.repository.AssessmentTypeRepository;
import org.rdw.ingest.processor.service.AssessmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//TODO: consider a common approach for caching this and similar codes
@Service
class DefaultAssessmentTypeService implements AssessmentTypeService {
    @Autowired
    AssessmentTypeRepository assessmentTypeRepository;

    @Override
    public String toCode(int id) {
        return assessmentTypeRepository.toCode(id);
    }
}
