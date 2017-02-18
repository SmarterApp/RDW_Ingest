package org.rdw.ingest.processor;

import com.google.common.io.CharStreams;
import org.junit.Before;
import org.junit.Test;
import org.rdw.ingest.processor.service.ExamService;
import org.springframework.http.MediaType;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.GenericMessage;
import rdw.messaging.RdwMessageHeaderAccessor;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

import static org.mockito.Mockito.mock;

public class ExamProcessorConfigurationTest {

    private ExamProcessorConfiguration processor;
    private ExamService service;

    @Before
    public void createProcessor() {
        service = mock(ExamService.class);
        processor = new ExamProcessorConfiguration();
        processor.setExamService(service);
    }

    @Test
    public void itShouldProcessMessageWithXmlContent() throws IOException {
        final RdwMessageHeaderAccessor accessor = RdwMessageHeaderAccessor.wrap(null);
        accessor.setContent("exams");
        accessor.setContentType(MediaType.APPLICATION_XML);

        final String tdsReport;
        try (final Reader reader = new InputStreamReader(this.getClass().getResourceAsStream("/TDSReport.sample.xml"))) {
            tdsReport = CharStreams.toString(reader);
        }
        final Message message = new GenericMessage(tdsReport, accessor.getMessageHeaders());
        processor.process(message);
    }
}