-- ------------------------------------------ Subject  --------------------------------------------------------------------------------------------------
INSERT INTO staging_subject (id, code, update_import_id, migrate_id, updated) VALUES
  (-1, 'New',    -99, -99, now()),
  (-3, 'Update', -99, -99, now());

-- add subjects' related data for the new subjects
INSERT INTO staging_subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count, target_report, migrate_id) VALUES
  (1, -1, 10, 3, 6, false, -99),
   -- new entry
  (1, -3, 8, 2, 7, false, -99),
   -- updated entry
  (2, -3, 8, 2, 7, false, -99);

INSERT INTO staging_subject_claim_score (id, subject_id, asmt_type_id, code, migrate_id) VALUES
  (-1,  -1, 1, 'Score1', -99),
  (-2,  -1, 1, 'Score2', -99),
  (-3,  -1, 1, 'Score3', -99),
  (-14, -3, 3, 'Score7', -99),
  (-15, -3, 3, 'Update', -99),
  (-16, -3, 3, 'New',    -99);

INSERT INTO staging_target(id, subject_id, natural_id, claim_code, migrate_id) VALUES
  (-1, -1, 'F',  't1',   -99),
  (-2, -1, 'X',  't1',   -99),
  (-3, -1, 'XX', 't1',   -99),
  (-4, -1, 'XXX', 't1',   -99),

  (-67, -3, 'I',  'New',   -99),
  (-68, -3, 'J',  'Old68', -99),
  (-69, -3, 'X',  'Old69', -99),

  (-98, 2, 'NBT|98',  '1', -99),
  (-99, 2, 'NBT|99',  '1', -99),

  -- we need to test a use case with 'Math' subject and claim '1' since it has special migrate rules
  -- since it is being pre-loaded we need to get the db id
  (-71, 1, 'E-3', 'tNBT|E-3', -99),
  (-72, 1, 'J-3',  'MD|J-3',  -99),
  (-73, 1, 'D',    'OA|D',    -99),

  (-11, 2, 'NBT|E-3', '1',   -99),
  (-12, 2, 'MD|J-3',  '1',   -99),
  (-21, 2, 'OA|D',    '2',   -99),
  (-22, 2, 'OA|A',    '2',   -99),
  (-31, 2, 'NF|C',    '3',   -99),
  (-32, 2, 'MD|D',    '3',   -99),
  (-33, 2, 'MD|E',    '3',   -99),
  (-34, 2, 'OA|E',    '3',   -99),
  (-41, 2, 'OA|E',    '4',   -99),
  (-42, 2, 'MD|D',    '4',   -99),
  (-43, 2, 'OA|A',    '4',   -99);

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
INSERT INTO staging_asmt (id,  grade_id, type_id, subject_id, school_year, name, label, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, deleted, updated, update_import_id, migrate_id) VALUES
   (-66,  109, 2, 2, 1999, 'test-iab',                     'test-iab',          2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-99,  109, 3, 2, 1999, 'test-ica-1999-99',             'ica-1999-99',       2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-98,  109, 3, 1, 2000, 'test-summative-2000-grade-9',  'summative',         2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-308, 108, 3, 1, 2000, 'test-summative-2000-grade-8',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-107, 107, 3, 1, 2001, 'test-summative-2001-grade-7',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-108, 108, 3, 1, 2001, 'test-summative-2001-grade-8',  'summative-grade-8', 2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-109, 111, 3, 1, 2001, 'test-summative-2001-grade-9',  'summative-grade-9', 2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-111, 111, 3, 1, 2001, 'test-summative-2001-grade-11', 'summative-grade-11',2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99),
   (-112, 111, 3, 1, 2001, 'test-summative-2001-grade-12', 'summative-grade-12',2442, 2502, 2582, 2000, 2700, 0, '2017-07-18 20:14:34.000000', -1, -99);

INSERT INTO staging_asmt_target(asmt_id, target_id, migrate_id) VALUES
   (-112, -71, -99),
   (-112, -72, -99),
   (-111, -71, -99),
   (-99,  -11, -99),
   (-99,  -12, -99),
   (-99,  -13, -99),
   (-98,  -71, -99),
   (-98,  -72, -99);

