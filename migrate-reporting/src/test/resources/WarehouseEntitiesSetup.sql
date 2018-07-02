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
  (1, -1, 10, 3, 6),
  (1, -2, 5, 2, 6),
   -- new entry
  (1, -3, 8, 2, 7),
   -- updated entry
  (2, -3, 8, 2, 7);

INSERT INTO subject_claim_score (id, subject_id, asmt_type_id, code, display_order, data_order) VALUES
  (-1,  -1, 1, 'Score1',   0, 1),
  (-2,  -1, 1, 'Score2',   0, 2),
  (-3,  -1, 1, 'Score3',  -3, 3),
  (-4,  -2, 3, 'Score4',  -4, 4),
  (-5,  -2, 3, 'Score5',   0, 5),
  (-6,  -2, 3, 'Score6',  -5, 6),
  (-14,  -3, 3, 'Score7', -6, 4),
  (-15,  -3, 3, 'Update', -7, 5),
  (-16,  -3, 3, 'New',    -8, 6);

INSERT INTO subject_translation(subject_id, label_code, label) VALUES
  (-1, 'integration test subject 1',       '1 test label'),
  (-1, 'integration test subject 1 again', '1 again test label'),
  (-2, 'integration test label subject 2', 'subject 2'),
  (-3, 'integration test - new translation for subject 3',      'subject 3 - changed'),
  (-3, 'integration test - upadated translation for subject 3', 'new');

INSERT INTO claim (id, subject_id, code) VALUES
  (-21,-1, 'ClaimCode2'),
  (-3, -1, 'ClaimCode3'),
  (-4, -1, 'ClaimCode4'),
  (-5, -2, 'ClaimCode5'),
  (-6, -2, 'ClaimCode6'),
  (-7, -2, 'ClaimCode7'),
  (-8, -2, 'ClaimCode8'),
  (-9, -2, 'ClaimCode9'),

  (-66, -3, 'Update66'),
  (-67, -3, 'new'     ),
  (-68, -3, 'Old68'   ),
  (-69, -3, 'Old69'   ),
  -- add more data for the default subjects to better control validation while testing
  (-1,   1, 't1'),
  (-2,   1, 't3'),
  (-99,  2, 'c9'),
  (-98,  2, 'c8'),
  (-11,  2, 't1'),
  (-12,  2, 't2'),
  (-13,  2, 't3'),
  (-14,  2, 't4');

INSERT INTO target (id, natural_id, claim_id) VALUES
  (-1, 'Target1',-1 ),
  (-2, 'Target2',-2 ),
  (-3, 'Target3',-3 ),
  (-4, 'Target4',-4 ),
  (-5, 'Target5',-5 ),
  (-6, 'Target6',-6 ),
  (-7, 'Target7',-7 ),
  (-8, 'Target8',-8 ),
  (-9, 'Target9',-9 ),

  (-66, 'NewTarget',    -66),
  (-67, 'UpdatedTarget',-67),
  (-68, 'Target8',      -68),
  (-69, 'Target9',      -69),

  -- add more data for the default subjects to better control validation while testing
  (-99, 'NBT|99',  -11),
  (-98, 'NBT|98',  -11),

  -- we need to test a use case with 'Math' subject and claim '1' since it has special migrate rules
  -- since it is being pre-loaded we need to get the db id
  (-71,'tNBT|E-3', (SELECT id FROM claim WHERE code = '1' AND subject_id = 1)),
  (-72, 'MD|J-3', -2),
  (-73, 'OA|D',   -2),

  (-11,'NBT|E-3', -11),
  (-12, 'MD|J-3', -11),
  (-21, 'OA|D',   -12),
  (-22, 'OA|A',   -12),
  (-31, 'NF|C',   -13),
  (-32, 'MD|D',   -13),
  (-33, 'MD|E',   -13),
  (-34, 'OA|E',   -13),
  (-41, 'OA|E',   -14),
  (-42, 'MD|D',   -14),
  (-43, 'OA|A',   -14);

INSERT INTO depth_of_knowledge(id, level, subject_id, reference) VALUES
  (-99, -1,  1, 'something'),
  (-98, -2,  1, 'anything'),
  (-97, -2, -2, 'anything'),
  (-96, -2, -1, 'anything'),
  (-66,  1, -3, 'new'),
  (-67,  2, -3, 'updated'),
  (-68,  3, -3, 'anything');

