-- Delete imports loaded by initial dml.
DELETE FROM import;

-- breaking this into steps isn't at all necessary, it just helps tell the story

-- STEP 1
-- system is sitting around
INSERT INTO import (id, status, content, contentType, digest, creator, created, updated) VALUES
(-100, 1, 4, 'application/xml', 'olderImport', 'dwtest@example.com', '2017-07-18 12:08:00', '2017-07-18 12:08:01');

INSERT INTO district (id, name, natural_id) VALUES
(-1, 'District-1', 'natural_id-1');

INSERT INTO school (id, district_id, name, natural_id, deleted, import_id, update_import_id, created, updated) VALUES
(-1, -1, 'School-1', 'natural_id-1', 0, -100, -100, '2017-07-18 12:08:00', '2017-07-18 12:08:00');


-- STEP 2
-- big group import starts, and a couple groups are created and committed
INSERT INTO import (id, status, content, contentType, digest, creator, created, updated) VALUES
( -99, 0, 5, 'text/csv', 'largeGroup', 'dwtest@example.com', '2017-07-18 13:00:00', '2017-07-18 13:00:00');

INSERT INTO student_group (id, name, school_id, school_year, active, creator, import_id, update_import_id, deleted, created, updated) VALUES
-- a couple groups associated with large group import committed before migrate
(-30, 'Group-1a', -1, 2017, 1, 'dwtest@example.com', -99, -99, 0, '2017-07-18 13:00:02', '2017-07-18 13:00:02'),
(-29, 'Group-1b', -1, 2017, 1, 'dwtest@example.com', -99, -99, 0, '2017-07-18 13:00:03', '2017-07-18 13:00:03');


-- STEP 3
-- while big group is being processed some small group imports happen
INSERT INTO import (id, status, content, contentType, digest, creator, created, updated) VALUES
( -98, 1, 5, 'text/csv', 'smallGroup98', 'dwtest@example.com', '2017-07-18 13:00:03', '2017-07-18 13:00:04'),
( -97, 1, 5, 'text/csv', 'smallGroup97', 'dwtest@example.com', '2017-07-18 13:00:05', '2017-07-18 13:00:06'),
( -96, 1, 5, 'text/csv', 'smallGroup96', 'dwtest@example.com', '2017-07-18 13:00:08', '2017-07-18 13:00:09');

INSERT INTO student_group (id, name, school_id, school_year, active, creator, import_id, update_import_id, deleted, created, updated) VALUES
(-28, 'Group-2', -1, 2017, 1, 'dwtest@example.com', -98, -98, 0, '2017-07-18 13:00:03', '2017-07-18 13:00:03'),
(-27, 'Group-3', -1, 2017, 1, 'dwtest@example.com', -97, -97, 0, '2017-07-18 13:00:05', '2017-07-18 13:00:05'),
(-26, 'Group-4', -1, 2017, 1, 'dwtest@example.com', -96, -96, 0, '2017-07-18 13:00:08', '2017-07-18 13:00:08');


-- Unseen STEP
-- migrate kicks off with first_at='2017-07-18 12:08:02', last_at='2017-07-18 13:00:09'
-- that will migrate the first 5 groups


-- STEP 4
-- big group processing completes with three more groups created
INSERT INTO student_group (id, name, school_id, school_year, active, creator, import_id, update_import_id, deleted, created, updated) VALUES
(-25, 'Group-1c', -1, 2017, 1, 'dwtest@example.com', -99, -99, 0, '2017-07-18 13:00:06', '2017-07-18 13:00:06'),
(-24, 'Group-1d', -1, 2017, 1, 'dwtest@example.com', -99, -99, 0, '2017-07-18 13:00:07', '2017-07-18 13:00:07'),
(-23, 'Group-1e', -1, 2017, 1, 'dwtest@example.com', -99, -99, 0, '2017-07-18 13:00:08', '2017-07-18 13:00:08');

UPDATE import SET status = 1, updated = '2017-07-18 13:00:10' WHERE id = -99;


-- Next STEP to be executed by the integration test
-- migrate kicks off with first_at='2017-07-18 13:00:09', last_at='2017-07-18 13:00:10'
-- The issue being that the last 3 groups won't be seen by that migrate
