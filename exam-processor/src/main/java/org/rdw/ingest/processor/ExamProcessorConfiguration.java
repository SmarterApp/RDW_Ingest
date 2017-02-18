package org.rdw.ingest.processor;

import org.rdw.ingest.processor.service.ExamService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Processor;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.messaging.Message;
import rdw.messaging.RdwMessageHeaderAccessor;
import rdw.model.TDSReport;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;

import static rdw.model.XmlUtils.tdsReportFromXml;

@EnableBinding(Sink.class)
public class ExamProcessorConfiguration {
    private static final Logger logger = LoggerFactory.getLogger(ExamProcessorConfiguration.class);

    private ExamService service;

    @Autowired
    void setExamService(final ExamService service) {
        this.service = service;
    }

    @ServiceActivator(inputChannel = Processor.INPUT)
    public void process(final Message<?> message) throws UnsupportedEncodingException {
        final RdwMessageHeaderAccessor accessor = RdwMessageHeaderAccessor.wrap(message);
        final String payload = (String) message.getPayload();
        logger.info("received " + accessor.getContent() + " from " + accessor.getUserLogin());
        logger.info(accessor.getContentType() + ": " + (payload.length() > 80 ? payload.substring(0, 80) + "..." : payload));

        final TDSReport report = tdsReportFromXml(new ByteArrayInputStream(payload.getBytes("UTF-8")));
        //TODO: need to do something with the message header
        service.process(report);
        //TODO: need to do post-processing: provenance and status update-?
    }
}
