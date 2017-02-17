package org.rdw.ingest.service;

import org.rdw.ingest.model.ImportStatus;
import org.rdw.ingest.model.RdwImport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public RdwImport importExam(final String xml, final String batchId) {
        // TODO - do we pass in user or steal credentials from thread local?
        // TODO - do we need/want to set contentType of payload as part of import record?
        final RdwImport rdwImport = RdwImport.builder()
                .batchId(batchId)
                .content("exam")
                .status(ImportStatus.ACCEPTED)
                .build();

        // TODO - what do we really want to inject into workflow pipeline?
        source.submitExam(xml);

        return rdwImport;
    }

    @Override
    public Optional<RdwImport> getImport(final String id) {
        // just so we get some not-found action
        if (id.startsWith("a")) return Optional.empty();

        return Optional.of(RdwImport.builder()
                .id(id)
                .content("exam")
                .status(ImportStatus.PROCESSED)
                .build());
    }
}
