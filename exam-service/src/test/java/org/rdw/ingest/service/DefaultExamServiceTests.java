package org.rdw.ingest.service;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

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
    public void submitExamReturnsMockExam123() {
        String body = "<TDSReport/>";
        assertThat(service.submitExam(body, null).get().getTest().getTestId()).isEqualTo("123");
        verify(examSource).submitExam(body);
    }

    @Test
    public void getExamIsMockedForIdStartingWithA() {
        assertThat(service.getExam("abc").isPresent()).isFalse();
    }

    @Test
    public void getExamIsMockedForId() {
        final String id = "123456";
        assertThat(service.getExam(id).get().getTest().getTestId()).isEqualTo(id);
    }
}
