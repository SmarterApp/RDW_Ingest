package org.rdw.ingest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rdw.model.TDSReport;
import rdw.model.Test;

import javax.validation.constraints.NotNull;
import java.util.Optional;

import static com.google.common.base.Preconditions.checkNotNull;

/**
 * Default implementation of ExamService
 */
@Service
class DefaultExamService implements ExamService {

    private final ExamSource source;

    @Autowired
    DefaultExamService(@NotNull final ExamSource source) {
        this.source = checkNotNull(source);
    }

    @Override
    public Optional<TDSReport> submitExam(final String xml, final String batchId) {
        source.submitExam(xml);
        return getExam("123");
    }

    @Override
    public Optional<TDSReport> getExam(final String id) {
        if (id.startsWith("a")) return Optional.empty();

        final TDSReport report = new TDSReport();
        final Test test = new Test();
        test.setTestId(id);
        report.setTest(test);

        return Optional.of(report);
    }
}
