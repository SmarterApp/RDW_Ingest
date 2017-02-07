package org.rdw.ingest;

import org.junit.Before;
import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class ExamServiceTest {

    private ExamService service;

    @Before
    public void createService() {
        service = new DefaultExamService();
    }

    @Test(expected = UnsupportedOperationException.class)
    public void submitExamIsNotImplemented() {
        service.submitExam("<TDSReport/>", null);
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
