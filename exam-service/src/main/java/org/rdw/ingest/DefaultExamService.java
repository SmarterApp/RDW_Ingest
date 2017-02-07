package org.rdw.ingest;

import org.springframework.stereotype.Service;
import rdw.model.TDSReport;
import rdw.model.Test;

import java.util.Optional;

/**
 * Default implementation of ExamService
 */
@Service
class DefaultExamService implements ExamService {

    @Override
    public Optional<TDSReport> submitExam(final String xml, final String batchId) {
        throw new UnsupportedOperationException("submit exam not implemented");
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
