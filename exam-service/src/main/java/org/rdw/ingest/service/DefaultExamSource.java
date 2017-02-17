package org.rdw.ingest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.http.MediaType;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;
import rdw.messaging.RdwMessageHeaderAccessor;

import javax.validation.constraints.NotNull;

import static com.google.common.base.Preconditions.checkNotNull;
import static rdw.messaging.RdwMessageHeaderAccessor.wrap;

/**
 * Default implementation of ExamSource
 * TODO - should we do MessageProducerSupport stuff instead?
 */
@Service
@EnableBinding(Source.class)
public class DefaultExamSource implements ExamSource {

    private final MessageChannel output;

    @Autowired
    DefaultExamSource(@NotNull final MessageChannel output) {
        this.output = checkNotNull(output);
    }

    MessageChannel getOutput() {
        return output;
    }

    @Override
    public void submitExam(final String body) {
        final RdwMessageHeaderAccessor accessor = wrap(null);
        // TODO - default message headers (id, timestamp)
        // TODO - rdw-specific headers (user login, tenancy chain)
        // TODO - get media type from http request
        accessor.setContentType(MediaType.APPLICATION_XML);
        accessor.setContent("exams");

        output.send(MessageBuilder.createMessage(body, accessor.getMessageHeaders()));
    }
}
