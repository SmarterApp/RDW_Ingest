-- ------------------------ Subjects and related data ---------------------------------------------------------------------------------------------------------------------
INSERT INTO subject(id, code, import_id, update_import_id, created, updated) VALUES
-- NOTE: Because of the life BEFORE 'configurable subjects' the below two subjects (and the related data) are pre-loaded by default
-- Ideally it should not be there, but it is.
--  (1,   'Math',  -99, -99, '2017-07-18 19:06:30.966000', '2017-07-18 19:06:30.966000'),
--  (2,   'ELA',   -99, -99, '2017-07-18 19:06:30.966000', '2017-07-18 19:06:30.966000');

-- add new subjects to better control test use cases
    (-1, 'New',    -99, -99, '2017-07-18 19:06:30.966000', '2017-07-18 19:06:30.966000'),
    (-2, 'Old',    -99, -99, '2014-07-18 19:06:30.966000', '2017-04-18 19:06:30.966000'),
    (-3, 'Update', -99, -99, '2017-07-18 19:06:30.966000', '2017-07-18 19:06:30.966000');

-- To trigger the default subjects data migration we need to update the timestamps
UPDATE subject
    SET created = '2017-07-18 19:06:30.966000', updated = '2017-07-18 19:06:30.966000'
WHERE id IN (1,2);

-- add subjects' related data for the new subjects
INSERT INTO subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count) VALUES
-- NOTE: Because of the life BEFORE 'configurable subjects' the below two subjects (and the related data) are pre-loaded by default
--  (1,  1,  4, 3,    3),
--  (1,  2,  4, 3,    3),
--  (2,  1,  3, null, null),
--  (2,  2,  3, null, null),
--  (3,  1,  4, 3,    3),
--  (3,  2,  4, 3,    3),

  (1, -1, 10, 3, 6),
  (1, -2, 5, 2, 6),
   -- new entry
  (1, -3, 8, 2, 7),
   -- updated entry
  (2, -3, 8, 2, 7);

INSERT INTO subject_claim_score (id, subject_id, asmt_type_id, code, name, display_order, data_order) VALUES
  (-1,  -1, 1, 'Score1', 'Score1 Name',  0, 1),
  (-2,  -1, 1, 'Score2', 'Score2 Name',  0, 2),
  (-3,  -1, 1, 'Score3', 'Score3 Name', -3, 3),
  (-4,  -2, 3, 'Score4', 'Score4 Name', -4, 4),
  (-5,  -2, 3, 'Score5', 'Score5 Name',  0, 5),
  (-6,  -2, 3, 'Score6', 'Score6 Name', -5, 6),
  (-14,  -3, 3, 'Score7','Score7 Name', -6, 4),
  (-15,  -3, 3, 'Update','Update Score 8', -7, 5),
  (-16,  -3, 3, 'New',   'New Score9 Name', -8, 6);

INSERT INTO claim (id, subject_id, code, name, description) VALUES
  (-21,-1, 'ClaimCode2', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-3, -1, 'ClaimCode3', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-4, -1, 'ClaimCode4', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-5, -2, 'ClaimCode5', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-6, -2, 'ClaimCode6', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-7, -2, 'ClaimCode7', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-8, -2, 'ClaimCode8', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-9, -2, 'ClaimCode9', 'ClaimCode1 Name', 'ClaimCode1 Description'),

  (-66, -3, 'Update66', 'Update', 'Update Description'),
  (-67, -3, 'new', 'new name', 'New Description'),
  (-68, -3, 'Old68', 'Old1', 'Old Description1'),
  (-69, -3, 'Old69', 'Old2', 'Old Description2'),
  -- add more data for the default subjects to better control validation while testing
  (-1,   1, 't1', 'Math-claim1', 'Math-c1'),
  (-2,   1, 't3', ' Math-claim2', 'Math-c1'),
  (-99,  2, 'c9',  '3', ''),
  (-98,  2, 'c8',  '2', ''),
  (-11,  2, 't1',  'ELA-claim1', 'ELA-c1'),
  (-12,  2, 't2',  'ELA-claim2', 'ELA-c2'),
  (-13,  2, 't3',  'ELA-claim3', 'ELA-c3'),
  (-14,  2, 't4',  'ELA-claim4', 'ELA-c4');

