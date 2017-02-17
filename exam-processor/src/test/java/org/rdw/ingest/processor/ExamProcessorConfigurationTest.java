package org.rdw.ingest.processor;

import org.junit.Before;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.GenericMessage;
import rdw.messaging.RdwMessageHeaderAccessor;

import java.io.UnsupportedEncodingException;

public class ExamProcessorConfigurationTest {

    private ExamProcessorConfiguration processor;

    @Before
    public void createProcessor() {
        processor = new ExamProcessorConfiguration();
    }

    @Test
    public void itShouldProcessMessageWithXmlContent() throws UnsupportedEncodingException {
        final RdwMessageHeaderAccessor accessor = RdwMessageHeaderAccessor.wrap(null);
        accessor.setContent("exams");
        accessor.setContentType(MediaType.APPLICATION_XML);
        final Message message = new GenericMessage("<TDSReport/>", accessor.getMessageHeaders());
        processor.process(message);
    }
}