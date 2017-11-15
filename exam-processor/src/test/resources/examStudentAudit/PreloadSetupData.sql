-- Ensure auditing is on.
UPDATE setting s SET s.value = 'TRUE' WHERE s.name = 'AUDIT_TRIGGER_ENABLE';

-- Create with mysqldump after setup_data.sh on a cleaned and migrated warehouse
-- Example:
-- mysqldump --user=root --host=127.0.0.1 --default-character-set=utf8 --no-create-info=TRUE --compact --complete-insert --skip-quote-names --result-file=dump.sql warehouse import asmt item district school accommodation
-- remove import id of 1 as it is added by flyway
-- add import id of -1 used by integration tests
INSERT INTO import (id, status, content, contentType, digest, batch, creator, created, updated, message) VALUES
  (-1, 1, 3, 'application/xml', '78C221139BCEDD5B4C84FB6BE985017A', NULL, 'dwtest@example.com', '2017-11-15 02:12:39.720879', '2017-11-15 02:12:39.877145', '34 accommodations processed'),
  (2, 1, 3, 'application/xml', '78C221139BCEDD5B4C84FB6BE985017A', NULL, 'dwtest@example.com', '2017-11-15 02:12:39.720879', '2017-11-15 02:12:39.877145', '34 accommodations processed'),
  (3, 1, 2, 'application/octet-stream', '0E94EEE6735C3EF3E260697F8D5BB6CC', NULL, 'dwtest@example.com', '2017-11-15 02:12:39.770991', '2017-11-15 02:12:39.887250', 'Assessments processed: 3, created: 3, updated: 0, rejected: 0'),
  (4, 1, 4, 'application/octet-stream', 'FD5ABA1FA1C7E01EAEE79AEF302937D9', NULL, 'dwtest@example.com', '2017-11-15 02:12:39.826727', '2017-11-15 02:12:39.858586', '2 schools processed');
INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, import_id, update_import_id, deleted, created, updated)
VALUES
  (1, '(naturalId)MOCK-ICA-G11-2017-2018', 11, 1, 2, 2018, 'MOCK-ICA-G11-2017-2018', 'Grade 11 ELA', '11111', 3, 3, 0, '2017-11-15 02:12:39.803563', '2017-11-15 02:12:39.803563'),
  (2, '(naturalId)MOCK-IAB-G11M-2017-2018', 11, 2, 1, 2018, 'MOCK-IAB-G11M-2017-2018', 'High School Math Algebra (IAB)', '11111', 3, 3, 0, '2017-11-15 02:12:39.803563', '2017-11-15 02:12:39.803563'),
  (3, '(naturalId)MOCK-IAB-G11E-2017-2018', 11, 2, 2, 2018, 'MOCK-IAB-G11E-2017-2018', 'High School ELA - Read Informational Texts (IAB)', '11111', 3, 3, 0, '2017-11-15 02:12:39.803563', '2017-11-15 02:12:39.803563');
INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, math_practice, allow_calc, dok_id, difficulty_code, difficulty, max_points, position, field_test, active, type, options_count, answer_key)
VALUES (1, 6, 1120, '777-10001', 1, NULL, NULL, 5, 'M', 0.1, 1, 11, 0, 1, 'MC', 4, 'D'),
  (2, 6, 1107, '777-10002', 1, NULL, NULL, 6, 'M', 0.1, 1, 23, 0, 1, 'MC', 4, 'D'),
  (3, 6, 1133, '777-10003', 1, NULL, NULL, 7, 'M', 0.1, 1, 29, 0, 1, 'MC', 4, 'D'),
  (4, 6, 1133, '777-10004', 1, NULL, NULL, 5, 'M', 0.1, 1, 36, 0, 1, 'MC', 4, 'D'),
  (5, 3, 1029, '777-10005', 1, NULL, NULL, 6, 'M', 0.1, 1, 3, 0, 1, 'MC', 4, 'D'),
  (6, 3, 1029, '777-10006', 1, NULL, NULL, 7, 'M', 0.1, 1, 16, 0, 1, 'MC', 4, 'D'),
  (7, 3, 1029, '777-10007', 1, NULL, NULL, 5, 'M', 0.1, 1, 35, 0, 1, 'MC', 4, 'D'),
  (8, 6, 1107, '777-10008', 1, NULL, NULL, 6, 'M', 0.1, 1, 2, 0, 1, 'MC', 4, 'D'),
  (9, 1, 809, '777-10009', 1, NULL, NULL, 7, 'M', 0.1, 1, 26, 0, 1, 'MC', 4, 'D'),
  (10, 1, 796, '777-10010', 1, NULL, NULL, 7, 'M', 0.1, 1, 25, 0, 1, 'MC', 4, 'D'),
  (11, 8, 7, '777-50001', 2, 7, 0, 2, 'M', 0.1, 1, 3, 0, 1, 'MC', 4, 'D'),
  (12, 8, 8, '777-50002', 2, NULL, 1, 2, 'M', 0.1, 1, 11, 0, 1, 'MC', 4, 'D'),
  (13, 8, 27, '777-50003', 2, 7, 1, 1, 'M', 0.1, 1, 15, 0, 1, 'MI', 4, 'D'),
  (14, 8, 26, '777-50004', 2, 2, 1, 1, 'M', 0.1, 1, 9, 0, 1, 'MI', 4, 'D'),
  (15, 11, 563, '777-50005', 2, 4, 1, 3, 'M', 0.1, 1, 12, 0, 1, 'MC', 4, 'D'),
  (16, 1, 822, '777-51001', 3, NULL, NULL, 6, 'M', 0.1, 1, 3, 0, 1, 'EBSR', 4, 'D'),
  (17, 1, 822, '777-51002', 3, NULL, NULL, 6, 'M', 0.1, 1, 1, 0, 1, 'MC', 4, 'D'),
  (18, 1, 783, '777-51003', 3, NULL, NULL, 7, 'M', 0.1, 1, 2, 0, 1, 'MS', 4, 'D'),
  (19, 1, 796, '777-51004', 3, NULL, NULL, 7, 'M', 0.1, 1, 6, 0, 1, 'MC', 4, 'D'),
  (20, 1, 744, '777-51005', 3, NULL, NULL, 5, 'M', 0.1, 1, 4, 0, 1, 'HTQ', 4, 'D');
INSERT INTO district (id, natural_id, name, external_id) VALUES (1, 'TD000001', 'Test District TD000001', NULL);
INSERT INTO school (id, district_id, natural_id, name, import_id, update_import_id, deleted, created, updated, district_group_id, school_group_id, external_id)
VALUES
  (1, 1, 'TS000001', 'Test School TS000001', 4, 4, 0, '2017-11-15 02:12:39.847327', '2017-11-15 02:12:39.847327', NULL, NULL, NULL),
  (2, 1, 'TS000002', 'Test School TS000002', 4, 4, 0, '2017-11-15 02:12:39.853635', '2017-11-15 02:12:39.853635', NULL, NULL, NULL);
INSERT INTO accommodation (id, code, updated)
VALUES (1, 'TDS_ASL0', NULL), (2, 'TDS_ASL1', NULL), (3, 'TDS_ClosedCap0', NULL), (4, 'TDS_ClosedCap1', NULL),
  (5, 'TDS_BT0', NULL), (6, 'TDS_BT_EXN', NULL), (7, 'TDS_BT_ECN', NULL), (8, 'TDS_BT_EXT', NULL),
  (9, 'TDS_BT_ECT', NULL), (10, 'TDS_BT_UXN', NULL), (11, 'TDS_BT_UCN', NULL), (12, 'TDS_BT_UXT', NULL),
  (13, 'TDS_BT_UCT', NULL), (14, 'TDS_PM0', NULL), (15, 'TDS_PM1', NULL), (16, 'TDS_PoD0', NULL),
  (17, 'TDS_PoD_Stim', NULL), (18, 'TDS_PoD_Item', NULL), (19, 'TDS_PoD_Stim&TDS_PoD_Item', NULL),
  (20, 'TDS_SLM0', NULL), (21, 'TDS_SLM1', NULL), (22, 'TDS_TTS0', NULL), (23, 'TDS_TTS_Item', NULL),
  (24, 'TDS_TTS_Stim', NULL), (25, 'TDS_TTS_Stim&TDS_TTS_Item', NULL), (26, 'NEA0', NULL), (27, 'NEA_AR', NULL),
  (28, 'NEA_RA_Stimuli', NULL), (29, 'NEA_SC_WritItems', NULL), (30, 'NEA_STT', NULL), (31, 'NEA_Abacus', NULL),
  (32, 'NEA_Calc', NULL), (33, 'NEA_MT', NULL), (34, 'NEA_NumTbl', NULL);
