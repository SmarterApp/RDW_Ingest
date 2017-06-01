--
-- ---------------------------------------- School/Districts --------------------------------------------------------------------------------------------------

-- preload -------------------------------------------------------------------------------------------------------
INSERT INTO warehouse_test.district (id, name, natural_id) VALUES
  (-1, 'Preload District -1', 'natural_id-1');

INSERT INTO warehouse_test.school (id, district_id, name, natural_id, deleted, import_id, update_import_id) VALUES
  (-1, -1, 'Preload School -1', 'natural_id-1', 0, -5000, -5000);
-- preload -------------------------------------------------------------------------------------------------------

INSERT INTO warehouse_test.district (id, name, natural_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99');

INSERT INTO warehouse_test.district (id, name, natural_id) VALUES
  (-98, 'Sample District -98', 'natural_id-98');

-- -99 is marked as deleted.  It's district will not be copied.
INSERT INTO warehouse_test.school (id, district_id, name, natural_id, deleted, import_id, update_import_id) VALUES
  (-99, -99, 'Sample School -99', 'natural_id-99', 1, -1, -1);

INSERT INTO warehouse_test.school (id, district_id, name, natural_id, deleted, import_id, update_import_id) VALUES
  (-98, -98, 'Sample School -98', 'natural_id-98', 0, -2, -2);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
-- preload -------------------------------------------------------------------------------------------------------

INSERT INTO warehouse_test.asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id) VALUES
  (-11, '(SBAC)SBAC-IAB-ASMT TEST-11', -98, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', 0, -5000, -5000);
  -- (-99, '(SBAC)SBAC-IAB-ASMT TEST-99', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', 1, -5000, -20);

INSERT INTO warehouse_test.item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc) VALUES
  (-9,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-8,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-7,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0),
  (-6,   -99, -98, '200-2010',  -11, -99, -0.23, 2, -99, 0);

-- preload -------------------------------------------------------------------------------------------------------

INSERT INTO warehouse_test.asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id) VALUES
  (-99, '(SBAC)SBAC-IAB-ASMT TEST', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'MTH IAB G4 OperationsAlgebraicThinking', '9835', 1, -5000, -20),
  (-98, 'SBAC)SBAC-ICA-ASMT TEST', -98, 1, 2, 2016, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 'Grade 5 ELA', '9831', 0, -20, -20);

INSERT INTO warehouse_test.asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701),
  (-98, 2442, 2502, 2582, 2201, 2701);

INSERT INTO warehouse_test.item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc) VALUES
  (-990, -99, -99, '200-2010',  -99, -99, -0.23, 2, -99, 0),
  (-991, -99, -99, '200-18943', -99, -99, -0.13, 2, -98, 0),
  (-992, -99, -99, '200-8906',  -99, -99, -0.03, 2, -99, 1),
  (-993, -99, -99, '200-2014',  -99, -98,  1.23, 2, -98, 1),

  (-980, -98, -98, '200-60347', -98, -98, -0.32, 1, null, null),
  (-981, -98, -98, '200-51719', -98, -98, -1.32, 1, null, null),
  (-982, -98, -98, '200-59217', -98, -98, -2.32, 1, null, null),
  (-983, -98, -98, '200-59208', -98, -98, -0.32, 1, null, null),
  (-984, -98, -98, '200-30901', -98, -98, -0.32, 1, null, null);

INSERT INTO warehouse_test.item_other_target(item_id, target_id) values
  (-990, -98),
  (-990, -99),
  (-980, -98);

INSERT INTO warehouse_test.item_common_core_standard(item_id, common_core_standard_id) values
  (-990, -98),
  (-990, -99),
  (-980, -98);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------

-- preload -------------------------------------------------------------------------------------------------------
INSERT INTO warehouse_test.student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                                    lep_exit_at, birthday, import_id, update_import_id, deleted) VALUES
  (-11, '11', 'LastName-preload', 'FirstName-preload', 'MiddleName-preload', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -5000, 0);
-- preload -------------------------------------------------------------------------------------------------------

INSERT INTO warehouse_test.student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                                          lep_exit_at, birthday, import_id, update_import_id, deleted) VALUES
  (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -89, 1),
  (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -88, -88, 0),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -87, -87, 0),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -86, -86, 0);

