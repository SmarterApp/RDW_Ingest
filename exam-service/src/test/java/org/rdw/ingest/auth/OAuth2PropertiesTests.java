package org.rdw.ingest.auth;

import org.junit.Test;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.test.util.EnvironmentTestUtils;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Configuration;

import static org.assertj.core.api.Assertions.assertThat;

public class OAuth2PropertiesTests {

    @Configuration
    @EnableConfigurationProperties(OAuth2Properties.class)
    static class Conf {
    }

    @Test
    public void defaultValues() {
        final AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
        context.register(Conf.class);
        context.refresh();
        final OAuth2Properties properties = context.getBean(OAuth2Properties.class);
        assertThat(properties.getTokenInfoUri()).isNull();
        assertThat(properties.getCache().getSize()).isEqualTo(10);
        assertThat(properties.getCache().getExpire()).isEqualTo(15);
    }

    @Test
    public void valuesCanBeCustomized() {
        final AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
        EnvironmentTestUtils.addEnvironment(context, "oauth2.token-info-uri=https://localhost/auth/oauth2/tokeninfo");
        EnvironmentTestUtils.addEnvironment(context, "oauth2.cache.size=100");
        EnvironmentTestUtils.addEnvironment(context, "oauth2.cache.expire=5");
        context.register(Conf.class);
        context.refresh();
        final OAuth2Properties properties = context.getBean(OAuth2Properties.class);
        assertThat(properties.getTokenInfoUri()).isEqualTo("https://localhost/auth/oauth2/tokeninfo");
        assertThat(properties.getCache().getSize()).isEqualTo(100);
        assertThat(properties.getCache().getExpire()).isEqualTo(5);
    }
}
