package org.rdw.ingest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.http.MediaType;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.MessageBuilder;
import rdw.messaging.RdwMessageHeaderAccessor;

import static rdw.messaging.RdwMessageHeaderAccessor.wrap;

/**
 * Default implementation of ExamSource
 * TODO - should we do MessageProducerSupport stuff instead?
 */
@EnableBinding(Source.class)
public class DefaultExamSource implements ExamSource {

    private MessageChannel output;

    @Autowired
    public void setOutput(final MessageChannel output) {
        this.output = output;
    }

    @Override
    public void submitExam(final String body) {
        final RdwMessageHeaderAccessor accessor = wrap(null);
        // TODO - rdw-specific headers
        accessor.setContentType(MediaType.APPLICATION_XML);

        output.send(MessageBuilder.createMessage(body, accessor.getMessageHeaders()));
    }
}
