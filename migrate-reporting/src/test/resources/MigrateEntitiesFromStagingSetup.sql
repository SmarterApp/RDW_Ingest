-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_test.staging_district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -99);

INSERT INTO staging_test.staging_district (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample District -98', 'natural_id-98', -99);

INSERT INTO staging_test.staging_school (id, district_id, name, natural_id, deleted, migrate_id, import_id) VALUES
  (-99, -99, 'Sample School -99', 'natural_id-99', 0, -99, -1);

INSERT INTO staging_test.staging_school (id, district_id, name, natural_id, deleted, migrate_id, import_id) VALUES
  (-98, -98, 'Sample School -98', 'natural_id-98', 0, -99, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------

INSERT INTO staging_test.staging_asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, migrate_id, import_id) VALUES
   (-99, '(SBAC)SBAC-IAB-ASMT TEST', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'MTH IAB G4 OperationsAlgebraicThinking', '9835', 0, -99, -1),
   (-98, 'SBAC)SBAC-ICA-ASMT TEST', -98, 1, 2, 2016, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 'Grade 5 ELA', '9831', 0, -99, -1);

INSERT INTO staging_test.staging_asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, migrate_id) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701, -99),
  (-98, 2442, 2502, 2582, 2201, 2701, -99);

INSERT INTO staging_test.staging_item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc, migrate_id) VALUES
  (-990, -99, null, '200-2010',  -99, -99, -0.23, 2, -99, 0, -99),
  (-991, -99, null, '200-18943', -99, -99, -0.13, 2, -98, 0, -99),
  (-992, -99, null, '200-8906',  -99, -99, -0.03, 2, -99, 1, -99),
  (-993, -99, null, '200-2014',  -99, -98,  1.23, 2, -98, 1, -99),

  (-980, -98, null, '200-60347', -98, -98, -0.32, 1, null, null, -99),
  (-981, -98, null, '200-51719', -98, -98, -1.32, 1, null, null, -99),
  (-982, -98, null, '200-59217', -98, -98, -2.32, 1, null, null, -99),
  (-983, -98, null, '200-59208', -98, -98, -0.32, 1, null, null, -99),
  (-984, -98, null, '200-30901', -98, -98, -0.32, 1, null, null, -99);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------

 INSERT INTO staging_test.staging_student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
        lep_exit_at, birthday, import_id, migrate_id, deleted) VALUES
   (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -89, -99, 0),
   (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -88, -99, 0),
   (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -87, -99, 0),
   (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -86, -99, 0);

INSERT INTO staging_test.staging_student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99),
    (-88,  -98),
    (-87,  -98),
    (-86,  -98),
    (-86,  -99);

INSERT INTO staging_test.staging_student_group (id, creator, school_id, school_year, name, subject_id, import_id, migrate_id, active, deleted) VALUES
   (-91, 'dwtest@example.com', -99, 2017, 'Test Student Group 9', null, -79, -99, 1, 0),
   (-8, 'dwtest@example.com', -1, 2017, 'Test Student Group 8', null, -79, -99, 1, 0),
   (-7, 'dwtest@example.com', -1, 2017, 'Test Student Group 7', null, -79, -99, 1, 0);

 INSERT INTO staging_test.staging_student_group_membership (student_group_id, student_id) VALUES
   (-91, -89),
   (-91, -88),
   (-91, -87),
   (-91, -86),
   (-8, -87),
   (-7, -87),
   (-7, -86);

 INSERT INTO staging_test.staging_user_student_group (student_group_id, user_login) VALUES
   (-91, 'dwtest@example.com-91'),
   (-8, 'dwtest@example.com-8'),
   (-7, 'dwtest@example.com-7'),
   (-91, 'dwtest@example.com-91-2');
