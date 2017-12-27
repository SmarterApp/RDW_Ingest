-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO district_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98',  -1);

INSERT INTO district (id, name, natural_id, migrate_id) VALUES
  (-1, 'Before Test -1', 'natural_id-1',  -1),
  (-99, 'Before Test -99', 'natural_id-99',  -1);

INSERT INTO school_group (id, name, natural_id, migrate_id) VALUES
  (-98, 'Before Test -98', 'natural_id-98',  -1);

INSERT INTO school (id, district_id, district_group_id, school_group_id, name, natural_id, update_import_id, migrate_id) VALUES
  (-1, -1, NULL, NULL, 'Before Test -1', 'natural_id-1', -5000,  -1),
  (-99, -99, NULL, NULL, 'Before Test -99', 'natural_id-99', -1, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO asmt (id, grade_id,  type_id, subject_id, school_year, name, label, update_import_id, migrate_id) VALUES
   (-11, -98, 3, 1, 1999, 'test-summative-1999-98', 'summative-grade-98', -1, -1),
   (-99, -99, 1, 2, 1999, 'test', 'test', -1, -1);

INSERT INTO asmt_active_year(asmt_id, school_year) values
    (-11, 1995);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO student (id, gender_id, update_import_id, migrate_id) VALUES
   (-11, -99, -1, -1),
   (-89, -99, -1, -1),
   (-18, -99, -1, -1);

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99);

-- ------------------------------------------ Exams ---------------------------------------------------------------------------------------------
INSERT INTO  fact_student_exam (id, school_year, asmt_id, student_id, completed_at,
                                    asmt_grade_id, completeness_id, administration_condition_id, performance_level,
                                    scale_score, scale_score_std_err, grade_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    claim1_scale_score, claim1_scale_score_std_err,claim1_category,
                                    claim2_scale_score, claim2_scale_score_std_err,claim2_category,
                                    claim3_scale_score, claim3_scale_score_std_err,claim3_category,
                                    claim4_scale_score, claim4_scale_score_std_err,claim4_category,
                                    update_import_id, migrate_id) VALUES
  (-88,  1999, -99, -89, '2016-08-14 19:05:33.000000', -99, -99, -99, 1, 2145, 0.17, -98, -1, true, true, false, false, true,  -2000, 0.11, 1, -2100, 0.12, 2, -2500, 0.13, 3, -3000, .15, 4, -1, -1),
  (-100, 1998, -11, -18, '2016-05-14 19:05:33.000000', -99, -99, -99, 1, 2145, 0.17, -98, -1, true, true, false, false, true,  -2000, 0.11, 1, -2100, 0.12, 2, -2500, 0.13, 3, -3000, .15, 4, -1, -1),
  (-82 , 1998, -11, -89, '2016-09-14 19:05:33.000000', -99, -99, -99, 1, 2005, 0.17, -98, -1, true, true, false, false, true,  -2000, 0.11, 1, -2100, 0.12, 2, -2500, 0.13, 3, -3000, .15, 4, -1, -1);
