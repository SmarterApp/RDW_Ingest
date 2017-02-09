package org.rdw.ingest.processor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.messaging.Message;
import rdw.model.TDSReport;

@EnableBinding(Processor.class)
public class ExamProcessorConfiguration {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessorConfiguration.class);

    @ServiceActivator(inputChannel = Processor.INPUT, outputChannel = Processor.OUTPUT)
    public Object process(final Message<?> message) {
        final TDSReport report = (TDSReport) message.getPayload();
        logger.info(report.toString());
        return message;
    }
}
