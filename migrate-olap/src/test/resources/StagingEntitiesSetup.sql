-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_district_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample District Group -98', 'natural_id-98', -99);

INSERT INTO staging_school_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample School Group -98', 'natural_id-98', -99);

INSERT INTO staging_district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -99),
  (-98, 'Sample District -98', 'natural_id-98', -99);

INSERT INTO staging_school (id, district_id, district_group_id, school_group_id, name, natural_id, deleted, migrate_id, update_import_id) VALUES
  (-99, -99, NULL, NULL, 'Sample School -99', 'natural_id-99', 0, -99, -1),
  (-98, -98, -98, -98, 'Sample School -98', 'natural_id-98', 0, -99, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO staging_asmt (id,  grade_id, type_id, subject_id, school_year, name, label, deleted, update_import_id, migrate_id) VALUES
   (-99, -99, 1, 2, 1999, 'test-ica-1999-99', 'ica-1999-99', 0, -1, -99),
   (-98, -98, 3, 1, 2000, 'test-summative-2000-98', 'summative-2000-98',  0, -1, -99);

-- ------------------------------------------ Student  ------------------------------------------------------------------------------------------------
INSERT INTO staging_student (id, ssid, last_or_surname, first_name, middle_name, gender_id, update_import_id, migrate_id, deleted) VALUES
  (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, -1, -99, 0),
  (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, -1, -99, 0),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, -1, -99, 0),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', null, -1, -99, 0);

INSERT INTO staging_student_ethnicity(student_id, ethnicity_id, migrate_id) values
    (-89,  -99, -99),
    (-88,  -98, -99),
    (-87,  -98, -99),
    (-86,  -98, -99),
    (-86,  -99, -99);

-- ------------------------------------------  Exams ------------------------------------------------------------------------------------------------
INSERT INTO  staging_exam ( id, type_id, school_year, asmt_id, student_id, completed_at,
                            completeness_id, administration_condition_id, performance_level, scale_score, scale_score_std_err,
                            deleted, migrate_id, grade_id, school_id, iep, lep, section504, economic_disadvantage, migrant_status, update_import_id) VALUES
   -- same exams as in olap but with updated (older) completed_at, scale_score and claim score
  (-88, 1, 1999, -99, -89, '2016-08-12 19:05:00.000000', -99, -99, 1, 2135, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),

  -- exams with the same completed at, should not happen in real life but happens with the `data generator`
  (-87, 1, 1998, -11, -11, '2016-08-14 19:06:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),
  (-17, 1, 1998, -11, -11, '2016-08-14 19:06:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),

   --  exams for the same school_year, asmt_id and student_id with diff completed_at, no matching entry in the olap
  (-86, 1, 1999, -11, -11, '2016-08-14 19:06:07.966000', -99, -99, 1, 2135, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),
  (-85, 1, 1999, -11, -11, '2016-08-14 19:05:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),

    --  newer exams than in olap for the same student, asmt and school year
  (-84, 1, 1998, -11, -18, '2016-08-14 19:06:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),
  (-14, 1, 1998, -11, -18, '2016-07-14 19:06:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),

    --  older exams than in olap for the same student, asmt and school year
  (-83, 1, 1998, -11, -89, '2016-05-14 19:06:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1),
  (-13, 1, 1998, -11, -89, '2016-04-14 19:06:07.966000', -99, -99, 1, 2145, 0.17,  0, -88, -98, -1, 1, 1, 0, 0,  1, -1);

INSERT INTO staging_exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category, migrate_id) VALUES
   (-1,  -88, 1, 2000, 0.19, 1, -99),
   (-10, -88, 2, 3000, 0.19, 1, -99),
   (-11, -88, 3, 4000, 0.19, 1, -99),
   (-2,  -87, 1, 2014, 0.19, 1, -99),
   (-3,  -86, 1, 2014, 0.19, 1, -99);