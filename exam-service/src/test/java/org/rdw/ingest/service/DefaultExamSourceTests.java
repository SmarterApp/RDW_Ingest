package org.rdw.ingest.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rdw.ingest.service.DefaultExamSource;
import org.rdw.ingest.service.ExamSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.stream.binder.BinderFactory;
import org.springframework.cloud.stream.test.binder.MessageCollector;
import org.springframework.http.MediaType;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DefaultExamSourceTests {

    @Autowired
    private ExamSource examSource;

    @Autowired
    private BinderFactory binderFactory;

    @Autowired
    private MessageCollector messageCollector;

    @Test(expected = NullPointerException.class)
    public void itRequiresAnOutputChannel() {
        new DefaultExamSource(null);
    }

    @Test
    public void submitExamShouldSetHeadersAndSendMessage() {
        final String body = "<TDSReport/>";

        examSource.submitExam(body);

        final Message message = messageCollector.forChannel(((DefaultExamSource)examSource).getOutput()).poll();
        assertThat(message.getPayload()).isEqualTo(body);
        assertThat(message.getHeaders().get(MessageHeaders.CONTENT_TYPE)).isEqualTo(MediaType.APPLICATION_XML);
    }
}
