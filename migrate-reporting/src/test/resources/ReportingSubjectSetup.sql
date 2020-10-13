-- ------------------------ Subjects and related data ---------------------------------------------------------------------------------------------------------------------
INSERT INTO subject(id, code, update_import_id, migrate_id) VALUES
-- NOTE: Because of the life BEFORE configurable subject, some subjects are pre-loaded into the report,
-- but unlike warehouse, there is no supporting data
  (-2, 'Old',   -99, -99),
  (-3, 'Update', -99, -99),
  (-5, 'Alt', -99, -99);

-- add subjects' related data for the new subjects
INSERT INTO subject_asmt_type (subject_id, asmt_type_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count, target_report, printed_report, trait_report) VALUES
  (-2, 1, 5, 2, 6, 0, 0, 0),
  (-3, 3, 7, 2, 7, 1, 0, 0),   --  to delete
  (-3, 2, 3, 3, 3, 0, 0, 0),   -- updated entry
  (-5, 3, 3, 2, 3, 0, 0, 1);

INSERT INTO subject_score (id, subject_id, asmt_type_id, score_type_id, code, display_order, data_order) VALUES
  (-4,  -2, 3, 3, 'Score4', 4, 1),
  (-5,  -2, 3, 3, 'Score5', 5, 2),
  (-6,  -2, 3, 3, 'Score6', 6, 3),
  (-15, -3, 3, 3, 'Update', 5, 5),
  (-60, -3, 3, 3, 'Delete', 6, 6),
  (-18, -5, 3, 2, 'PassFail', 1, 1);

INSERT INTO subject_trait (id, subject_id, purpose, category, max_score) VALUES
  (-1, -5, 'EXPL', 'ORG', 3),
  (-10, -3, 'EXPL', 'ORG', 3);

INSERT INTO subject_translation(subject_id, label_code, label) VALUES
  (-2, 'integration test label subject 2', 'subject 2'),
  (-3, 'integration test - deleted',      'subject 3 - to delete'),
  (-3, 'integration test - upadated translation for subject 3', 'old');

INSERT INTO claim (id, subject_id, code) VALUES
  (-5, -2, 'ClaimCode5'),
  (-6, -2, 'ClaimCode6'),
  (-7, -2, 'ClaimCode7'),
  (-8, -2, 'ClaimCode8'),
  (-9, -2, 'ClaimCode9'),

  (-60, -3, 'deleted'),
  (-68, -3, 'Old68'),
  (-69, -3, 'Old69'),

  (-1,   1, 't1'),
  (-2,   1, 't3'),
  (-99,  2, 'c9'),
  (-98,  2, 'c8'),
  (-11,  2, '1'),
  (-12,  2, '2'),
  (-13,  2, '3'),
  (-14,  2, '4');

INSERT INTO target (id,natural_id, claim_id) VALUES
  (-5, 'Target5',  -5),
  (-6, 'Target6',  -6),
  (-7, 'Target7',  -7),
  (-8, 'Target8',  -8),
  (-9, 'Target9',  -9),

  (-60, 'Deleted', -60),
  (-68, 'Target8', -68),
  (-69, 'Target9', -69),

  (-99, 'NBT|99',  -11),
  (-98, 'NBT|98',  -11),

  (-71, 'NBT|E-3', -1),
  (-72, 'MD|J-3',  -2),
  (-73, 'OA|D',    -2),

  (-11, 'NBT|E-3', -11),
  (-12, 'MD|J-3',  -11),
  (-21, 'OA|D',    -12),
  (-22, 'OA|A',    -12),
  (-31, 'NF|C',    -13),
  (-32, 'MD|D',    -13),
  (-33, 'MD|E',    -13),
  (-34, 'OA|E',    -13),
  (-41, 'OA|E',    -14),
  (-42, 'MD|D',    -14),
  (-43, 'OA|A',    -14);

INSERT INTO depth_of_knowledge(id, level, subject_id, reference) VALUES
  (-99, -1,  1, 'something'),
  (-98, -2,  1, 'anything'),
  (-97, -2, -2, 'anything'),
  (-60,  4, -3, 'deleted'),
  (-67,  2, -3, 'updated'),
  (-68,  3, -3, 'anything');

INSERT INTO common_core_standard(id, natural_id, subject_id) VALUES
  (-99,'naturalid-99',   1),
  (-98, 'naturalid-98',  2),
  (-97, 'naturalId-97', -2),
  (-60, 'deleted',      -3),
  (-67, 'updated',      -3),
  (-68, 'old',          -3);
