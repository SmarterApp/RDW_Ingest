-- ------------------------ Subjects and related data ---------------------------------------------------------------------------------------------------------------------
INSERT INTO staging_subject(id, code, update_import_id, migrate_id, updated) VALUES
    (-1, 'New',    -99, -99,now()),
    (-3, 'Update', -99, -99, now());

-- add subjects' related data for the new subjects
INSERT INTO staging_subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count) VALUES
  (1, -1, 10, 3, 6),
   -- new entry
  (1, -3, 8, 2, 7),
   -- updated entry
  (2, -3, 8, 2, 7);

INSERT INTO staging_subject_claim_score (id, subject_id, asmt_type_id, code, name, display_order, data_order) VALUES
  (-1,  -1, 1, 'Score1', 'Score1 Name',  0, 1),
  (-2,  -1, 1, 'Score2', 'Score2 Name',  0, 2),
  (-3,  -1, 1, 'Score3', 'Score3 Name', -3, 3),
  (-14,  -3, 3, 'Score7','Score7 Name', 0, 4),
  (-15,  -3, 3, 'Update','Update Score 8', 0, 5),
  (-16,  -3, 3, 'New',   'New Score9 Name', 1, 6);

INSERT INTO staging_subject_translation(subject_id, label_code, label) VALUES
  (-1, 'integration test subject 1',       '1 test label'),
  (-1, 'integration test subject 1 again', '1 again test label'),
  (-3, 'integration test - upadated translation for subject 3', 'new');

INSERT INTO staging_claim (id, subject_id, code, name, description) VALUES
  (-71,  -1, 'ClaimCode1', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-21, -1, 'ClaimCode2', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-3,  -1, 'ClaimCode3', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-4,  -1, 'ClaimCode4', 'ClaimCode1 Name', 'ClaimCode1 Description'),

  (-67, -3, 'new', 'new', 'Nee Description'),
  (-68, -3, 'Old68', 'Old1', 'Old Description1'),
  (-69, -3, 'Old69', 'Old2', 'Old Description2'),
  -- add more data for the default subjects to better control validation while testing
  (-2,   1, 't3', ' Math-claim2', 'Math-c1'),
  (-99,  2, 'c9',  '3', ''),
  (-98,  2, 'c8',  '2', ''),
  (-11,  2, 't1',  'ELA-claim1', 'ELA-c1'),
  (-12,  2, 't2',  'ELA-claim2', 'ELA-c2'),
  (-13,  2, 't3',  'ELA-claim3', 'ELA-c3'),
  (-14,  2, 't4',  'ELA-claim4', 'ELA-c4');

INSERT INTO staging_target (id, code, natural_id, claim_id, description) VALUES
  (-1,  'F',  'Target1',-1, 'Algebra: Perform arithmetic operations on polynomials.'),
  (-2,  'X',  'Target2',-21, 'Algebra: Understand the relationship between zeros and factors of polynomials.'),
  (-3,  'XX', 'Target3',-3, 'Algebra: Use polynomial identities to solve problems.'),
  (-4,  'XXX','Target4',-4, 'Algebra: Rewrite rational expressions.'),

  (-67,  'I',  'UpdatedTarget',-67, 'UpdatedTarget Description'),
  (-68,  'J',  'Target8',-68, 'Algebra: Represent and solve equations and inequalities graphically.'),
  (-69,  'X',  'Target9',-69, 'Algebra: Solve systems of equations.'),

  -- add more data for the default subjects to better control validation while testing
  (-99,  'E-3', 'NBT|99',  -11,  'NBT|E-3-1'),
  (-98,  'E-3', 'NBT|98',  -11,  'NBT|E-3-1'),

  -- we need to test a use case with 'Math' subject and claim '1' since it has special migrate rules
  -- since it is being pre-loaded we need to get the db id
  (-71,  'E-3', 'tNBT|E-3',-1, 'NBT|E-3-1'),
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

INSERT INTO staging_depth_of_knowledge(id, level, subject_id, description, reference) VALUES
  (-99, -1,  1, 'Recall and Reproduction','something'),
  (-98, -2,  1, 'Basic Skills and Concepts','anything'),
  (-96, -2, -1, 'Basic Skills and Concepts','anything'),
  (-66,  1, -3, 'new description','new'),
  (-67,  2, -3, 'updated description','updated'),
  (-68,  3, -3, 'Basic Skills and Concepts','anything');

INSERT INTO staging_common_core_standard(id, natural_id, subject_id, description) VALUES
  (-59, 'naturalId-9', -1, 'ccommon core -99'),
  (-58, 'naturalId-8', -1, 'common core -98'),
  (-66, 'new',         -3, 'new description'),
  (-67, 'updated',     -3, 'updated description'),
  (-68, 'old',         -3, 'old description');

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_district_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample District Group -98', 'natural_id-98', -99);

INSERT INTO staging_district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -99),
  (-98, 'Sample District -98', 'natural_id-98', -99);

