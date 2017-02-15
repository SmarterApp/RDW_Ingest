package org.rdw.ingest.auth;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.DefaultOAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.token.grant.password.ResourceOwnerPasswordResourceDetails;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.stereotype.Component;
import rdw.utils.TenancyChain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static org.rdw.ingest.auth.SecurityConfig.DataLoadRole;

/**
 * This auth provider acts as an adapter between basic auth from the clients of our RESTful API and the
 * credentials stored in our IDP which are accessed via oauth2. If things change so our clients are aware
 * of oauth2 and use it fully, this can go away and we can use magick Spring wiring (i think).
 */
@Component
@EnableConfigurationProperties({OAuth2Properties.class})
@EnableOAuth2Client
public class OAuth2AuthenticationProvider implements AuthenticationProvider {
    private static final Logger logger = LoggerFactory.getLogger(OAuth2AuthenticationProvider.class);

    private Cache<String, RdwUser> userCache;
    private OAuth2Properties oauth2Properties;

    @Autowired
    void setProperties(final OAuth2Properties oauth2Properties) {
        this.oauth2Properties = oauth2Properties;
        this.userCache = CacheBuilder.newBuilder()
                .maximumSize(oauth2Properties.getCache().getSize())
                .expireAfterWrite(oauth2Properties.getCache().getExpire(), TimeUnit.MINUTES)
                .build();
    }

    @Override
    public Authentication authenticate(final Authentication authentication) throws AuthenticationException {
        if (!supports(authentication.getClass())) return authentication;

        final UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) authentication;
        final String username = auth.getName();
        final String password = (String) auth.getCredentials();

        RdwUser user = userCache.getIfPresent(username+password);
        if (user == null) {
            final OAuth2RestTemplate template = template(username, password);
            try {
                final OAuth2AccessToken token = template.getAccessToken();
                if (token.isExpired()) {
                    throw new RuntimeException("token is expired");
                }
                final Map tokenInfo = template.getForObject(oauth2Properties.getTokenInfoUri(), Map.class,
                        Collections.singletonMap("access_token", token.getValue()));
                final TenancyChain chain = TenancyChain.fromString((String) tokenInfo.get("sbacTenancyChain"));
                if (chain.isEmpty()) {
                    throw new RuntimeException("user doesn't have a SBAC tenancy chain");
                }

                // extract roles from tenancy chain
                // TODO - should this be client-specific? i.e. chain.hasRoleForClient(DataLoadRole)
                final List<GrantedAuthority> authorities = new ArrayList<>();
                if (chain.hasRole(DataLoadRole)) {
                    authorities.add(new SimpleGrantedAuthority(DataLoadRole));
                }

                user = new RdwUser(username, password, authorities, chain);
                userCache.put(username+password, user);

                logger.info(auth.getName() + " authenticated");

            } catch (final Exception ignored) {
                logger.info(auth.getName() + " not authenticated", ignored.getMessage());
                throw new BadCredentialsException(auth.getName());
            }
        }

        // need to copy cached user that we created, since framework will mess with auth token principal
        final UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(
                RdwUser.copy(user), user.getPassword(), user.getAuthorities());
        result.setDetails(auth.getDetails());

        return result;
    }

    @Override
    public boolean supports(final Class<?> aClass) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(aClass);
    }

    private OAuth2RestTemplate template(final String username, final String password) {
        final ResourceOwnerPasswordResourceDetails resource = new ResourceOwnerPasswordResourceDetails();
        resource.setId(oauth2Properties.getId());
        resource.setTokenName(oauth2Properties.getTokenName());
        resource.setGrantType(oauth2Properties.getGrantType());
        resource.setClientId(oauth2Properties.getClientId());
        resource.setClientSecret(oauth2Properties.getClientSecret());
        resource.setAuthenticationScheme(oauth2Properties.getAuthenticationScheme());
        resource.setAccessTokenUri(oauth2Properties.getAccessTokenUri());
        resource.setClientAuthenticationScheme(oauth2Properties.getClientAuthenticationScheme());
        resource.setScope(oauth2Properties.getScope());
        resource.setUsername(username);
        resource.setPassword(password);
        return new OAuth2RestTemplate(resource, new DefaultOAuth2ClientContext());
    }
}
