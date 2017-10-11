-- Delete imports loaded by initial dml.
DELETE FROM import;

-- Content type- 3 = CODES
INSERT INTO import (id, status, content, contentType, digest, batch, creator, created, updated) VALUES
  (2000,  1, 2, 'application/xml', 'student-future',  'batch', 'dwtest@example.com', '2017-08-18 20:09:33.966000', '2017-07-18 20:16:34.966000'),
  (-1,    1, 4, 'application/xml', 'hash-school-99',  'batch', 'dwtest@example.com', '2017-07-18 20:08:13.966000', '2017-07-18 20:14:34.966000'),
  (-2,   -1, 4, 'application/xml', 'hash-school-98',  'batch', 'dwtest@example.com', '2017-07-18 20:08:12.966000', '2017-07-18 20:13:34.966000'),
  (-7,    0, 3, 'application/xml', 'hash-school-98',  'batch', 'dwtest@example.com', '2017-07-18 20:08:11.966000', '2017-07-18 20:08:11.966000'),
  (-20,   1, 2, 'application/xml', 'hash-asmt',       'batch', 'dwtest@example.com', '2017-07-18 19:07:10.966000', '2017-07-18 19:05:34.966000'),
  (-78,   0, 5, 'application/xml', 'hash-group',      'batch', 'dwtest@example.com', '2017-07-18 19:07:10.966000', '2017-07-18 19:11:34.966000'),
  (-79,   1, 5, 'application/xml', 'hash-group',      'batch', 'dwtest@example.com', '2017-07-18 19:07:09.966000', '2017-07-18 19:10:34.966000'),
  (-84,   0, 5, 'application/xml', 'hash-student',    'batch', 'dwtest@example.com', '2017-07-18 19:06:09.966000', '2017-07-18 19:06:09.966000'),
  (-86,   1, 5, 'application/xml', 'hash-student',    'batch', 'dwtest@example.com', '2017-07-18 19:06:08.966000', '2017-07-18 19:09:34.966000'),
  (-87,   1, 5, 'application/xml', 'hash-student',    'batch', 'dwtest@example.com', '2017-07-18 19:06:07.966000', '2017-07-18 19:09:34.966000'),
  (-88,  -1, 5, 'application/xml', 'hash-student',    'batch', 'dwtest@example.com', '2017-07-18 19:06:06.966000', '2017-07-18 19:08:34.966000'),
  (-89,  -1, 5, 'application/xml', 'hash-student',    'batch', 'dwtest@example.com', '2017-07-18 19:05:05.966000', '2017-07-18 19:06:00.966000'),
  (-90,   1, 1, 'application/xml', 'hash-iab_exam',   'batch', 'dwtest@example.com', '2017-07-18 19:05:04.966000', '2017-07-18 19:06:35.966000'),
  (-99,   1, 3, 'application/xml', 'hash-code',       'batch', 'dwtest@example.com', '2017-07-18 19:05:03.966000', '2017-07-18 19:06:34.966000'),
  (-5000, 1, 2, 'application/xml', 'hash-preload',    'batch', 'dwtest@example.com', '2017-05-18 19:05:33.966000', '2017-05-18 19:06:34.966000');