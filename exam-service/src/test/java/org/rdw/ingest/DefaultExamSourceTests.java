package org.rdw.ingest;

import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import org.springframework.http.MediaType;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHeaders;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;

public class DefaultExamSourceTests {

    private DefaultExamSource source;
    private MessageChannel output;

    @Before
    public void createSource() {
        source = new DefaultExamSource();
        output = Mockito.mock(MessageChannel.class);
        source.setOutput(output);
    }

    @Test
    public void submitExamShouldSetHeadersAndSendMessage() {
        final String body = "<TDSReport/>";
        source.submitExam(body);
        final ArgumentCaptor<Message> captor = ArgumentCaptor.forClass(Message.class);
        verify(output).send(captor.capture());
        final Message message = captor.getValue();
        assertThat(message.getPayload()).isEqualTo(body);
        assertThat(message.getHeaders().get(MessageHeaders.CONTENT_TYPE)).isEqualTo(MediaType.APPLICATION_XML);
    }
}
