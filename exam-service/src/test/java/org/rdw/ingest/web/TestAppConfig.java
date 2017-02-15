package org.rdw.ingest.web;

import org.rdw.ingest.auth.SecurityConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Pretty sure i'm cheating with this. This is from the instructions for getting @WithMockUser working in tests.
 * But the example wasn't using the same annotations we are (older vs. newer spring boot stuff). However,
 * dropping this puppy into the test folder makes the annotations do what they should. If you can get rid of
 * this config class and still have the @withMockUser annotation work ... please do!
 */
@Configuration
@ComponentScan({"org.rdw.ingest.web", "org.rdw.ingest.auth"})
@EnableWebMvc
@Import({SecurityConfig.class})
class TestAppConfig {
}
