-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO district_group (id, name, natural_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98');

INSERT INTO district (id, name, natural_id) VALUES
  (-1, 'Before Test -1', 'natural_id-1'),
  (-99, 'Before Test -99', 'natural_id-99');

INSERT INTO school_group (id, name, natural_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98');

INSERT INTO school (id, district_id, district_group_id, school_group_id, name, natural_id, embargo_enabled, update_import_id, updated, migrate_id) VALUES
  (-1, -1, NULL, NULL, 'Before Test -1', 'natural_id-1', 0, -5000, '2017-05-18 20:06:34.966000', -1),
  (-99, -99, NULL, NULL, 'Before Test -99', 'natural_id-99', 0, -1, '2017-07-18 20:14:34.000000', -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO asmt (id, natural_id, grade_id, grade_code, type_id, subject_id, school_year, name, label, version, update_import_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, updated, migrate_id) VALUES
   (-11, '(SBAC)SBAC-IAB-ASMT TEST-11',   -98, '98', 2, 1, 1999, 'IAB-ASMT TEST-11', 'test',    '9835', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1),
   (-99, '(SBAC)SBAC-ICA-ASMT TEST-99',   -99, '99', 1, 1, 1999, 'ICA-ASMT TEST-99', 'test',    '9835', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1),

   (-59,  '(SBAC)SBAC-SUMMATIVE-TEST-59', -99, '99', 3, 1, 1999, 'SUMMATIVE TEST-59', 'SUMMATIVE TEST-59 Math', '1', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1),
   (-311, '(SBAC)SBAC-SUMMATIVE-TEST-58', -98, '98', 3, 2, 1999, 'SUMMATIVE TEST-58', 'SUMMATIVE TEST-58 Ela',  '1', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1),
   (-111, '(SBAC)SBAC-SUMMATIVE-TEST-48', -98, '98', 3, 1, 1999, 'SUMMATIVE TEST-48', 'SUMMATIVE TEST-48 Math', '1', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1);

INSERT INTO asmt_target(asmt_id, target_id, include_in_report) VALUES
   (-311, -11, true),
   (-311, -12, true),
   (-59,  -72, true),
   (-59,  -71, false),
   (-111, -71, false),
   (-111, -72, true);

INSERT INTO asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701);

INSERT INTO item (id, claim_id, claim_code, target_id, target_code, common_core_standard_ids, natural_id, asmt_id, dok_id, dok_level_subject_id, difficulty_code, max_points, math_practice, allow_calc, position) VALUES
  (-9,   -1, '1', -71, 'target', null, '200-2009',  -11, -99, '1_99', 'E', 2, -99, 0, 1),
  (-8,   -1, '1', -71, 'target', 'cc', '200-2008',  -11, -99, '1_99', 'M', 2, -99, 0, 2),
  (-7,   -1, '1', -71, 'target', 'cc', '200-2007',  -11, -99, '1_99', 'D', 2, -99, 0, 3),
  (-6,   -2, '2', -72, 'target', 'cc', '200-2006',  -11, -99, '1_99', 'D', 2, -99, 0, 4),
  (-990, -2, '2', -73, 'target', 'cc', '200-2990',  -99, -99, '1_99', 'D', 2, -99, 0, 4),
  (-991, -2, '2', -73, 'target', 'cc', '200-18943', -99, -99, '1_99', 'D', 2, -98, 0, 3),
  (-992, -2, '2', -73, 'target', 'cc', '200-2992',  -99, -99, '1_99', 'D', 2, -99, 1, 2),
  (-993, -2, '2', -73, 'target', 'cc', '200-2993',  -99, -98, '1_99', 'D', 2, -98, 1, 1);

INSERT INTO item_other_target(item_id, target_id) values
 (-990, -98),
 (-991, -98);

INSERT INTO item_common_core_standard(item_id, common_core_standard_id) values
 (-990, -98),
 (-991, -98);

-- ------------------------------------------ Percentiles --------------------------------------------------------------------------------------------------
INSERT INTO percentile (id, asmt_id, start_date, end_date, count, mean, standard_deviation, min_score, max_score, update_import_id, updated, migrate_id) VALUES
  (-89, -99, '2018-01-01', '2018-03-31', 835430, 2420.1, 88.9, 1000, 3000, -99, '2017-07-18 19:05:34.966000', -99);

INSERT INTO percentile_score (percentile_id, percentile_rank, score, min_inclusive, max_exclusive) VALUES
  (-89, 25, 2278, 1000, 2420),(-89, 50, 2420, 2420, 2566),(-89, 75, 2566, 2566, 3000);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, gender_code, first_entry_into_us_school_at, lep_entry_at,
        lep_exit_at, birthday, update_import_id, updated, migrate_id) VALUES
   (-11, '11', 'TestName', 'FirstName2', 'MiddleName2', -98, 'before_test', '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, '2017-05-18 20:06:34.966000', -1),
   (-89, '89', 'TestName', 'FirstName2', 'MiddleName2', -98, 'before_test', '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, '2017-05-18 20:06:34.966000', -1);

INSERT INTO student_ethnicity(student_id, ethnicity_id, ethnicity_code) values
    (-89,  -99, 'before test');

INSERT INTO student_group (id, creator, school_id, school_year, name, subject_id, update_import_id, created, updated, migrate_id) VALUES
   (-91, 'TestName', -1, 1999, 'Test Student Group 9', null, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000', -1);

INSERT INTO student_group_membership (student_group_id, student_id) VALUES
   (-91, -89);

INSERT INTO user_student_group (student_group_id, user_login) VALUES
   (-91, 'dwtest@example.com-91');

-- ------------------------------------------ Exams ---------------------------------------------------------------------------------------------

INSERT INTO  exam (id, type_id, school_year, asmt_id, asmt_version, opportunity, administration_condition_code, session_id, performance_level,
                                scale_score, scale_score_std_err, completed_at, update_import_id, grade_id, student_id, school_id,
                                iep, lep, section504, economic_disadvantage, migrant_status, eng_prof_lvl, t3_program_type,
                                language_code, prim_disability_type, completeness_code, grade_code,
                                claim1_scale_score, claim1_scale_score_std_err,claim1_category,
                                claim2_scale_score, claim2_scale_score_std_err,claim2_category,
                                claim3_scale_score, claim3_scale_score_std_err,claim3_category,
                                claim4_scale_score, claim4_scale_score_std_err,claim4_category,
                                updated, migrate_id) VALUES
(-88, 1,  1999, -99,  null, 1, 'before test', 'test', 1, 2145, 0.17, '2016-08-14', -88, -98, -89, -1, 1, 1, 0, 0, 1,
  'test', 'test', 'eng', null, 'before', '98', 2000, 0.11, 1, 2100, 0.12, 2, 2500, 0.13, 3, 3000, .15, 4, '2017-07-18 19:06:07.966000', -1),

(-59,  3, 1999, -59,   null, 1, 'before test', 'test', 1, 2145, 0.17, '2016-08-14', -88, -98, -11, -1, 1, 1, 0, 0, 1,
  'test', 'test', 'eng', null, 'before', '98', 2000, 0.11, 1, 2100, 0.12, 2, 2500, 0.13, 3, 3000, .15, 4, '2017-07-18 19:06:07.966000', -1),
(-111, 3, 1999, -111,  null, 1, 'before test', 'test', 1, 2145, 0.17, '2016-08-14', -88, -98, -11, -1, 1, 1, 0, 0, 1,
  'test', 'test', 'eng', null, 'before', '98', 2000, 0.11, 1, 2100, 0.12, 2, 2500, 0.13, 3, 3000, .15, 4, '2017-07-18 19:06:07.966000', -1),
(-311, 3, 1999, -311,  null, 1, 'before test', 'test', 1, 2145, 0.17, '2016-08-14', -88, -98, -11, -1, 1, 1, 0, 0, 1,
  'test', 'test', 'eng', null, 'before', '98', 2000, 0.11, 1, 2100, 0.12, 2, 2500, 0.13, 3, 3000, .15, 4, '2017-07-18 19:06:07.966000', -1);

INSERT INTO exam_available_accommodation (exam_id, accommodation_id) VALUES
    (-88, -98);

INSERT INTO exam_item (id, exam_id, item_id, score, score_status, response, position) VALUES
   (-1, -88,  -9, 1, 'SCORED', 'test', 1);

INSERT INTO exam_target_score (id, target_id, exam_id, student_relative_residual_score, standard_met_relative_residual_score) VALUES
  (-2,   -72, -59,  0.123,  0.1456),
  (-3,   -73, -59,  0.1,    0.1   ),

  (-11,  -11, -311,  -1,    -1     ),
  (-12,  -12, -311,  0.9876, 0.8976),
  (-13,  -21, -311,  0.123,  0.1456);
