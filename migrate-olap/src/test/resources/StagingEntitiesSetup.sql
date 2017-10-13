-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_district (id, name, migrate_id) VALUES
  (-99, 'Sample District -99', -99),
  (-98, 'Sample District -98', -99);

INSERT INTO staging_school (id, district_id, name, deleted, migrate_id) VALUES
  (-99, -99, 'Sample School -99', 0, -99),
  (-98, -98, 'Sample School -98', 0, -99);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------

INSERT INTO staging_asmt (id,  grade_id, type_id, subject_id, school_year, name, deleted, migrate_id) VALUES
   (-99, -99, 1, 1, 1999, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 0, -99),
   (-98, -98, 1, 2, 1999, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 0, -99);

---- ------------------------------------------ Student  ------------------------------------------------------------------------------------------------

INSERT INTO staging_student (id, ssid, last_or_surname, first_name, middle_name, gender_id, migrate_id, deleted) VALUES
  (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, -99, 0),
  (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, -99, 0),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, -99, 0),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', null, -99, 0);

INSERT INTO staging_student_ethnicity(student_id, ethnicity_id, migrate_id) values
    (-89,  -99, -99),
    (-88,  -98, -99),
    (-87,  -98, -99),
    (-86,  -98, -99),
    (-86,  -99, -99);

-- ------------------------------------------  Exams ------------------------------------------------------------------------------------------------
INSERT INTO  staging_exam ( id, type_id, school_year, asmt_id,  completeness_id,
                            administration_condition_id, performance_level, scale_score, scale_score_std_err, deleted, migrate_id,
                            grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
                            migrant_status) VALUES
  (-88, 1, 1999, -99, -99, -99, 1, 2145, 0.17,  0, -88, -98, -89, -1, 1, 1, 0, 0, 1),
  (-87, 1, 1999, -11, -99, -99, 1, 2145, 0.17,  0, -88, -98, -11, -1, 1, 1, 0, 0, 1),
  (-86, 1, 1999, -11, -99, -99, 1, 2145, 0.17,  0, -88, -98, -11, -1, 1, 1, 0, 0, 1);

INSERT INTO staging_exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category, migrate_id) VALUES
   (-1, -88, 1, 2000, 0.19, 1, -99),
   (-10, -88, 2, 3000, 0.19, 1, -99),
   (-11, -88, 3, 4000, 0.19, 1, -99),
   (-2, -87, 1, 2014, 0.19, 1, -99),
   (-3, -86, 1, 2014, 0.19, 1, -99);