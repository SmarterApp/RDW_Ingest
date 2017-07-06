-- Completed migration import id's in reporting
-- First migrate completed does not exist in warehouse, just for testing
INSERT INTO reporting_test.migrate (id, job_id, status, first_import_id, last_import_id) VALUES
  (-10, 1, 20, -1020, -1011),
  (-9, 2, 20, -1010, -1001);

-- Test import records in warehouse
-- 1	EXAM
-- 2	PACKAGE
-- 3	CODES

-- Already migrated
INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-1010, 1, 2, 'application/xml', 'hash-asmt', 'batch', 'dwtest@example.com'),
  (-1009, 1, 2, 'application/xml', 'hash-asmt', 'batch', 'dwtest@example.com'),
  (-1008, 1, 2, 'application/xml', 'hash-school', 'batch', 'dwtest@example.com'),
  (-1007, 1, 2, 'application/xml', 'hash-school', 'batch', 'dwtest@example.com'),
  (-1006, 1, 2, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-1005, 1, 2, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-1004, 1, 2, 'application/xml', 'hash-group', 'batch', 'dwtest@example.com'),
  (-1003, 1, 1, 'application/xml', 'hash-iab_exam', 'batch', 'dwtest@example.com'),
  (-1002, 1, 1, 'application/xml', 'hash-iab_exam', 'batch', 'dwtest@example.com'),
  (-1001, 1, 1, 'application/xml', 'hash-exam', 'batch', 'dwtest@example.com');

-- Not yet migrated with a gap at -991 by status and -997 by missing.
INSERT INTO warehouse_test.import (id, status, content, contentType, digest, batch, creator) VALUES
  (-1000, 1, 2, 'application/xml', 'hash-asmt', 'batch', 'dwtest@example.com'),
  (-999, 1, 2, 'application/xml', 'hash-asmt', 'batch', 'dwtest@example.com'),
  (-998, 1, 2, 'application/xml', 'hash-school', 'batch', 'dwtest@example.com'),
  (-996, 1, 2, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-995, 1, 2, 'application/xml', 'hash-student', 'batch', 'dwtest@example.com'),
  (-994, 1, 2, 'application/xml', 'hash-group', 'batch', 'dwtest@example.com'),
  (-993, 1, 1, 'application/xml', 'hash-iab_exam', 'batch', 'dwtest@example.com'),
  (-992, 1, 1, 'application/xml', 'hash-iab_exam', 'batch', 'dwtest@example.com'),
  (-991, 2, 1, 'application/xml', 'hash-exam', 'batch', 'dwtest@example.com'),
  (-990, 1, 1, 'application/xml', 'hash-exam', 'batch', 'dwtest@example.com'),
  (-989, 1, 2, 'application/xml', 'hash-school', 'batch', 'dwtest@example.com');
