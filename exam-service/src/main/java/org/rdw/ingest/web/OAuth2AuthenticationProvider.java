package org.rdw.ingest.web;

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
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.DefaultOAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.token.grant.password.ResourceOwnerPasswordResourceDetails;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static org.rdw.ingest.web.SecurityConfig.DataLoadRole;

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

    private Cache<String, UserDetails> userCache;
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

        UserDetails user = userCache.getIfPresent(auth.getName());
        if (user == null) {
            final OAuth2RestTemplate template = template(auth);
            try {
                final OAuth2AccessToken token = template.getAccessToken();
                if (token.isExpired()) {
                    throw new RuntimeException("token is expired");
                }
                final Map tokenInfo = template.getForObject(oauth2Properties.getTokenInfoUri(), Map.class,
                        Collections.singletonMap("access_token", token.getValue()));
                final String tenancyChain = (String) tokenInfo.get("sbacTenancyChain");
                if (StringUtils.isEmpty(tenancyChain)) {
                    throw new RuntimeException("user doesn't have a SBAC tenancy chain");
                }

                // TODO - make this more robust parsing of tenancy chain to get all roles (by tenant)
                // TODO   for now, all we care about is the data load role
                // TODO - it would be nice to preserve the tenancy chain somewhere in user/auth?
                final List<GrantedAuthority> authorities = new ArrayList<>();
                if (tenancyChain.contains(DataLoadRole)) {
                    authorities.add(new SimpleGrantedAuthority(DataLoadRole));
                }

                user = new User(auth.getName(), (String) auth.getCredentials(), authorities);
                userCache.put(user.getUsername(), user);

                logger.info(auth.getName() + " authenticated");

            } catch (final Exception ignored) {
                logger.info(auth.getName() + " not authenticated", ignored.getMessage());
                throw new BadCredentialsException(auth.getName());
            }
        }

        // need to copy cached user that we created, since framework will mess with auth token principal
        final UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(
                new User(user.getUsername(), user.getPassword(), user.getAuthorities()), user.getPassword(), user.getAuthorities());
        result.setDetails(auth.getDetails());

        return result;
    }

    @Override
    public boolean supports(final Class<?> aClass) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(aClass);
    }

    private OAuth2RestTemplate template(final UsernamePasswordAuthenticationToken auth) {
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
        resource.setUsername(auth.getName());
        resource.setPassword((String) auth.getCredentials());
        return new OAuth2RestTemplate(resource, new DefaultOAuth2ClientContext());
    }
}
