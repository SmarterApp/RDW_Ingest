package org.rdw.ingest.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rdw.ingest.auth.RdwUser;
import org.rdw.ingest.auth.RdwUserTests;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.stream.binder.BinderFactory;
import org.springframework.cloud.stream.test.binder.MessageCollector;
import org.springframework.http.MediaType;
import org.springframework.messaging.Message;
import org.springframework.test.context.junit4.SpringRunner;
import rdw.messaging.RdwMessageHeaderAccessor;
import rdw.utils.TenancyChain;

import static org.assertj.core.api.Assertions.assertThat;
import static rdw.messaging.RdwMessageHeaderAccessor.wrap;

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
        final RdwUser user = RdwUserTests.testUser();
        final String body = "<TDSReport/>";

        examSource.submitExam(user, body, "application/xml");

        final Message message = messageCollector.forChannel(((DefaultExamSource)examSource).getOutput()).poll();
        final RdwMessageHeaderAccessor accessor = wrap(message);
        assertThat(message.getPayload()).isEqualTo(body);
        assertThat(accessor.getContentType()).isEqualTo(MediaType.APPLICATION_XML);
        assertThat(accessor.getUserLogin()).isEqualTo(user.getUsername());
        assertThat(accessor.getUserTenancyChain()).isEqualTo(user.getTenancyChain().toString());
    }
}
