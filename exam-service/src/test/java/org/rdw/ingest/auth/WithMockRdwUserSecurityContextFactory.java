package org.rdw.ingest.auth;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.test.context.support.WithSecurityContextFactory;
import rdw.utils.TenancyChain;

import java.util.stream.Collectors;
import java.util.stream.Stream;

public class WithMockRdwUserSecurityContextFactory implements WithSecurityContextFactory<WithMockRdwUser> {
    @Override
    public SecurityContext createSecurityContext(final WithMockRdwUser annotation) {
        SecurityContext context = SecurityContextHolder.createEmptyContext();

        final RdwUser user = new RdwUser(annotation.username(), annotation.password(),
                Stream.of(annotation.authorities()).map(SimpleGrantedAuthority::new).collect(Collectors.toList()),
                TenancyChain.fromString(annotation.tenancyChain()));
        context.setAuthentication(new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities()));
        return context;
    }
}
