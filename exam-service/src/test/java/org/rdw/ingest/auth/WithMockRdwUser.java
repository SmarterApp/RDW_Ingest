package org.rdw.ingest.auth;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.test.context.support.WithSecurityContext;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * Annotation to support mocking an RdwUser
 */
@Retention(RetentionPolicy.RUNTIME)
@WithSecurityContext(factory = WithMockRdwUserSecurityContextFactory.class)
public @interface WithMockRdwUser {
    String username() default "test@example.com";
    String[] authorities() default { "ASMTDATALOAD" };
    String password() default "password";
    String tenancyChain() default "||ASMTDATALOAD|||SBAC|||||||||||||";
}
