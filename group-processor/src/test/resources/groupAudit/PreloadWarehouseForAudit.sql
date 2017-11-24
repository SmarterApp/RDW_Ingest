-- Ensure auditing is on.
UPDATE setting s SET s.value = 'TRUE' WHERE s.name = 'AUDIT_TRIGGER_ENABLE';

INSERT INTO district (id, natural_id, name, external_id) VALUES (1, 'TD000001', 'Test District TD000001', NULL);

INSERT INTO school (id, district_id, natural_id, name, import_id, update_import_id, deleted, created, updated, district_group_id, school_group_id, external_id)
VALUES
  (1, 1, 'TS000001', 'Test School TS000001', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (2, 1, 'TS000002', 'Test School TS000002', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (3, 1, 'TS000003', 'Test School TS000003', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (4, 1, 'TS000004', 'Test School TS000004', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (5, 1, 'TS000005', 'Test School TS000005', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (6, 1, 'TS000006', 'Test School TS000006', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (7, 1, 'TS000007', 'Test School TS000007', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL),
  (8, 1, 'TS000008', 'Test School TS000008', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', NULL, NULL, NULL);

INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at, lep_exit_at, birthday, import_id, update_import_id, deleted, created, updated, inferred_school_id)
VALUES
  (1, 'SSID001', 'Williams', 'Gladys', 'Ruth', 2, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (2, 'SSID002', 'Smith', 'Joe', NULL, 1, NULL, NULL, NULL, '2002-01-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (3, 'SSID003', 'Anderson', 'Mark', NULL, 1, NULL, NULL, NULL, '2001-07-04', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (4, 'SSID004', 'Smart', 'Linda', NULL, 2, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (5, 'SSID005', 'Bennett', 'Donna', NULL, 2, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (6, 'SSID006', 'Gray', 'Carol', NULL, 2, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (7, 'SSID007', 'Harrison', 'Amanda', NULL, 2, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (8, 'SSID008', 'Green', 'Alice', NULL, 2, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (9, 'SSID009', 'Dawson', 'Brian', NULL, 1, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (10, 'SSID010', 'Booth', 'Kevin', NULL, 1, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (11, 'SSID011', 'Foster', 'Peter', NULL, 1, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1),
  (12, 'SSID012', 'Chambers', 'Carl', NULL, 1, NULL, NULL, NULL, '2001-06-23', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000', 1);

-- Initial group
INSERT INTO student_group (id, name, school_id, school_year, subject_id, active, creator, import_id, update_import_id, deleted, created, updated)
VALUES
  (1, 'StudentGroup001', 1, 2018, 2, 1, 'username@domain.com', 1, 1, 0, '2017-01-01 09:00:00.000000', '2017-01-01 09:00:00.000000');

-- Set up batches to process from the point BatchingGroupImportService is ready to run.
-- This assumes school_id, subject_id, and student_id are populated as normal before BatchingGroupImportService.
-- The exception is group_id to test a group already existing and adding new groups.
-- group_id's are populated in the test before each batch is run.
INSERT INTO upload_student_group (batch_id, group_name, group_id, school_natural_id, school_id, school_year, subject_id, student_ssid, student_id, group_user_login, creator)
VALUES
  (101, 'StudentGroup001', NULL, 'TS000001', 1, 2018, 2, NULL, NULL, NULL, 'username@domain.com'),
  (101, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher01@example.com', 'username@domain.com'),
  (101, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher02@example.com', 'username@domain.com'),
  (101, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID001', 1, NULL, 'username@domain.com'),
  (101, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID002', 2, NULL, 'username@domain.com'),
  (101, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID003', 3, NULL, 'username@domain.com'),

  (101, 'StudentGroup002', NULL, 'TS000001', 1, 2018, 1, NULL, NULL, NULL, 'username@domain.com'),

  (101, 'StudentGroup003', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, NULL, 'username@domain.com'),
  (101, 'StudentGroup003', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, 'teacher07@example.com', 'username@domain.com'),
  (101, 'StudentGroup003', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, 'teacher08@example.com', 'username@domain.com'),
  (101, 'StudentGroup003', NULL, 'TS000002', 2, 2018, NULL, 'SSID007', 7, NULL, 'username@domain.com'),
  (101, 'StudentGroup003', NULL, 'TS000002', 2, 2018, NULL, 'SSID008', 8, NULL, 'username@domain.com'),

  (101, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, NULL, 'username@domain.com'),
  (101, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, 'teacher10@example.com', 'username@domain.com'),
  (101, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, 'SSID010', 10, NULL, 'username@domain.com'),

  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, 1, NULL, NULL, NULL, 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher02@example.com', 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher03@example.com', 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher04@example.com', 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID001', 1, NULL, 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID004', 4, NULL, 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID005', 5, NULL, 'username555@domain.com'),
  (102, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID006', 6, NULL, 'username555@domain.com'),

  (102, 'StudentGroup002', NULL, 'TS000001', 1, 2018, 1, NULL, NULL, NULL, 'username@domain.com'),
  (102, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher04@example.com', 'username@domain.com'),
  (102, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, 'SSID001', 1, NULL, 'username@domain.com'),
  (102, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, 'SSID002', 2, NULL, 'username@domain.com'),

  (102, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, NULL, 'username@domain.com'),
  (102, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, NULL, NULL, 'teacher10@example.com', 'username@domain.com'),
  (102, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, 'SSID011', 11, NULL, 'username@domain.com'),
  (102, 'StudentGroup004', NULL, 'TS000002', 2, 2018, NULL, 'SSID012', 12, NULL, 'username@domain.com'),

  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, 1, NULL, NULL, NULL, 'username@domain.com'),
  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher01@example.com', 'username@domain.com'),
  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher02@example.com', 'username@domain.com'),
  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID001', 1, NULL, 'username@domain.com'),
  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID002', 2, NULL, 'username@domain.com'),
  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID004', 4, NULL, 'username@domain.com'),
  (103, 'StudentGroup001', NULL, 'TS000001', 1, 2018, NULL, 'SSID005', 5, NULL, 'username@domain.com'),

  (103, 'StudentGroup002', NULL, 'TS000001', 1, 2018, 1, NULL, NULL, NULL, 'username@domain.com'),
  (103, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, NULL, NULL, 'teacher03@example.com', 'username@domain.com'),
  (103, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, 'SSID001', 1, NULL, 'username@domain.com'),
  (103, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, 'SSID005', 5, NULL, 'username@domain.com'),
  (103, 'StudentGroup002', NULL, 'TS000001', 1, 2018, NULL, 'SSID006', 6, NULL, 'username@domain.com'),

  (103, 'StudentGroup005', NULL, 'TS000005', 5, 2018, NULL, NULL, NULL, NULL, 'username@domain.com'),
  (103, 'StudentGroup005', NULL, 'TS000005', 5, 2018, NULL, NULL, NULL, 'teacher10@example.com', 'username@domain.com'),
  (103, 'StudentGroup005', NULL, 'TS000005', 5, 2018, NULL, 'SSID001', 1, NULL, 'username@domain.com'),
  (103, 'StudentGroup005', NULL, 'TS000005', 5, 2018, NULL, 'SSID010', 10, NULL, 'username@domain.com'),
  (103, 'StudentGroup005', NULL, 'TS000005', 5, 2018, NULL, 'SSID011', 11, NULL, 'username@domain.com');
;
