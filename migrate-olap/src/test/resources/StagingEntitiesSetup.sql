-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_district_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample District Group -98', 'natural_id-98', -99);

INSERT INTO staging_school_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample School Group -98', 'natural_id-98', -99);

INSERT INTO staging_district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -99),
  (-98, 'Sample District -98', 'natural_id-98', -99);

INSERT INTO staging_school (id, district_id, district_group_id, school_group_id, name, natural_id, deleted, migrate_id, updated, update_import_id) VALUES
  (-99, -99, NULL, NULL, 'Sample School -99', 'natural_id-99', 0, -99,'2017-07-18 20:14:34.000000', -1),
  (-98, -98, -98, -98, 'Sample School -98', 'natural_id-98', 0, -99, '2017-07-18 20:14:34.000000', -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO staging_asmt (id,  grade_id, type_id, subject_id, school_year, name, label, cut_point_1, cut_point_2, cut_point_3, deleted, updated, update_import_id, migrate_id) VALUES
   (-66, 109, 2, 2, 1999, 'test-iab', 'test-iab', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-99, 109, 1, 2, 1999, 'test-ica-1999-99', 'ica-1999-99', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-98, 109, 3, 1, 2000, 'test-summative-2000-grade-9', 'summative', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-308, 108, 3, 1, 2000, 'test-summative-2000-grade-8',  'summative-grade-8', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-107, 107, 3, 1, 2001, 'test-summative-2001-grade-7',  'summative-grade-8', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-108 ,108, 3, 1, 2001, 'test-summative-2001-grade-8',  'summative-grade-8', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-109, 111, 3, 1, 2001, 'test-summative-2001-grade-9',  'summative-grade-9', 2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-111, 111, 3, 1, 2001, 'test-summative-2001-grade-11', 'summative-grade-11',2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-112, 111, 3, 1, 2001, 'test-summative-2001-grade-12', 'summative-grade-12',2442, 2502, 2582, 0, '2017-07-18 20:14:34.000000', -1, -99);

-- ------------------------------------------ Student  ------------------------------------------------------------------------------------------------
INSERT INTO staging_student (id, gender_id, updated, update_import_id, migrate_id, deleted) VALUES
  (-89, -98, '2017-07-18 20:14:34.000000', -1, -99, 0),
  (-88, -98, '2017-07-18 20:14:34.000000', -1, -99, 0),
  (-87, -98, '2017-07-18 20:14:34.000000', -1, -99, 0),
  (-86, null, '2017-07-18 20:14:34.000000', -1, -99, 0);

INSERT INTO staging_student_ethnicity(student_id, ethnicity_id, migrate_id) values
    (-89,  -99, -99),
    (-88,  -98, -99),
    (-87,  -98, -99),
    (-86,  -98, -99),
    (-86,  -99, -99);

-- ------------------------------------------  Exams ------------------------------------------------------------------------------------------------
INSERT INTO  staging_exam ( id, type_id, school_year, asmt_id, asmt_grade_id, subject_id, student_id, completed_at,
                            elas_id, completeness_id, administration_condition_id, performance_level, scale_score,
                            deleted, migrate_id, grade_id, school_id, iep, lep, section504, economic_disadvantage, migrant_status, updated, update_import_id) VALUES
 -- fact_student_exam ------------------------------------------------------------------------------------------------------------------------------
   -- same exams as in olap but with updated (older) completed_at, scale_score and claim score
  (-88, 1, 1999, -99, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  -- exams with the same completed at, should not happen in real life but happens with the `data generator`
  (-87, 1, 1998, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-17, 1, 1998, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  exams for the same school_year, asmt_id and student_id with diff completed_at, no matching entry in the olap
  (-86, 1, 1999, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-85, 1, 1999, -11, null, null, -11, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  newer exams than in olap for the same student, asmt and school year
  (-84, 1, 1998, -11, null, null, -18, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-14, 1, 1998, -11, null, null, -18, '2016-07-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  older exams than in olap for the same student, asmt and school year
  (-83, 1, 1998, -11, null, null, -89, '2016-05-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-13, 1, 1998, -11, null, null, -89, '2016-04-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

 -- fact_student_iab_exam -------------------------------------------------------------------------------------------------------------------------
   -- same exams as in olap but with updated (older) completed_at, scale_score and claim score
  (-68, 2, 1999, -66, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  -- exams with the same completed at, should not happen in real life but happens with the `data generator`
  (-67, 2, 1998, -55, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-27, 2, 1998, -55, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  exams for the same school_year, asmt_id and student_id with diff completed_at, no matching entry in the olap
  (-66, 2, 1999, -55, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-65, 2, 1999, -55, null, null, -11, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  newer exams than in olap for the same student, asmt and school year
  (-64, 2, 1998, -55, null, null, -18, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-24, 2, 1998, -55, null, null, -18, '2016-07-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  older exams than in olap for the same student, asmt and school year
  (-63, 2, 1998, -55, null, null, -89, '2016-05-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-23, 2, 1998, -55, null, null, -89, '2016-04-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    -- same exams as in olap but with updated (older) completed_at, scale_score and claim score
  (-88, 1, 1999, -99, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  -- exams with the same completed at, should not happen in real life but happens with the `data generator`
  (-87, 1, 1998, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-17, 1, 1998, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

-- fact_student_exam_longitudinal -------------------------------------------------------------------------------------------------------------------------
   -- update exam test:  in olap but with older completed_at, scale_score and claim score
  (-268, 3, 1998, -107, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, 1, 2135, 0, -88, 107, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  exams for different school years, same asmt grade id and student_id with diff completed_at, student grade = asmt grade, no matching entry in the olap
  (-201, 3, 1998, -308, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-202, 3, 1999, -108, null, null, -11, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  --  student grade id is not equal to asmt grade id, not high school asmt, no matching entry in the olap
  (-203, 3, 1999, -108, null, null, -87, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 107, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  --  student grade id is equal accountability grade, high school asmts, no matching entry in the olap
  (-204, 3, 1998, -109, null, null, -87, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-205, 3, 1999, -112, null, null, -86, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  student grade id is not equal accountability grade, high school asmts, no matching entry in the olap
  (-206, 3, 1998, -109, null, null, -88, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 109, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-207, 3, 1999, -112, null, null, -88, '2016-08-14 19:05:07.966000', -99, -99, -99, 1, 2145, 0, -88, 112, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  newer exams than in olap for the same student
  (-209, 3, 1999, -111, null, null, -18, '2016-08-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-210, 3, 1999, -111, null, null, -18, '2016-07-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  older exams than in olap for the same student and school year
  (-211, 3, 1999, -111, null, null, -89, '2016-05-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-212, 3, 1999, -111, null, null, -89, '2016-04-14 19:06:07.966000', -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1);


INSERT INTO staging_exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category, migrate_id) VALUES
   (-1,  -88, 1, 2000, 0.19, 1, -99),
   (-10, -88, 2, 3000, 0.19, 1, -99),
   (-11, -88, 3, 4000, 0.19, 1, -99),
   (-2,  -87, 1, 2014, 0.19, 1, -99),
   (-3,  -86, 1, 2014, 0.19, 1, -99);