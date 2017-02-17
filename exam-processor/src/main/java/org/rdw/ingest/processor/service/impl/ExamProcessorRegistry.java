package org.rdw.ingest.processor.service.impl;

import org.rdw.ingest.processor.service.ExamProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.collect.Maps.newLinkedHashMap;

/**
 * Registry for finding {@link ExamProcessor}s.
 */
@Component
class ExamProcessorRegistry {
    private final Map<String, ExamProcessor> reportProcessorFactory;

    @Autowired
    public ExamProcessorRegistry(final List<ExamProcessor> processors) {
        checkArgument(!processors.isEmpty(), "processors must be not empty");

        reportProcessorFactory = newLinkedHashMap();
        for (final ExamProcessor processor : processors) {
            reportProcessorFactory.put(processor.getType(), processor);
        }
    }

    public ExamProcessor getByType(final String type) {
        return reportProcessorFactory.get(type);
    }
}

