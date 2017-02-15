package org.rdw.ingest.auth;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import rdw.utils.TenancyChain;

import java.util.Collection;

/**
 * Extend user to store tenancy chain.
 */
public class RdwUser extends User {

    private final TenancyChain tenancyChain;

    public static RdwUser copy(final RdwUser user) {
        return new RdwUser(user.getUsername(), user.getPassword(), user.getAuthorities(), user.getTenancyChain());
    }

    public RdwUser(final String username,
                   final String password,
                   final Collection<? extends GrantedAuthority> authorities,
                   final TenancyChain tenancyChain) {
        super(username, password, authorities);
        this.tenancyChain = tenancyChain;
    }

    public TenancyChain getTenancyChain() {
        return tenancyChain;
    }
}