INSERT INTO staging_school_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample School Group -98', 'natural_id-98', -99);

INSERT INTO staging_school (id, district_id, district_group_id, school_group_id, name, natural_id, deleted, migrate_id, update_import_id, updated) VALUES
  (-99, -99, NULL, NULL, 'Sample School -99', 'natural_id-99', 0, -99, -1, '2017-07-18 20:14:34.000000'),
  (-98, -98, -98, -98, 'Sample School -98', 'natural_id-98', 0, -99, -1, '2017-07-18 20:14:34.000000');

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO staging_asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, migrate_id, update_import_id, updated) VALUES
  (-99, '(SBAC)SBAC-IAB-ASMT TEST-99',   -99, 2, 1, 1999, 'IAB-ASMT TEST-99', 'IAB-ASMT TEST-99',     '9835', 0, -99, -1, '2017-07-18 20:14:34.000000'),
  (-98, '(SBAC)SBAC-ICA-ASMT TEST-98',   -98, 1, 2, 1999, 'ICA-ASMT TEST-98', 'ICA-ASMT TEST-98',     '9831', 0, -99, -1, '2017-07-18 20:14:34.000000'),

  (-59,  '(SBAC)SBAC-SUMMATIVE-TEST-59', -99, 3, 1, 1999, 'SUMMATIVE TEST-59', 'SUMMATIVE TEST-59 Math', '1', 0, -99, -1, '2017-07-18 20:14:34.000000'),
  (-311, '(SBAC)SBAC-SUMMATIVE-TEST-58', -98, 3, 2, 1999, 'SUMMATIVE TEST-58', 'SUMMATIVE TEST-58 Ela',  '1', 0, -99, -1, '2017-07-18 20:14:34.000000'),
  (-111, '(SBAC)SBAC-SUMMATIVE-TEST-48', -98, 3, 1, 1999, 'SUMMATIVE TEST-48', 'SUMMATIVE TEST-48 Math', '1', 0, -99, -1, '2017-07-18 20:14:34.000000');

INSERT INTO staging_asmt_target(asmt_id, target_id, migrate_id) VALUES
   (-59,  -71, -99),
   (-59,  -72, -99),
   (-311, -11, -99),
   (-311, -12, -99),
   (-311, -21, -99),
   (-111, -71, -99),
   (-111, -72, -99);

INSERT INTO staging_asmt_target_exclusion(asmt_id, target_id, migrate_id) VALUES
   (-59,  -72, -99),
   (-311, -12, -99),
   (-111, -71, -99);

INSERT INTO staging_asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, migrate_id) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701, -99),
  (-98, 2442, 2502, 2582, 2201, 2701, -99),
  (-59, 2442, 2502, 2582, 2201, 2701, -99),
  (-311, 2442, 2502, 2582, 2201, 2701, -99),
  (-111, 2442, 2502, 2582, 2201, 2701, -99);

INSERT INTO staging_item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty_code, max_points, math_practice, allow_calc, position, performance_task_writing_type, migrate_id) VALUES
  (-990, -1, -71, '200-2010',  -99, -99, 'M', 2, -99, 0, 1, 'pttype1', -99),
  (-991, -1, -71, '200-18943', -99, -99, 'E', 2, -98, 0, 2, 'Narrative', -99),
  (-992, -2, -72, '200-8906',  -99, -99, 'E', 2, -99, 1, 3, 'Informational', -99),
  (-993, -2, -72, '200-2014',  -99, -98, 'D', 2, -98, 1, 4, 'Explanatory', -99),

  (-980, -11, -11, '200-60347', -98, -98, 'M', 1, null, null, 3, 'Opinion', -99),
  (-981, -12, -21, '200-51719', -98, -98, 'E', 1, null, null, 6, 'Argumentative', -99),
  (-982, -13, -31, '200-59217', -98, -98, 'E', 1, null, null, 7, null, -99),
  (-983, -14, -41, '200-59208', -98, -98, 'D', 1, null, null, 8, null, -99),
  (-984, -14, -42, '200-30901', -98, -98, 'D', 1, null, null, 9, null ,-99);

INSERT INTO staging_item_other_target(item_id, target_id) values
 (-990, -98),
 (-990, -99),

 (-980, -98);

INSERT INTO staging_item_common_core_standard(item_id, common_core_standard_id) values
 (-990, -98),
 (-990, -99),

 (-980, -98);

-- ------------------------------------------ Percentile ---------------------------------------------------------------------------------------------------------
INSERT INTO staging_percentile (id, asmt_id, start_date, end_date, count, mean, standard_deviation, min_score, max_score, update_import_id, updated, migrate_id, deleted) VALUES
  (-89, -99, '2018-01-01', '2018-03-31', 835430, 2420.1, 88.9, 1111, 3333, -99, '2017-07-18 19:05:34.966000', -99, 0),
  (-88, -11, '2018-01-01', '2018-03-31', 843395, 2461, 93.8, 1111, 4444, -99, '2017-07-18 19:05:34.966000', -99, 0);

