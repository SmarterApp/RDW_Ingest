-- todo: remove this from initial dml
INSERT INTO warehouse_test.import(id, status, content, contentType, digest) VALUES
  (1, 1, 3, 'initial load', 'initial load');

-- Delete completed migration import id's in reporting
DELETE FROM reporting_test.migrate
WHERE id IN (-1, -2);

-- Delete imports
DELETE FROM warehouse_test.import
WHERE id IN (-1000, -999, -998, -997, -996, -995, -994, -993, -992, -991);

