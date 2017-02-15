package org.rdw.ingest.service;

import org.rdw.ingest.auth.RdwUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
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
    public void submitExam(final RdwUser user, final String body, final String contentType) {
        final RdwMessageHeaderAccessor accessor = wrap(null)
                .setReceivedNow()
                .setContent("exams")
                .setUserLogin(user.getUsername())
                .setUserTenancyChain(user.getTenancyChain().toString())
                .setContentType(contentType);
        output.send(MessageBuilder.createMessage(body, accessor.getMessageHeaders()));
    }
}
