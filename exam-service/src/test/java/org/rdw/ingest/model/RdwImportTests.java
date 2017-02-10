package org.rdw.ingest.model;

import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class RdwImportTests {

    @Test
    public void itShouldRetainBuilderValues() {
        final RdwImport rdwImport = RdwImport.builder()
                .id("id")
                .batchId("batchId")
                .status(ImportStatus.ACCEPTED)
                .content("content")
                .creator("alice")
                .build();
        assertThat(rdwImport.getId()).isEqualTo("id");
        assertThat(rdwImport.getBatchId()).isEqualTo("batchId");
        assertThat(rdwImport.getStatus()).isEqualTo(ImportStatus.ACCEPTED);
        assertThat(rdwImport.getContent()).isEqualTo("content");
        assertThat(rdwImport.getCreator()).isEqualTo("alice");
    }

    @Test
    public void itShouldGenerateRandomIdAndCreated() {
        final RdwImport rdwImport = RdwImport.builder().build();
        assertThat(rdwImport.getId()).isNotEmpty();
        assertThat(rdwImport.getCreated()).isNotNull();
    }
}
