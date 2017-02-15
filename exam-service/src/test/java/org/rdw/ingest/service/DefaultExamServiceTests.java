package org.rdw.ingest.service;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.rdw.ingest.auth.RdwUser;
import org.rdw.ingest.auth.RdwUserTests;
import rdw.utils.TenancyChain;

import java.util.ArrayList;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;

public class DefaultExamServiceTests {

    private DefaultExamService service;
    private ExamSource examSource;

    @Before
    public void createService() {
        examSource = Mockito.mock(ExamSource.class);
        service = new DefaultExamService(examSource);
    }

    @Test(expected = NullPointerException.class)
    public void itRequiresAnExamSource() {
        new DefaultExamSource(null);
    }

    @Test
    public void importExamReturnsImport() {
        final RdwUser user = RdwUserTests.testUser();
        final String body = "<TDSReport/>";
        final String contentType = "application/xml";
        final String batchId = "123";
        assertThat(service.importExam(user, body, contentType, batchId).getBatchId()).isEqualTo(batchId);
        verify(examSource).submitExam(user, body, contentType);
    }

    @Test
    public void getImportIsMockedForIdStartingWithA() {
        assertThat(service.getImport("abc").isPresent()).isFalse();
    }

    @Test
    public void getImportIsMockedForId() {
        final String id = "123456";
        assertThat(service.getImport(id).get().getId()).isEqualTo(id);
    }
}
