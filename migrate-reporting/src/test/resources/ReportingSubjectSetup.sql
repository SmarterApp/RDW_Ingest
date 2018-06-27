-- ------------------------ Subjects and related data ---------------------------------------------------------------------------------------------------------------------
INSERT INTO subject(id, code, update_import_id, migrate_id) VALUES
-- NOTE: Because of the life BEFORE configurable subject, some subjects are pre-loaded into the report,
-- but unlike warehouse, there is no supporting data
    (-2, 'Old',   -99, -99),
    (-3, 'Update', -99, -99);

-- add subjects' related data for the new subjects
INSERT INTO subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count) VALUES
  (1, -2, 5, 2, 6),
   --  to delete
  (3, -3, 7, 2, 7),
   -- updated entry
  (2, -3, 3, 3, 3);

INSERT INTO subject_claim_score (id, subject_id, asmt_type_id, code, name, display_order, data_order) VALUES
  (-4,  -2, 3, 'Score4', 'Score4 Name',       4, 1),
  (-5,  -2, 3, 'Score5', 'Score5 Name',       5, 2),
  (-6,  -2, 3, 'Score6', 'Score6 Name',       6, 3),
  (-15, -3, 3, 'Update', 'Update Score 8',    5, 5),
  (-60, -3, 3, 'Delete', 'Delete Score Name', 6, 6);

INSERT INTO subject_translation(subject_id, label_code, label) VALUES
  (-2, 'integration test label subject 2', 'subject 2'),
  (-3, 'integration test - deleted',      'subject 3 - to delete'),
  (-3, 'integration test - upadated translation for subject 3', 'old');

INSERT INTO claim (id, subject_id, code, name, description) VALUES
  (-5, -2, 'ClaimCode5', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-6, -2, 'ClaimCode6', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-7, -2, 'ClaimCode7', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-8, -2, 'ClaimCode8', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-9, -2, 'ClaimCode9', 'ClaimCode1 Name', 'ClaimCode1 Description'),

  (-60, -3, 'deleted', 'deleted', 'Delete Description'),
  (-68, -3, 'Old68', 'Old1', 'Old Description1'),
  (-69, -3, 'Old69', 'Old2', 'Old Description2'),

  (-1,   1, 't1', 'Math-claim1', 'Math-c1'),
  (-2,   1, 't3', ' Math-claim2', 'Math-c1'),
  (-99,  2, 'c9',  '3', ''),
  (-98,  2, 'c8',  '2', ''),
  (-11,  2, '1',  'ELA-claim1', 'ELA-c1'),
  (-12,  2, '2',  'ELA-claim2', 'ELA-c2'),
  (-13,  2, '3',  'ELA-claim3', 'ELA-c3'),
  (-14,  2, '4',  'ELA-claim4', 'ELA-c4');

INSERT INTO target (id, code, natural_id, claim_id, description) VALUES
  (-5,  'G',  'Target5',-5, 'Algebra: Create equations that describe numbers or relationships'),
  (-6,  'H',  'Target6',-6, 'Algebra: Understand solving equations as a process of reasoning and explain the reasoning.'),
  (-7,  'I',  'Target7',-7, 'Algebra: Solve equations and inequalities in one variable.'),
  (-8,  'J',  'Target8',-8, 'Algebra: Represent and solve equations and inequalities graphically.'),
  (-9,  'X',  'Target9',-9, 'Algebra: Solve systems of equations.'),

  (-60,  'A',  'Deleted',  -60, 'Deleted Description'),
  (-68,  'J',  'Target8',  -68, 'Algebra: Represent and solve equations and inequalities graphically.'),
  (-69,  'X',  'Target9',  -69, 'Algebra: Solve systems of equations.'),

  (-99,  'E-3', 'NBT|99',  -11,  'NBT|E-3-1'),
  (-98,  'E-3', 'NBT|98',  -11,  'NBT|E-3-1'),

  (-71,  'E-3', 'NBT|E-3', -1, 'NBT|E-3-1'),
  (-72,  'J-3',  'MD|J-3', -2,  'MD|J-3-1' ),
  (-73,  'D',    'OA|D',   -2,  'OA|D-2'   ),

  (-11,  'E-3', 'NBT|E-3', -11,  'NBT|E-3-1'),
  (-12,  'J-3',  'MD|J-3', -11,  'MD|J-3-1' ),
  (-21,  'D',    'OA|D',   -12,  'OA|D-2'   ),
  (-22,  'A',    'OA|A',   -12,  'OA|A-2'   ),
  (-31,  'C',    'NF|C',   -13,  'NF|C-3'   ),
  (-32,  'D',    'MD|D',   -13,  'MD|D-3'   ),
  (-33,  'E',    'MD|E',   -13,  'MD|E-3'   ),
  (-34,  'E',    'OA|E',   -13,  'OA|E-3'   ),
  (-41,  'E',    'OA|E',   -14,  'OA|E-4'   ),
  (-42,  'D',    'MD|D',   -14,  'MD|D-4'   ),
  (-43,  'A',    'OA|A',   -14,  'OA|A-4'   );

INSERT INTO depth_of_knowledge(id, level, subject_id, description, reference) VALUES
  (-99, -1,  1, 'Recall and Reproduction','something'),
  (-98, -2,  1, 'Basic Skills and Concepts','anything'),
  (-97, -2, -2, 'Basic Skills and Concepts','anything'),
  (-60,  4, -3, 'to delete','deleted'),
  (-67,  2, -3, 'updated description','updated'),
  (-68,  3, -3, 'Basic Skills and Concepts','anything');

INSERT INTO common_core_standard(id, natural_id, subject_id, description) VALUES
  (-99,'naturalid-99',   1, 'common core 99'),
  (-98, 'naturalid-98',  2,'common core 98'),
  (-97, 'naturalId-97', -2, 'common core -97'),
  (-60, 'deleted',      -3, 'to delete description'),
  (-67, 'updated',      -3, 'updated description'),
  (-68, 'old',          -3, 'old description');