package org.rdw.ingest.auth;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;
import org.springframework.security.oauth2.client.resource.BaseOAuth2ProtectedResourceDetails;

@ConfigurationProperties("oauth2")
public class OAuth2Properties extends BaseOAuth2ProtectedResourceDetails {

    /**
     * URI for oauth token info end-point
     */
    private String tokenInfoUri;

    /**
     * Cache of user credentials
     */
    @NestedConfigurationProperty
    private CacheProperties cache = new CacheProperties();

    public OAuth2Properties() {
        setGrantType("password");
    }

    public String getTokenInfoUri() {
        return tokenInfoUri;
    }

    public void setTokenInfoUri(String tokenInfoUri) {
        this.tokenInfoUri = tokenInfoUri;
    }

    public CacheProperties getCache() {
        return cache;
    }

    public void setCache(final CacheProperties cache) {
        this.cache = cache;
    }

    public static class CacheProperties {
        /**
         * Size of cache, i.e. number of user credentials to keep
         */
        private int size = 10;

        /**
         * Expire time for cache entries, in minutes
         */
        private int expire = 15;

        public int getSize() {
            return size;
        }

        public void setSize(final int size) {
            this.size = size;
        }

        public int getExpire() {
            return expire;
        }

        public void setExpire(final int expire) {
            this.expire = expire;
        }
    }
}
