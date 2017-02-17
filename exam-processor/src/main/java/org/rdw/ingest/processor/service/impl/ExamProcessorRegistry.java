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
        checkArgument(!processors.isEmpty(), "exam processors must be not empty");

        reportProcessorFactory = newLinkedHashMap();
        for (final ExamProcessor processor : processors) {
            reportProcessorFactory.put(processor.getType(), processor);
        }
    }

    /**
     * Returns an exam processor for the given exam type
     * @param examType a type of an exam to find a processor for
     * @return an exam processor of the requested type
     */
    public ExamProcessor getByType(final String examType) {
        return reportProcessorFactory.get(examType);
    }
}

