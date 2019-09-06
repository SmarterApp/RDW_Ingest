-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
UPDATE staging_school SET deleted = 1 WHERE id = -99;
-- district in the staging should have only updated or inserted rows
DELETE FROM staging_district WHERE id = -99;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
UPDATE staging_asmt SET deleted = 1 WHERE id = -99;
DELETE from staging_asmt_target WHERE asmt_id = -99;
DELETE from staging_asmt_target WHERE asmt_id = -99;
DELETE from staging_asmt_target_exclusion WHERE asmt_id = -99;

-- ------------------------------------------ Student   ------------------------------------------------------------------------------------------------
UPDATE staging_student SET deleted = 1 WHERE id = -89;
DELETE from staging_student_ethnicity where student_id = -89;

-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
UPDATE staging_exam SET deleted = 1 WHERE id in (-88, -68, -268);
DELETE from staging_exam_score WHERE exam_id = -88;
DELETE from staging_exam_target_score WHERE exam_id = -88;
