-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO district_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98',  -1);

INSERT INTO district (id, name, natural_id, migrate_id) VALUES
  (-1, 'Before Test -1', 'natural_id-1',  -1),
  (-99, 'Before Test -99', 'natural_id-99',  -1);

INSERT INTO school_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98',  -1);

INSERT INTO school (id, district_id, district_group_id, school_group_id, name, natural_id, embargo_enabled, updated, update_import_id, migrate_id) VALUES
  (-1, -1, NULL, NULL, 'Before Test -1', 'natural_id-1', false, '2017-07-18 20:14:34.000000', -5000,  -1),
  (-99, -99, NULL, NULL, 'Before Test -99', 'natural_id-99', false, '2017-07-18 20:14:34.000000', -1, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO asmt (id, grade_id,  type_id, subject_id, school_year, name, label, updated, update_import_id, migrate_id) VALUES
   (-11, -98, 3, 1, 1999, 'test-summative-1999-98', 'summative-grade-98', '2017-07-18 20:14:34.000000', -1, -1),
   (-99, -99, 1, 2, 1999, 'test', 'test', '2017-07-18 20:14:34.000000', -1, -1),
   (-55, -98, 2, 1, 1998, 'test-iab-1999-98', 'iab-grade-98', '2017-07-18 20:14:34.000000', -1, -1),
   (-66, -99, 2, 2, 1998, 'test-iab', 'test-iab', '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO asmt_active_year(asmt_id, school_year) values
    (-11, 1995);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO student (id, gender_id, updated, update_import_id, migrate_id) VALUES
   (-11, -99, '2017-07-18 20:14:34.000000', -1, -1),
   (-89, -99, '2017-07-18 20:14:34.000000', -1, -1),
   (-18, -99, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99);

-- ------------------------------------------ Facts ---------------------------------------------------------------------------------------------
INSERT INTO  fact_student_exam (id, school_year, asmt_id, student_id, completed_at,
                                    completeness_id, administration_condition_id, performance_level,
                                    scale_score, grade_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    updated, update_import_id, migrate_id) VALUES
  (-88,  1999, -99, -89, '2016-08-14 19:05:33.000000', -99, -99, 1, 2145, -98, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-100, 1998, -11, -18, '2016-05-14 19:05:33.000000', -99, -99, 1, 2145, -98, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-82 , 1998, -11, -89, '2016-09-14 19:05:33.000000', -99, -99, 1, 2005, -98, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1);

INSERT INTO  fact_student_iab_exam (id, school_year, asmt_id, student_id, completed_at,
                                    completeness_id, administration_condition_id, performance_level,
                                    scale_score, grade_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    updated, update_import_id, migrate_id) VALUES
  (-68,  1999, -66, -89, '2016-08-14 19:05:33.000000', -99, -99, 1, 2145, -98, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-10,  1998, -55, -18, '2016-05-14 19:05:33.000000', -99, -99, 1, 2145, -98, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1),
  (-62 , 1998, -55, -89, '2016-09-14 19:05:33.000000', -99, -99, 1, 2005, -98, -1, 1, 1, 0, 0, 1, '2017-07-18 20:14:34.000000', -1, -1);