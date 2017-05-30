-- Delete imports loaded by initial dml.
DELETE FROM warehouse_test.import
WHERE id = 1;

-- Add import id's so codes are migrated
INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-99, 1, 3, 'application/xml', 'hash-code', 'batch', 'dwtest@example.com');