INSERT INTO staging_asmt_target_exclusion(asmt_id, target_id, migrate_id) VALUES
   (-112, -72, -99),
   (-99,  -12, -99),
   (-98,  -71, -99);

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
                            elas_id, language_id, completeness_id, administration_condition_id, performance_level, scale_score,
                            deleted, migrate_id, grade_id, school_id, iep, lep, section504, economic_disadvantage, migrant_status, updated, update_import_id) VALUES
 -- exam ------------------------------------------------------------------------------------------------------------------------------
   -- same exams as in olap but with updated (older) completed_at, scale_score and claim score
  (-88, 3, 1999, -99, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  -- exams with the same completed at, should not happen in real life but happens with the `data generator`
  (-87, 3, 1998, -11, null, null, -11, '2016-08-14 19:06:07.966000', null, null, null, null, 1, 2145, 0, -88, 108, -1, null, null, null, null,  null, '2017-07-18 20:14:34.000000', -1),
  (-17, 3, 1998, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  exams for the same school_year, asmt_id and student_id with diff completed_at, no matching entry in the olap
  (-86, 3, 1999, -11, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-85, 3, 1999, -11, null, null, -11, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  newer exams than in olap for the same student, asmt and school year
  (-84, 3, 1998, -11, null, null, -18, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-14, 3, 1998, -11, null, null, -18, '2016-07-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  older exams than in olap for the same student, asmt and school year
  (-83, 3, 1998, -11, null, null, -89, '2016-05-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-13, 3, 1998, -11, null, null, -89, '2016-04-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

 -- iab_exam -------------------------------------------------------------------------------------------------------------------------
   -- same exams as in olap but with updated (older) completed_at, scale_score and claim score
  (-68, 2, 1999, -66, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  -- exams with the same completed at, should not happen in real life but happens with the `data generator`
  (-67, 2, 1998, -55, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-27, 2, 1998, -55, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  exams for the same school_year, asmt_id and student_id with diff completed_at, no matching entry in the olap
  (-66, 2, 1999, -55, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-65, 2, 1999, -55, null, null, -11, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  newer exams than in olap for the same student, asmt and school year
  (-64, 2, 1998, -55, null, null, -18, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-24, 2, 1998, -55, null, null, -18, '2016-07-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  older exams than in olap for the same student, asmt and school year
  (-63, 2, 1998, -55, null, null, -89, '2016-05-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-23, 2, 1998, -55, null, null, -89, '2016-04-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

-- exam_longitudinal -------------------------------------------------------------------------------------------------------------------------
   -- update exam test:  in olap but with older completed_at, scale_score and claim score
  (-268, 3, 1998, -107, null, null, -89, '2016-08-12 19:05:00.000000', -99, -99, -99, -99, 1, 2135, 0, -88, 107, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  exams for different school years, same asmt grade id and student_id with diff completed_at, student grade = asmt grade, no matching entry in the olap
  (-201, 3, 1998, -308, null, null, -11, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2135, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-202, 3, 1999, -108, null, null, -11, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 108, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  --  student grade id is not equal to asmt grade id, not high school asmt, no matching entry in the olap
  (-203, 3, 1999, -108, null, null, -87, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 107, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

  --  student grade id is equal accountability grade, high school asmts, no matching entry in the olap
  (-204, 3, 1998, -109, null, null, -87, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-205, 3, 1999, -112, null, null, -86, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

   --  student grade id is not equal accountability grade, high school asmts, no matching entry in the olap
  (-206, 3, 1998, -109, null, null, -88, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 109, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-207, 3, 1999, -112, null, null, -88, '2016-08-14 19:05:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 112, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  newer exams than in olap for the same student
  (-209, 3, 1999, -111, null, null, -18, '2016-08-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-210, 3, 1999, -111, null, null, -18, '2016-07-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),

    --  older exams than in olap for the same student and school year
  (-211, 3, 1999, -111, null, null, -89, '2016-05-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1),
  (-212, 3, 1999, -111, null, null, -89, '2016-04-14 19:06:07.966000', -99, -99, -99, -99, 1, 2145, 0, -88, 111, -1, 1, 1, 0, 0,  1, '2017-07-18 20:14:34.000000', -1);

-- Note: ids are irrelevant to the migrate, we are migrating based on the latest student's exam per school year/assessment.
-- To better understand the use cases, refer to the comments in staging_exam table.
INSERT INTO staging_exam_claim_score (id, exam_id, subject_claim_score_id, category, migrate_id) VALUES
  (-881, -88, 1, 4, -99),
  (-882, -88, 2, 1, -99),
  (-883, -88, 3, 2, -99),
  (-871, -87, 1, 1, -99),
  (-872, -87, 2, 1, -99),
  (-171, -17, 1, 1, -99),
  (-173, -17, 3, 1, -99),
  (-861, -86, 1, 1, -99),
  (-862, -86, 2, 1, -99),
  (-851, -85, 1, 1, -99),
  (-852, -85, 2, 1, -99),
  (-841, -84, 1, 1, -99),
  (-842, -84, 2, 1, -99),
  (-141, -14, 1, 1, -99),
  (-142, -14, 2, 1, -99),
  (-831, -83, 1, 1, -99),
  (-832, -83, 2, 1, -99),
  (-131, -13, 1, 1, -99),
  (-132, -13, 2, 1, -99);

-- Note: ids are irrelevant to the migrate, we are migrating based on the latest student's exam per school year/assessment.
-- To better understand the use cases, refer to the comments in staging_exam table.
INSERT INTO staging_exam_target_score (id, exam_id, target_id, student_relative_residual_score, standard_met_relative_residual_score, migrate_id) VALUES
   (-870, -88, -71, 0.20, 0.30, -99),
   (-871, -87, -71, 0.20, 0.30, -99),
   (-872, -87, -72, 0.21, 0.31, -99),
   (-171, -17, -71, 0.30, 0.40, -99),
   (-173, -17, -72, 0.31, 0.41, -99),
   (-861, -86, -71, 0.50, 0.60, -99),
   (-862, -86, -72, 0.51, 0.61, -99),
   (-851, -85, -71, 0.20, 0.30, -99),
   (-852, -85, -72, 0.21, 0.31, -99),
   (-841, -84, -71, 0.20, 0.30, -99),
   (-842, -84, -72, 0.21, 0.31, -99),
   (-141, -14, -71, 0.20, 0.30, -99),
   (-142, -14, -72, 0.21, 0.31, -99),
   (-831, -83, -71, 0.20, 0.30, -99),
   (-832, -83, -72, 0.21, 0.31, -99),
   (-131, -13, -71, 0.20, 0.30, -99),
   (-132, -13, -72, 0.21, 0.31, -99);