INSERT INTO target (id, code, natural_id, claim_id, description) VALUES
  (-1,  'F',  'Target1',-1, 'Algebra: Perform arithmetic operations on polynomials.'),
  (-2,  'X',  'Target2',-21, 'Algebra: Understand the relationship between zeros and factors of polynomials.'),
  (-3,  'XX', 'Target3',-3, 'Algebra: Use polynomial identities to solve problems.'),
  (-4,  'XXX','Target4',-4, 'Algebra: Rewrite rational expressions.'),
  (-5,  'G',  'Target5',-5, 'Algebra: Create equations that describe numbers or relationships'),
  (-6,  'H',  'Target6',-6, 'Algebra: Understand solving equations as a process of reasoning and explain the reasoning.'),
  (-7,  'I',  'Target7',-7, 'Algebra: Solve equations and inequalities in one variable.'),
  (-8,  'J',  'Target8',-8, 'Algebra: Represent and solve equations and inequalities graphically.'),
  (-9,  'X',  'Target9',-9, 'Algebra: Solve systems of equations.'),

  (-66,  'H',  'NewTarget',    -66, 'NewTarget Description'),
  (-67,  'I',  'UpdatedTarget',-67, 'UpdatedTarget Description'),
  (-68,  'J',  'Target8',-68, 'Algebra: Represent and solve equations and inequalities graphically.'),
  (-69,  'X',  'Target9',-69, 'Algebra: Solve systems of equations.'),

  -- add more data for the default subjects to better control validation while testing
  (-99,  'E-3', 'NBT|99',  -11,  'NBT|E-3-1'),
  (-98,  'E-3', 'NBT|98',  -11,  'NBT|E-3-1'),

  -- we need to test a use case with 'Math' subject and claim '1' since it has special migrate rules
  -- since it is being pre-loaded we need to get the db id
  (-71,  'E-3', 'tNBT|E-3', (SELECT id FROM claim WHERE code = '1' AND subject_id = 1), 'NBT|E-3-1'),
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
  (-96, -2, -1, 'Basic Skills and Concepts','anything'),
  (-66,  1, -3, 'new description','new'),
  (-67,  2, -3, 'updated description','updated'),
  (-68,  3, -3, 'Basic Skills and Concepts','anything');

-------------------------- Preload  entities into warehouse  -------------------------------------------------------------------------------------------------------
INSERT INTO district_group (id, name, natural_id) VALUES
  (-98, 'Sample District Group -98', 'natural_id-98');

INSERT INTO district (id, name, natural_id) VALUES
  (-1, 'Preload District -1', 'natural_id-1'),
  (-99, 'Sample District -99', 'natural_id-99'),
  (-98, 'Sample District -98', 'natural_id-98');

INSERT INTO school_group (id, name, natural_id) VALUES
  (-1, 'New School Group -1', 'natural_id-1'),
  (-98, 'Sample School Group -98', 'natural_id-98');

