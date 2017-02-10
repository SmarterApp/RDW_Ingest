package org.rdw.ingest.model;

import com.google.common.base.Strings;

import java.time.Instant;
import java.util.UUID;

import static java.time.Instant.now;

/**
 * An import request.
 */
public class RdwImport {
    private String id;
    private String content;
    private ImportStatus status;
    private String batchId;
    private String creator;
    private Instant created;

    public String getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public ImportStatus getStatus() {
        return status;
    }

    public String getBatchId() {
        return batchId;
    }

    public String getCreator() {
        return creator;
    }

    public Instant getCreated() {
        return created;
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private String id;
        private String content;
        private ImportStatus status;
        private String batchId;
        private String creator;

        public RdwImport build() {
            if (Strings.isNullOrEmpty(id)) {
                randomId();
            }

            final RdwImport rdwImport = new RdwImport();
            rdwImport.id = id;
            rdwImport.content = content;
            rdwImport.status = status;
            rdwImport.batchId = batchId;
            rdwImport.creator = creator;
            rdwImport.created = now();
            return rdwImport;
        }

        public Builder id(final String id) {
            this.id = id;
            return this;
        }

        public Builder randomId() {
            return id(UUID.randomUUID().toString());
        }

        public Builder content(final String content) {
            this.content = content;
            return this;
        }

        public Builder status(final ImportStatus status) {
            this.status = status;
            return this;
        }

        public Builder batchId(final String batchId) {
            this.batchId = batchId;
            return this;
        }

        public Builder creator(final String creator) {
            this.creator = creator;
            return this;
        }
    }
}