INSERT INTO warehouse_test.student_ethnicity(student_id, ethnicity_id) values
  (-89,  -99),
  (-88,  -98),
  (-87,  -98),
  (-86,  -98),
  (-86,  -99);

-- student_group added at import -5000 and deleted at import -79
INSERT INTO warehouse_test.student_group (id, creator, school_id, school_year, name, subject_id, import_id, update_import_id, active, deleted) VALUES
  (-91, 'dwtest@example.com', -99, 2017, 'Test Student Group 9 - updated school', null, -5000, -79, 1, 1),
  (-8, 'dwtest@example.com', -1, 2017, 'Test Student Group 8', null, -79, -79, 1, 0),
  (-7, 'dwtest@example.com', -1, 2017, 'Test Student Group 7', null, -79, -79, 1, 0);

INSERT INTO warehouse_test.student_group_membership (student_group_id, student_id) VALUES
  (-91, -89),
  (-91, -88),
  (-91, -87),
  (-91, -86),
  (-8, -87),
  (-7, -87),
  (-7, -86);

INSERT INTO warehouse_test.user_student_group (student_group_id, user_login) VALUES
  (-91, 'dwtest@example.com-91'),
  (-8, 'dwtest@example.com-8'),
  (-7, 'dwtest@example.com-7'),
  (-91, 'dwtest@example.com-91-2');

-- ------------------------------------------ IAB Exams ---------------------------------------------------------------------------------------------

INSERT INTO warehouse_test.iab_exam_student ( id, grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
                                                    migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) VALUES
  ( -18, -98, -89, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  ( -17, -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  ( -16, -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null);

INSERT INTO  warehouse_test.iab_exam ( id, iab_exam_student_id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
                                      administration_condition_id, session_id, category, scale_score, scale_score_std_err, completed_at, import_id, update_import_id, deleted) VALUES
  (-88, -18, 2016, -99,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -5000, -88, 1),
  (-87, -17, 2016, -11,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -88, -88, 0),
  (-86, -16, 2016, -11,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -88, -88, 0);

INSERT INTO warehouse_test.iab_exam_available_accommodation (iab_exam_id, accommodation_id) VALUES
  (-88, -98),
  (-87, -98);

INSERT INTO warehouse_test.iab_exam_item (id, iab_exam_id, item_id, score, score_status, response, position) VALUES
  (-1, -88,  -9, 1, 'SCORED', '<response><math xmlns="http://www.w3.org/1998/Math/MathML" title="10"><mstyle><mn>10</mn></mstyle></math></response>', 1),
  (-2, -88,  -8, 1, 'SCORED', 'D', 2),
  (-3, -88,  -7, 0, 'SCORED', 'C', 3),
  (-4, -88,  -6, -1, 'SCORED', null, 16),
  (-5, -87,  -6, -1, 'SCORED', null, 16);

-- ------------------------------------------  Exams ------------------------------------------------------------------------------------------------

INSERT INTO staging_test.staging_exam_student ( id, grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
                                                migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type, migrate_id) VALUES
  ( -18, -98, -89, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null, -99),
  ( -17, -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null, -99),
  ( -16, -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null, -99);

INSERT INTO  staging_test.staging_exam ( id, exam_student_id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
                                         administration_condition_id, session_id, achievement_level, scale_score, scale_score_std_err, completed_at, import_id, deleted, migrate_id) VALUES
  (-88, -18, 2016, -99,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88),
  (-87, -17, 2016, -11,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88),
  (-86, -16, 2016, -11,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -88, 0, -88);

INSERT INTO staging_test.staging_exam_available_accommodation (exam_id, accommodation_id) VALUES
  (-88, -98),
  (-87, -98);

INSERT INTO staging_test.staging_exam_item (id, exam_id, item_id, score, score_status, response, position, migrate_id) VALUES
  (-1, -88,  -9, 1, 'SCORED', '<response><math xmlns="http://www.w3.org/1998/Math/MathML" title="10"><mstyle><mn>10</mn></mstyle></math></response>', 1, -88),
  (-2, -88,  -8, 1, 'SCORED', 'D', 2, -88),
  (-3, -88,  -7, 0, 'SCORED', 'C', 3, -88),
  (-4, -88,  -6, -1, 'SCORED', null, 16, -88),
  (-5, -87,  -6, -1, 'SCORED', null, 16, -88);

INSERT INTO staging_test.staging_exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
  (-1, -88, 1, 2014, 0.19, 1);