INSERT INTO common_core_standard(id, natural_id, subject_id) VALUES
  (-99, 'naturalId-99',  1),
  (-98, 'naturalId-98',  1),
  (-59, 'naturalId-9',  -1),
  (-58, 'naturalId-8',  -1),
  (-97, 'naturalId-97', -2),
  (-66, 'new',          -3),
  (-67, 'updated',      -3),
  (-68, 'old',          -3);

-- ------------------------ Preload  entities into warehouse  -------------------------------------------------------------------------------------------------------
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

INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id, created, updated) VALUES
  (-11, '(SBAC)SBAC-IAB-ASMT TEST-11',  -98, 2, 1, 1999, 'IAB-MATH-11',       'IAB-MATH-11',         '9835', 0, -5000, -5000,'2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-99, '(SBAC)SBAC-ICA-ASMT TEST-99',  -99, 1, 1, 1999, 'ICA-MATH-4-99',     'ICA-MATH-4-99',       '9835', 1, -5000, -20,  '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-98, '(SBAC)SBAC-ICA-ASMT TEST-98',  -98, 1, 2, 1999, 'ICA-ELA-98',        'ICA-ELA-98',          '9831', 0, -20,   -20,  '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),

  (-59,  '(SBAC)SBAC-SUMMATIVE-TEST-59', -99, 3, 1, 1999, 'SUMMATIVE TEST-59', 'SUMMATIVE TEST-59 Math', '1', 1, -5000, -20, '2017-05-18 19:05:33.969660', '2017-07-18 19:05:34.966000'),
  (-311, '(SBAC)SBAC-SUMMATIVE-TEST-58', -98, 3, 2, 1999, 'SUMMATIVE TEST-58', 'SUMMATIVE TEST-58 Ela',  '1', 0, -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-111, '(SBAC)SBAC-SUMMATIVE-TEST-48', -98, 3, 1, 1999, 'SUMMATIVE TEST-48', 'SUMMATIVE TEST-48 Math', '1', 0, -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, difficulty_code, max_points, math_practice, allow_calc, position,
                field_test, active, type, options_count, answer_key, performance_task_writing_type ) VALUES
  (-9,   -11, -11, '200-2019',  -11, -99, -0.23, 'E', 2, -99, 0, 1, null, null, null, null, null, null),
  (-8,   -11, -11, '200-2018',  -11, -99, -0.23, 'E', 2, -99, 0, 2, null, null, null, null, null, null),
  (-7,   -11, -11, '200-2017',  -11, -99, -0.23, 'E', 2, -99, 0, 3, null, null, null, null, null, null),
  (-6,   -11, -11, '200-2016',  -11, -99, -0.23, 'E', 2, -99, 0, 4, null, null, null, null, null, null),

  (-990, -12, -21, '200-2010',  -99, -99, -0.23, 'E',  2, -99, 0, 4, null, null, null, null, null, null),
  (-991, -13, -31, '200-18943', -99, -99, -0.13, 'E', 2, -98, 0, 3, false, true, 1, 0, 'key', 'Narrative'),
  (-992, -14, -41, '200-8906',  -99, -99, -0.03, 'E', 2, -99, 1, 2, false, true, 1, 0, 'key', 'Informational'),
  (-993, -11, -12, '200-2014',  -99, -98,  1.23, 'D', 2, -98, 1, 1, false, true, 1, 0, 'key', 'Explanatory'),

  -- we need to test a use case with 'Math' subject and claim '1' since it has special migrate rules
  -- since it is being pre-loaded we need to get the db id
  (-980, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1),  -71, '200-60347', -98, -98, -0.32, 'E', 1, null, null, 5, false, true, 1, 0, 'key', 'Opinion'),
  (-981, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1),  -71, '200-51719', -98, -98, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key', 'Opinion'),
  (-982, -2,  -72, '200-59217', -98, -98, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key', 'Argumentative'),
  (-983, -2,  -73, '200-59208', -98, -98, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key', 'Argumentative'),
  (-984, -2,  -73, '200-30901', -98, -98, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key', 'Argumentative'),

  (-89, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1), -71, '200-2016',  -59, -99, -0.23, 'E', 2, -99, 0, 4, null, null, null, null, null, null),
  (-90, -2, -72, '200-2010',  -59, -99, -0.23, 'E', 2, -99, 0, 4, null, null, null, null, null, null),
  (-91, -2, -72, '200-18943', -59, -99, -0.13, 'E', 2, -98, 0, 3, false, true, 1, 0, 'key', 'Narrative'),
  (-92, -2, -73, '200-8906',  -59, -99, -0.03, 'E', 2, -99, 1, 2, false, true, 1, 0, 'key', 'Informational'),
  (-93, -2, -73, '200-2014',  -59, -98,  1.23, 'D', 2, -98, 1, 1, false, true, 1, 0, 'key', 'Explanatory'),

  (-80, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1), -71, '200-60347', -111, -98, -0.32, 'E', 1, null, null, 5, false, true, 1, 0, 'key', 'Opinion'),
  (-81, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1), -71, '200-51719', -111, -98, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key', 'Opinion'),
  (-82, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1), -71, '200-59217', -111, -98, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key', 'Argumentative'),
  (-83, (SELECT id FROM claim WHERE code = '1' AND subject_id = 1), -71, '200-59208', -111, -98, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key', 'Argumentative'),
  (-84, -2, -72, '200-30901', -111, -98, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key', 'Argumentative'),

  (-180, -11, -11, '200-60347', -311, -98, -0.32, 'E', 1, null, null, 5, false, true, 1, 0, 'key', 'Opinion'),
  (-181, -12, -21, '200-51719', -311, -98, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key', 'Opinion'),
  (-182, -13, -31, '200-59217', -311, -98, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key', 'Argumentative'),
  (-183, -14, -41, '200-59208', -311, -98, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key', 'Argumentative'),
  (-184, -14, -42, '200-30901', -311, -98, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key', 'Argumentative');

INSERT INTO asmt_target_exclusion(asmt_id, target_id) VALUES
  (-59,  -71),
  (-59,  -72),
  (-111, -71),
  (-111, -72),
  (-311, -11),
  (-311, -41);

 INSERT INTO item_common_core_standard(item_id, common_core_standard_id) values
  (-9, -98),
  (-9, -99),
  (-8, -98),
  (-990, -98),
  (-990, -99),
  (-980, -98);

INSERT INTO asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, cut_point_4, cut_point_5, min_score, max_score) VALUES
  (-99,  2442, 2502, 2582, null, null, 2201, 2701),
  (-98,  2442, 2502, 2582, 2590, 2595, 2201, 2701),
  (-59,  2442, 2502, 2582, null, null, 2201, 2701),
  (-111, 2442, 2502, 2582, null, null, 2201, 2701),
  (-311, 2442, 2502, 2582, null, null, 2201, 2701);

INSERT INTO item_other_target(item_id, target_id) values
  (-990, -98),
  (-990, -99),
  (-980, -98);

INSERT INTO percentile (id, asmt_id, start_date, end_date, count, mean, standard_deviation, min_score, max_score, deleted, import_id, update_import_id, created, updated) VALUES
  (-89, -11, '2018-01-01', '2018-03-31', 835430, 2420.1, 88.9, 0,    9999, 1, -20, -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-88, -98, '2018-01-01', '2018-03-31', 843395, 2461,   93.8, 1111, 4444, 0, -20, -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO percentile_score (percentile_id, percentile_rank, score, min_inclusive, max_exclusive) VALUES
  (-89, 25, 2278, 0, 2420),(-89, 50, 2420, 2420, 2566),(-89, 75, 2566, 2566, 9999),
  (-88, 10, 2307, 1111, 2408),(-88, 30, 2408, 2408, 2464),(-88, 50, 2464, 2464, 2516),(-88, 70, 2516, 2516, 2612),(-88, 90, 2612, 2612, 4444);

INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                                    lep_exit_at, birthday, inferred_school_id, import_id, update_import_id, deleted, created, updated) VALUES
  (-11, '11', 'LastName-preload', 'FirstName-preload', 'MiddleName-preload', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, -5000, -5000, 0, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, -5000, -89, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:00.966000'),
  (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', null, -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000'),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, -87, -87, 0, '2017-07-18 19:09:33.966000', '2017-07-18 19:09:33.966000'),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1,  -86, -86, 0, '2017-07-18 19:09:3.966000', '2017-07-18 19:09:33.966000'),
  (-33, '33', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, 2000, 2000, 0, '2017-07-18 20:16:33.966000', '2017-07-18 20:16:33.966000');

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
  (-89,  -99),
  (-88,  -98),
  (-87,  -98),
  (-86,  -98),
  (-86,  -99);

-- student_group added at import -5000 and deleted at import -79
INSERT INTO student_group (id, creator, school_id, school_year, name, subject_id, import_id, update_import_id, active, deleted, created, updated) VALUES
  (-91, 'dwtest@example.com', -99, 1999, 'Test Student Group 9 - updated school', null, -5000, -79, 1, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:10:34.966000'),
  (-8, 'dwtest@example.com', -1, 1999, 'Test Student Group 8', null, -79, -79, 1, 0, '2017-07-18 19:10:34.966000', '2017-07-18 19:10:34.966000'),
  (-7, 'dwtest@example.com', -1, 1999, 'Test Student Group 7', null, -79, -79, 1, 0, '2017-07-18 19:10:34.966000', '2017-07-18 20:16:33.966000');

INSERT INTO student_group_membership (student_group_id, student_id) VALUES
  (-91, -89),
  (-91, -88),
  (-91, -87),
  (-91, -86),
  (-8, -87),
  (-7, -87),
  (-7, -86),
  (-7, -33);

INSERT INTO user_student_group (student_group_id, user_login) VALUES
  (-91, 'dwtest@example.com-91'),
  (-8, 'dwtest@example.com-8'),
  (-7, 'dwtest@example.com-7'),
  (-91, 'dwtest@example.com-91-2');

INSERT INTO exam ( id, type_id, school_year, asmt_id, asmt_version, opportunity, completeness_id, elas_id, elas_start_at,
                    administration_condition_id, session_id, performance_level, scale_score, scale_score_std_err, completed_at,
                    import_id, update_import_id, deleted, created, updated,
                    grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
                    migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) VALUES
  (-88, 1, 1999,  -99,  null, 1, 1,  null, null,        1, 'session', 1, 2145, 0.17,   '2016-08-14', -5000, -88, 1,'2017-05-18 19:05:33.967000', '2017-07-18 19:06:07.966000', -98, -89, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-87, 1, 1999,  -98,  null, 1, 1,  -99, '2014-08-01', 1, 'session', 1, null, null,   '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-86, 2, 1999,  -11,  null, 1, 1,  -98, '2015-08-01', 1, 'session', 1, null, null,   '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-85, 2, 1999,  -11,  null, 1, 1,  null, null,        1, 'session', 1, 2145, 0.17,   '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-59,  3, 1999, -59,  null, 1, 1, -98,   null,        1, 'session', 1, null, null,   '2016-08-14', -88, -88, 1, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-111, 3, 1999, -111, null, 1, 1, -98,   null,        1, 'session', 1, null, null,   '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-311, 3, 1999, -311, null, 1, 1, -98,   null,        1, 'session', null, null, null,'2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null);

INSERT INTO exam_available_accommodation (exam_id, accommodation_id) VALUES
  (-88, -98),
  (-88, -99),
  (-87, -98),
  (-86, -98),
  (-85, -98);

INSERT INTO exam_item (id, exam_id, item_id, score, score_status, response, position) VALUES
  (-1, -88,  -9,   1, 'SCORED', '<response><math xmlns="http://www.w3.org/1998/Math/MathML" title="10"><mstyle><mn>10</mn></mstyle></math></response>', 1),
  (-2, -88,  -8,   1, 'SCORED', 'D', 2),
  (-3, -88,  -7,   0, 'SCORED', 'C', 3),
  (-4, -88,  -6,  -1, 'SCORED', null, 16),
  (-5, -87,  -6,  -1, 'SCORED', null, 16),
  (-6, -85,  -6,  -1, 'SCORED', null, 16),
  (-7, -86,  -6,  -1, 'SCORED', null, 16),
  (-8, -311,-180, -1, 'SCORED', null, 16);

INSERT INTO exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
   (-11, -88, 1, 2014, 0.19, 1),
   (-12, -88, 2, 2014, 0.19, 1),
   (-13, -88, 3, 2014, null, 1),
   (-14, -88, 4, 2014, 0.19, null),
   (-21, -87, 5, 2014, 0.19, 1),
   (-22, -87, 6, 2014, null, 1),
   (-23, -87, 7, 2014, 0.19, null);

INSERT INTO exam_target_score (id, target_id, exam_id, student_relative_residual_score, standard_met_relative_residual_score) VALUES
  (-1,   -71, -59,  -1,    -1     ),
  (-2,   -72, -59,  0.123,  0.1456),
  (-3,   -73, -59,  0.1,    0.1   ),

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

  (-210,  -71, -111, -0.88, -0.88  ),
  (-220,  -72, -111, 1,      1     ),
  (-230,  -73, -111, 0.1,    0.1   );