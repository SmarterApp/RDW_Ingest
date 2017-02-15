package org.rdw.ingest.processor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.messaging.Message;
import rdw.messaging.RdwMessageHeaderAccessor;

@EnableBinding(Sink.class)
public class ExamProcessorConfiguration {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessorConfiguration.class);

    @ServiceActivator(inputChannel = Processor.INPUT)
    public void process(final Message<?> message) {
        final RdwMessageHeaderAccessor accessor = RdwMessageHeaderAccessor.wrap(message);
        final String payload = (String) message.getPayload();
        logger.info("received " + accessor.getContent() + " from " + accessor.getUserLogin());
        logger.info(accessor.getContentType() + ": " + (payload.length() > 80 ? payload.substring(0, 80) + "..." : payload));
    }
}
