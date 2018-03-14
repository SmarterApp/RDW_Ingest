-- CLEAN UP staging
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM staging_exam_claim_score where exam_id < 0;
DELETE FROM staging_exam where id < 0;

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM staging_school where id < 0;
DELETE FROM staging_district where id < 0;
DELETE FROM staging_district_group where id < 0;
DELETE FROM staging_school_group where id < 0;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM staging_asmt where id < 0;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM staging_student_ethnicity where student_id < 0;
DELETE FROM staging_student where id < 0;

-- CLEAN UP reporting
DELETE FROM fact_student_exam where id < 0;
DELETE FROM fact_student_iab_exam where id < 0;

-- ------------------------------------------ Student   ------------------------------------------------------------------------------------------------
DELETE FROM student_ethnicity where student_id < 0;
DELETE FROM student where id < 0;

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM school where id < 0;
DELETE FROM district where id < 0;
DELETE FROM district_group where id < 0;
DELETE FROM school_group where id < 0;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM asmt where id < 0;
DELETE FROM asmt_active_year where asmt_id < 0;