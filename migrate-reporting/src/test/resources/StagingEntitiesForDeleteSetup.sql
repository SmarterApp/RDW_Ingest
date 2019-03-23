-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
UPDATE staging_school SET deleted = 1 WHERE id = -99;
-- district in the staging should have only updated or inserted rows
DELETE FROM staging_district WHERE id = -99;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
UPDATE staging_asmt SET deleted = 1 WHERE id IN (-99, -59);
DELETE FROM staging_asmt_score WHERE asmt_id IN (-99, -59);
DELETE FROM staging_asmt_target WHERE asmt_id IN (-99, -59);
DELETE FROM staging_asmt_target_exclusion WHERE asmt_id IN (-99, -59);
DELETE FROM staging_item WHERE asmt_id IN (-99, -59);
DELETE FROM staging_item_other_target WHERE item_id = -990;
DELETE FROM staging_item_common_core_standard WHERE item_id = -990;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
UPDATE staging_percentile SET deleted = 1 WHERE id = -89;
DELETE FROM staging_percentile_score WHERE percentile_id = -89;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
UPDATE staging_student SET deleted = 1 WHERE id = -89;
UPDATE staging_student_group SET deleted = 1 WHERE id = -91;
DELETE from staging_student_ethnicity where student_id = -89;
DELETE from staging_student_group_membership where student_group_id = -91;
DELETE from staging_user_student_group where student_group_id = -91;

-- ------------------------------------------ IAB Exams ---------------------------------------------------------------------------------------------
UPDATE staging_exam SET deleted = 1 WHERE id IN (-88, -59);
DELETE from staging_exam_available_accommodation  WHERE exam_id  IN (-88, -59);
DELETE from staging_exam_item  WHERE exam_id IN (-88, -59);
DELETE from staging_exam_score  WHERE exam_id IN (-88, -59);
DELETE from staging_exam_target_score  WHERE exam_id IN (-88, -59);
