-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.district (id, name, natural_id) VALUES
  (-1, 'Before Test -1', 'natural_id-1'),
  (-99, 'Before Test -99', 'natural_id-99');

INSERT INTO reporting_test.school (id, district_id, name, natural_id, import_id) VALUES
  (-1, -1, 'Before Test -1', 'natural_id-1', -1),
  (-99, -99, 'Before Test -99', 'natural_id-99', -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, import_id) VALUES
   (-99, '(SBAC)SBAC-IAB-ASMT TEST', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', -1);

INSERT INTO reporting_test.asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701);

INSERT INTO reporting_test.item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc) VALUES
  (-9,   -99, null, '200-2010',  -99, -99, -0.23, 2, -99, 0), -- this should be deleted after an update
  (-990, -99, null, '200-2010',  -99, -99, -0.23, 2, -99, 0),
  (-991, -99, null, '200-18943', -99, -99, -0.13, 2, -98, 0),
  (-992, -99, null, '200-8906',  -99, -99, -0.03, 2, -99, 1),
  (-993, -99, null, '200-2014',  -99, -98,  1.23, 2, -98, 1);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
        lep_exit_at, birthday, import_id) VALUES
   (-89, '89', 'TestName', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -89);

INSERT INTO reporting_test.student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99);

INSERT INTO reporting_test.student_group (id, creator, school_id, school_year, name, subject_id, import_id) VALUES
   (-91, 'TestName', -1, 2017, 'Test Student Group 9', null, -79);

INSERT INTO reporting_test.student_group_membership (student_group_id, student_id) VALUES
   (-91, -89);

INSERT INTO reporting_test.user_student_group (student_group_id, user_login) VALUES
   (-91, 'dwtest@example.com-91');

