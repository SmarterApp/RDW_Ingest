package org.rdw.ingest.auth;

import com.google.common.collect.Lists;
import org.junit.Test;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import rdw.utils.TenancyChain;

import static org.assertj.core.api.Assertions.assertThat;

public class RdwUserTests {

    // returns a test user with the same defaults as WithMockRdwUser
    public static RdwUser testUser() {
        return new RdwUser("test@example.com", "password",
                Lists.newArrayList(new SimpleGrantedAuthority("ASMTDATALOAD")),
                TenancyChain.fromString("||ASMTDATALOAD|||SBAC|||||||||||||"));
    }

    @Test
    public void itShouldPreserveConstructorValues() {
        final RdwUser user = testUser();
        assertThat(user.getUsername()).isEqualTo("test@example.com");
        assertThat(user.getTenancyChain().toString()).isEqualTo("||ASMTDATALOAD|||SBAC|||||||||||||");
    }
}
