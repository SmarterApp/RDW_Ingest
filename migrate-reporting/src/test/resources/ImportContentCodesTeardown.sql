-- todo: remove this from initial dml
INSERT INTO warehouse_test.import (id, status, content, contentType, digest) VALUES
  (1, 1, 3, 'initial load', 'initial load');

-- Delete imports
DELETE FROM warehouse_test.import
WHERE id IN (-99);