INSERT INTO staging_percentile_score (percentile_id, percentile_rank, score, min_inclusive, max_exclusive) VALUES
  (-89, 25, 2278, 1111, 2420),(-89, 50, 2420, 2420, 2566),(-89, 75, 2566, 2566, 3333),
  (-88, 10, 2307, 1111, 2408),(-88, 30, 2408, 2408, 2464),(-88, 50, 2464, 2464, 2516),(-88, 70, 2516, 2516, 2612),(-88, 90, 2612, 2612, 4444);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------

 INSERT INTO staging_student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
        lep_exit_at, birthday, update_import_id, migrate_id, deleted, updated) VALUES
   (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -89, -99, 0, '2017-07-18 20:14:34.000000'),
   (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -88, -99, 0, '2017-07-18 20:14:34.000000'),
   (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -87, -99, 0, '2017-07-18 20:14:34.000000'),
   (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', null, '2012-08-14', '2012-11-13', null, '2000-01-01', -86, -99, 0, '2017-07-18 20:14:34.000000');

INSERT INTO staging_student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99),
    (-88,  -98),
    (-87,  -98),
    (-86,  -98),
    (-86,  -99);

INSERT INTO staging_student_group (id, creator, created, school_id, school_year, name, subject_id, update_import_id, migrate_id, active, deleted, updated) VALUES
   (-91, 'dwtest@example.com', NOW(), -99, 1999, 'Test Student Group 9', null, -79, -99, 1, 0, '2017-07-18 20:14:34.000000'),
   (-8, 'dwtest@example.com',  NOW(), -1, 1999, 'Test Student Group 8', null, -79, -99, 1, 0, '2017-07-18 20:14:34.000000'),
   (-7, 'dwtest@example.com',  NOW(), -1, 1999, 'Test Student Group 7', null, -79, -99, 1, 0, '2017-07-18 20:14:34.000000');

 INSERT INTO staging_student_group_membership (student_group_id, student_id) VALUES
   (-91, -89),
   (-91, -88),
   (-91, -87),
   (-91, -86),
   (-8, -87),
   (-7, -87),
   (-7, -86);

 INSERT INTO staging_user_student_group (student_group_id, user_login) VALUES
   (-91, 'dwtest@example.com-91'),
   (-8, 'dwtest@example.com-8'),
   (-7, 'dwtest@example.com-7'),
   (-91, 'dwtest@example.com-91-2');

-- ------------------------------------------  Exams ------------------------------------------------------------------------------------------------
INSERT INTO  staging_exam ( id, type_id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
             administration_condition_id, session_id, performance_level, scale_score, scale_score_std_err, completed_at, update_import_id, deleted, migrate_id, updated,
             grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
             migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) VALUES
(-88, 1, 1999, -99,  null, 1, -98, -98, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88, '2017-07-18 20:14:34.000000', -98, -89, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 'updated t3 type', 'eng', null),
(-87, 1, 1999, -11,  null, 1, -99, -99, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88, '2017-07-18 20:14:34.000000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
(-86, 1, 1999, -11,  null, 1, -99, -99, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88, '2017-07-18 20:14:34.000000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

(-59, 3, 1999, -59,  null, 1, -99, -99, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88, '2017-07-18 20:14:34.000000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
(-111,3, 1999, -111, null, 1, -99, -99, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88, '2017-07-18 20:14:34.000000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
(-311,3, 1999, -311, null, 1, -99, -99, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88, '2017-07-18 20:14:34.000000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null);

INSERT INTO staging_exam_available_accommodation (exam_id, accommodation_id) VALUES
    (-88, -98),
    (-88, -99),
    (-87, -98);

INSERT INTO staging_exam_item (id, exam_id, item_id, score, score_status, response, position, migrate_id) VALUES
   (-1, -88,  -9, 1, 'SCORED', '<response><math xmlns="http://www.w3.org/1998/Math/MathML" title="10"><mstyle><mn>10</mn></mstyle></math></response>', 1, -88),
   (-2, -88,  -8, 1, 'SCORED', 'D', 2, -88),
   (-3, -88,  -7, 0, 'SCORED', 'C', 3, -88),
   (-4, -88,  -6, -1, 'SCORED', null, 16, -88),
   (-5, -87,  -6, -1, 'SCORED', null, 16, -88);

INSERT INTO staging_exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
   (-1, -88, 1, 2014, 0.19, 1);

INSERT INTO staging_exam_target_score (id, target_id, exam_id, student_relative_residual_score, standard_met_relative_residual_score) VALUES
  (-1,   -71, -59,  -1,    -1     ),

  (-11,  -11, -311,  null,    null ),
  (-19,  -34, -311,  0.1,    0.1   ),
  (-191, -41, -311,  0.1,    null  ),
  (-192, -43, -311,  null,   0.1   ),

  (-230,  -73, -111, null,    null );