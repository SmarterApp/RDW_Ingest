--
--  todo: make sure import id's are aligned with ImportContentSetup.sql
--
-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.district (id, name, natural_id) VALUES
  (-1, 'Before Test -1', 'natural_id-1'),
  (-99, 'Before Test -99', 'natural_id-99');

INSERT INTO reporting_test.school (id, district_id, name, natural_id, import_id) VALUES
  (-1, -1, 'Before Test -1', 'natural_id-1', -2000),
  (-99, -99, 'Before Test -99', 'natural_id-99', -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, import_id) VALUES
   (-11, '(SBAC)SBAC-IAB-ASMT TEST-11', -98, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', -1),
   (-99, '(SBAC)SBAC-IAB-ASMT TEST-99', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', -1);

INSERT INTO reporting_test.asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701);

INSERT INTO reporting_test.item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc) VALUES
  (-9,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-8,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-7,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-6,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-990, -99, -98, '200-2010',  -99, -99, -0.23, 2, -99, 0),
  (-991, -99, -98, '200-18943', -99, -99, -0.13, 2, -98, 0),
  (-992, -99, -98, '200-8906',  -99, -99, -0.03, 2, -99, 1),
  (-993, -99, -98, '200-2014',  -99, -98,  1.23, 2, -98, 1);


INSERT INTO reporting_test.item_other_target(item_id, target_id) values
 (-990, -98),
 (-991, -98);

INSERT INTO reporting_test.item_common_core_standard(item_id, common_core_standard_id) values
 (-990, -98),
 (-991, -98);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
        lep_exit_at, birthday, import_id) VALUES
   (-11, '11', 'TestName', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -89),
   (-89, '89', 'TestName', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -89);

INSERT INTO reporting_test.student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99);

INSERT INTO reporting_test.student_group (id, creator, school_id, school_year, name, subject_id, import_id) VALUES
   (-91, 'TestName', -1, 2017, 'Test Student Group 9', null, -79);

INSERT INTO reporting_test.student_group_membership (student_group_id, student_id) VALUES
   (-91, -89);

INSERT INTO reporting_test.user_student_group (student_group_id, user_login) VALUES
   (-91, 'dwtest@example.com-91');

-- ------------------------------------------ IAB Exams ---------------------------------------------------------------------------------------------

INSERT INTO  reporting_test.iab_exam ( id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
                                administration_condition_id, session_id, category, scale_score, scale_score_std_err,
                                completed_at, import_id, grade_id, student_id, school_id, iep, lep,
                                section504, economic_disadvantage, migrant_status, eng_prof_lvl, t3_program_type, language_code,
                                prim_disability_type) VALUES
(-88,  2016, -99,  null, 1, 1, 1, 'test', 1, 2145, 0.17, '2016-08-14', -87, -98, -89, -1, 1, 1, 0, 0, 1, 'test', 'test', 'eng', null);

INSERT INTO reporting_test.iab_exam_available_accommodation (iab_exam_id, accommodation_id) VALUES
    (-88, -98);

INSERT INTO reporting_test.iab_exam_item (id, iab_exam_id, item_id, score, score_status, response, position) VALUES
   (-1, -88,  -9, 1, 'SCORED', 'test', 1);

-- ------------------------------------------ Exams ---------------------------------------------------------------------------------------------

INSERT INTO  reporting_test.exam ( id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
                                administration_condition_id, session_id, achievement_level, scale_score, scale_score_std_err,
                                completed_at, import_id, grade_id, student_id, school_id, iep, lep,
                                section504, economic_disadvantage, migrant_status, eng_prof_lvl, t3_program_type, language_code,
                                prim_disability_type,
                                claim1_scale_score, claim1_scale_score_std_err,claim1_category,
                                claim2_scale_score, claim2_scale_score_std_err,claim2_category,
                                claim3_scale_score, claim3_scale_score_std_err,claim3_category,
                                claim4_scale_score, claim4_scale_score_std_err,claim4_category ) VALUES
(-88,  2016, -99,  null, 1, 1, 1, 'test', 1, 2145, 0.17, '2016-08-14', -88, -98, -89, -1, 1, 1, 0, 0, 1, 'test', 'test', 'eng', null,
    2000, 0.11, 1, 2100, 0.12, 2, 2500, 0.13, 3, 3000, .15, 4);

INSERT INTO reporting_test.exam_available_accommodation (exam_id, accommodation_id) VALUES
    (-88, -98);

INSERT INTO reporting_test.exam_item (id, exam_id, item_id, score, score_status, response, position) VALUES
   (-1, -88,  -9, 1, 'SCORED', 'test', 1);