INSERT INTO school (id, district_id, district_group_id, school_group_id, name, natural_id, deleted, import_id, update_import_id, created, updated) VALUES
  (-1, -1, NULL, -1, 'Preload School -1', 'natural_id-1', 0, -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
-- -99 is marked as deleted.  It's district will not be copied.
  (-99, -99, NULL, NULL, 'Sample School -99', 'natural_id-99', 1, -1, -1, '2017-07-18 20:14:34.966000', '2017-07-18 20:14:34.000000'),
  (-98, -98, -98, -98, 'Sample School -98', 'natural_id-98', 0, -2, -2, '2017-07-18 20:13:34.000000', '2017-07-18 20:13:34.000000');

INSERT INTO asmt
  (id, type_id, natural_id,                    grade_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id, created, updated) VALUES
  (-11, 3,     'ica-1999-grade-8-subject-1',        108,   1,        1999,        'ica-1999-grade-8-subject-1',         'test',       '9835', 0,   -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-99, 3,     'summative-1999-grade-9-subject-1',  109,   1,        1999,        'summative-1999-grade-9-subject-1',   'summative',  '9835', 1,   -5000,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-98, 1,     'ica-1999-grade-8-subject-2',        108,   2,        1999,        'ica-1999-grade-8-subject-2',         'ica',        '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-66, 2,     'iab',                               109,   2,        1999,        'iab',                                'iab',        '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-97, 2,     'iab-1999-grade-8-subject-2',        108,   2,        1999,        'iab-1999-grade-8-subject-2',         'iab',        '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-107,3,     'test-summative-2001-grade-7',       107,   1,        1999,        'summative-grade-8',                  'summative',  '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-111,3,     'test-summative-2001-grade-11',      111,   1,        1999,        'summative-grade-11',                 'summative',  '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-311,3,     'test-summative-2001-ELA-grade-11',  111,   2,        1999,        'summative-ELA-grade-11',             'summative',  '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, difficulty_code, max_points, math_practice, allow_calc, position,
                field_test, active, type, options_count, answer_key, performance_task_writing_type ) VALUES
  (-9,   -1, -71, '200-2019',  -99, -99, -0.23, 'E', 2, -99, 0, 1, null, null, null, null, null, null),
  (-8,   -2, -72, '200-2018',  -99, -99, -0.23, 'E', 2, -99, 0, 2, null, null, null, null, null, null),
  (-7,   -2, -73, '200-2017',  -99, -99, -0.23, 'E', 2, -99, 0, 3, null, null, null, null, null, null),

  (-6,   -1, -71, '200-2016',  -107, -99, -0.23, 'E', 2, -99, 0, 4, null, null, null, null, null, null),
  (-990, -2, -72, '200-2010',  -107, -99, -0.23, 'E',  2, -99, 0, 4, null, null, null, null, null, null),
  (-991, -2, -72, '200-18943', -107, -99, -0.13, 'E', 2, -98, 0, 3, false, true, 1, 0, 'key', 'Narrative'),
  (-992, -2, -73, '200-8906',  -107, -99, -0.03, 'E', 2, -99, 1, 2, false, true, 1, 0, 'key', 'Informational'),
  (-993, -2, -73, '200-2014',  -107, -98,  1.23, 'D', 2, -98, 1, 1, false, true, 1, 0, 'key', 'Explanatory'),

  (-980, -1, -71, '200-60347', -111, -98, -0.32, 'E', 1, null, null, 5, false, true, 1, 0, 'key', 'Opinion'),
  (-981, -1, -71, '200-51719', -111, -98, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key', 'Opinion'),
  (-982, -1, -71, '200-59217', -111, -98, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key', 'Argumentative'),
  (-983, -1, -71, '200-59208', -111, -98, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key', 'Argumentative'),
  (-984, -2, -72, '200-30901', -111, -98, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key', 'Argumentative'),

  (-180, -11, -11, '200-60347', -311, -98, -0.32, 'E', 1, null, null, 5, false, true, 1, 0, 'key', 'Opinion'),
  (-181, -12, -21, '200-51719', -311, -98, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key', 'Opinion'),
  (-182, -13, -31, '200-59217', -311, -98, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key', 'Argumentative'),
  (-183, -14, -41, '200-59208', -311, -98, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key', 'Argumentative'),
  (-184, -14, -42, '200-30901', -311, -98, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key', 'Argumentative');

INSERT INTO asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-11, 2442, 2502, 2582, 2201, 2701),
  (-99, 2442, 2502, 2582, 2201, 2701),
  (-98, 2442, 2502, 2582, 2201, 2701),
  (-66, 2442, 2502, 2582, 2201, 2701),
  (-97, 2442, 2502, 2582, 2201, 2701),
  (-107, 2442, 2502, 2582, 2201, 2701),
  (-111, 2442, 2502, 2582, 2201, 2701);

INSERT INTO asmt_target_exclusion(asmt_id, target_id) VALUES
  (-99,  -71),
  (-99,  -72),
  (-111, -71),
  (-111, -72),
  (-311, -11);

INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                                    lep_exit_at, birthday, import_id, update_import_id, deleted, created, updated) VALUES
  (-11, '11', 'LastName-preload', 'FirstName-preload', 'MiddleName-preload', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -5000, 0, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-89, '89', '漢字', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -89, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:00.966000'),
  (-88, '88', 'Last, Name2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000'),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -87, -87, 0, '2017-07-18 19:09:33.966000', '2017-07-18 19:09:33.966000'),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -86, -86, 0, '2017-07-18 19:09:3.966000', '2017-07-18 19:09:33.966000'),
  (-33, '33', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', 2000, 2000, 0, '2017-07-18 20:16:33.966000', '2017-07-18 20:16:33.966000'),
  (-18, '18', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', 2000, 2000, 0, '2017-07-18 20:16:33.966000', '2017-07-18 20:16:33.966000');

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
  (-89,  -99),
  (-88,  -98),
  (-87,  -98),
  (-86,  -98),
  (-86,  -99);

INSERT INTO  exam ( id, type_id, school_year, asmt_id, student_id, completed_at,
                    asmt_version, opportunity, elas_id, completeness_id,
                    administration_condition_id, session_id, performance_level, scale_score, scale_score_std_err,
                    import_id, update_import_id, deleted, created, updated,
                    grade_id, school_id, iep, lep, section504, economic_disadvantage,
                    migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) VALUES
  (-88, 3, 1999, -99, -89, '2016-08-14 19:05:33.967000', null, 1, 1,    1, 1, 'session', 1,    2145, 20.17, -5000, -88, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:07.966000',  108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-87, 3, 1998, -11, -11, '2016-08-14 19:06:07.966000', null, 1, null, 1, 1, 'session', 1,    2106, 21.17,  -88, -88, 0,  '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-85, 3, 1999, -11, -11, '2016-08-14 19:06:07.966000', null, 1, -99,  1, 1, 'session', 1,    2125, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-68, 2, 1999, -66, -89, '2016-08-14 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    2135, 30.17,  -88, -88, 1, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-84, 2, 1998, -66, -11, '2016-08-14 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    2135, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-83, 2, 1999, -66, -11, '2016-08-12 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    2000, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-10, 2, 1999, -97, -11, '2016-08-14 19:06:07.966000', null, 1, 1,    1, 1, 'session', null, 2135, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-11, 2, 1998, -97, -89, '2016-08-12 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    null, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-12, 2, 1999, -97, -89, '2016-08-12 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    2000, null,   -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-15, 3, 1999, -99, -11, '2016-08-14 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    null, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-16, 1, 1998, -98, -11, '2016-08-14 19:06:07.966000', null, 1, 1,    1, 1, 'session', 1,    2125, null,   -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-17, 1, 1999, -98, -11, '2016-08-14 19:06:07.966000', null, 1, 1,    1, 1, 'session', null, 2125, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 108, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-268, 3, 1999, -107, -89, '2016-08-14 19:06:07.966000', null, 1, 1,   1, 1, 'session', 1,    2135, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 107, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-206, 3, 1998, -111, -89, '2016-08-14 19:05:07.966000', null, 1, 1,   1, 1, 'session', 2,    2145, 40.17,  -88, -88, 0, '2017-07-18 20:14:34.000000', '2017-07-18 19:06:07.966000', 111, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-209, 3, 1999, -111, -18, '2016-08-14 19:06:07.966000', null, 1, 1,   1, 1, 'session', 3,    2145, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 111, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-311, 3, 1999, -311, -33, '2016-08-14 19:06:07.966000', null, 1, 1,   1, 1, 'session', 3,    2145, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', 111, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null);

INSERT INTO exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
   (-2, -87, 1, 2014, 0.19, 1),
   (-4, -85, 1, 2014, 0.19, 1),
   (-5, -268, 1, 2014, 0.19, 1),
   -- un-scored claim
   (-6, -68, 1, 2014, 0.19, null),
   -- un-scored exams
   (-7, -10, 1, 2014, 0.19, 1),
   (-8, -11, 1, 2014, 0.19, 1),
   (-9, -12, 1, 2014, 0.19, 1);

INSERT INTO exam_target_score (id, target_id, exam_id, student_relative_residual_score, standard_met_relative_residual_score) VALUES
  (-1,   -71, -88,  -1,    -1     ),
  (-2,   -72, -88,  0.123,  0.1456),
  (-3,   -73, -88,  0.1,    0.1   ),

  (-11,  -11, -311,  -1,    -1     ),
  (-12,  -12, -311,  0.9876, 0.8976),
  (-13,  -21, -311,  0.123,  0.1456),
  (-15,  -22, -311,  0.1,    0.1   ),
  (-16,  -31, -311,  0.1,    0.1   ),
  (-17,  -32, -311,  0.1,    0.1   ),
  (-18,  -33, -311,  0.1,    0.1   ),
  (-19,  -34, -311,  0.1,    0.1   ),
  (-191, -41, -311,  0.1,    null  ),
  (-192, -43, -311,  null,   0.1   ),

  (-210,  -71, -209, -0.88, -0.88  ),
  (-220,  -72, -209, 1,      1     ),
  (-230,  -73, -209, 0.1,    0.1   );