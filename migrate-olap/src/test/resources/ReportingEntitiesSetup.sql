-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO district (id, name) VALUES
  (-1, 'Before Test -1'),
  (-99, 'Before Test -99');

INSERT INTO school (id, district_id, name, migrate_id) VALUES
  (-1, -1, 'Before Test -1', -1),
  (-99, -99,'Before Test -99', -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO ica_asmt (id, grade_id, subject_id, school_year, name, migrate_id) VALUES
   (-11, -98, 1, 1999, 'SBAC-IAB-FIXED-G4M-OA-MATH-4',  -1),
   (-99, -99, 1, 1999, 'test', -1);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
INSERT INTO student (id, gender_id, migrate_id) VALUES
   (-11, '11', -1),
   (-89, '89', -1);

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
    (-89,  -99);

-- ------------------------------------------ Exams ---------------------------------------------------------------------------------------------
INSERT INTO  fact_student_ica_exam (id, school_year, asmt_id, asmt_grade_id, completeness_id,
                                    administration_condition_id, performance_level,
                                    scale_score, scale_score_std_err, grade_id, student_id, school_id,
                                    iep, lep, section504, economic_disadvantage, migrant_status,
                                    claim1_scale_score, claim1_scale_score_std_err,claim1_category,
                                    claim2_scale_score, claim2_scale_score_std_err,claim2_category,
                                    claim3_scale_score, claim3_scale_score_std_err,claim3_category,
                                    claim4_scale_score, claim4_scale_score_std_err,claim4_category,
                                    migrate_id) VALUES
  (-88, 1999, -99, -98, -99, -99, 1, 2145, 0.17, -98, -89, -1, 1, 1, 0, 0, 1,  2000, 0.11, 1, 2100, 0.12, 2, 2500, 0.13, 3, 3000, .15, 4,  -1);