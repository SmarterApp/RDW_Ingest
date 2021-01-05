-- ----------------------------------------------------------------------------------------------------------------
-- CLEAN UP staging
-- ------------------------------------------  Exams --------------------------------------------------------------
DELETE FROM staging_exam_score where exam_id < 0;
DELETE FROM staging_exam_target_score where exam_id < 0;
DELETE FROM staging_exam where id < 0;

-- ------------------------------------------ School/Districts ----------------------------------------------------
DELETE FROM staging_school where id < 0;
DELETE FROM staging_district where id < 0;
DELETE FROM staging_district_group where id < 0;
DELETE FROM staging_school_group where id < 0;

-- ------------------------------------------ Asmt ----------------------------------------------------------------
DELETE FROM staging_asmt where id < 0;
DELETE FROM staging_asmt_target where asmt_id < 0;
DELETE FROM staging_asmt_target_exclusion where asmt_id < 0;

-- ------------------------------------------ Student and Groups  -------------------------------------------------
DELETE FROM staging_student_ethnicity where student_id < 0;
DELETE FROM staging_student where id < 0;

-- ------------------------------------------ Subject -------------------------------------------------------------
DELETE FROM staging_target;
DELETE FROM staging_subject_score;
DELETE FROM staging_subject_asmt_type;
DELETE FROM staging_subject_asmt_scoring;
DELETE FROM staging_subject;

-- ----------------------------------------------------------------------------------------------------------------
-- CLEAN UP reporting
-- ----------------------------------------------------------------------------------------------------------------
DELETE FROM exam where id < 0;
DELETE FROM iab_exam where id < 0;
DELETE FROM exam_longitudinal where id < 0;
DELETE FROM exam_alt_score where id < 0;
DELETE FROM exam_claim_score where id < 0;
DELETE FROM exam_target_score where id < 0;

-- ------------------------------------------ Student   -----------------------------------------------------------
DELETE FROM student_ethnicity where student_id < 0;
DELETE FROM student where id < 0;

-- ------------------------------------------ School/Districts ----------------------------------------------------
DELETE FROM school where id < 0;
DELETE FROM district where id < 0;
DELETE FROM district_group where id < 0;
DELETE FROM school_group where id < 0;

-- ------------------------------------------ Asmt ----------------------------------------------------------------
DELETE FROM asmt where id < 0;
DELETE FROM asmt_target where asmt_id < 0;
DELETE FROM asmt_active_year where asmt_id < 0;

-- ------------------------------------------ Subject -------------------------------------------------------------
-- TODO: this is not ideal since we are deleting more data that created by the test
-- This is because we have some data pre-loaded in warehouse and when testing the batch they moved into reporting
-- Ideally, with the configurable subjects introduction, there should not be any data pre-loaded into warehouse
-- But this is not the case...
DELETE FROM subject_asmt_type WHERE subject_id < 0;
DELETE FROM subject_score WHERE subject_id < 0;
DELETE FROM target WHERE subject_id < 0;
DELETE FROM subject WHERE id < 0;
DELETE FROM school_year WHERE year in (1998, 1999);
