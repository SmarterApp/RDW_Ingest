-- Delete imports loaded by initial dml.
DELETE FROM warehouse_test.import
WHERE id = 1;

-- Content types
-- 1	EXAM
-- 2	PACKAGE
-- 3	CODES
-- 4  ORGANIZATION
-- 5  GROUPS

-- Add import id's so content type is set up in "warehouse" step.

INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-1, 1, 4, 'application/xml', 'hash-school', 'batch', 'dwtest@example.com');

INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-2, 1, 2, 'application/xml', 'hash-asmt', 'batch', 'dwtest@example.com');

INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-79, 1, 5, 'application/xml', 'hash-group', 'batch', 'dwtest@example.com');

INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-89, 1, 5, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-88, 1, 5, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-87, 1, 5, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-86, 1, 5, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com');

INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-90, 1, 1, 'application/xml', 'hash-iab_exam', 'batch', 'dwtest@example.com');

INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-99, 1, 3, 'application/xml', 'hash-code', 'batch', 'dwtest@example.com');