-- CLEAN UP staging
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM staging_exam_available_accommodation where exam_id < 0;
DELETE FROM staging_exam_item where exam_id < 0;
DELETE FROM staging_exam_score where exam_id < 0;
DELETE FROM staging_exam_target_score where exam_id < 0;
DELETE FROM staging_exam_trait_score where exam_id < 0;
DELETE FROM staging_exam where id < 0;

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM staging_school where id < 0;
DELETE FROM staging_district where id in (-99, -98, -1);
DELETE FROM staging_district_group where id in (-98);
DELETE FROM staging_school_group where id in (-98, -1);

-- ------------------------------------------ Percentile ---------------------------------------------------------------------------------------------------------
DELETE FROM staging_percentile_score WHERE percentile_id IN (-89,-88);
DELETE FROM staging_percentile WHERE id IN (-89, -88);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM staging_item_other_target where item_id < 0;
DELETE FROM staging_item_common_core_standard where item_id < 0;
DELETE FROM staging_item where asmt_id < 0;
DELETE FROM staging_asmt_score where asmt_id < 0;
DELETE FROM staging_asmt_target where asmt_id < 0;
DELETE FROM staging_asmt_target_exclusion where asmt_id < 0;
DELETE FROM staging_asmt where id < 0;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM staging_student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM staging_user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM staging_student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM staging_student where id < 0;
DELETE FROM staging_student_group where id in ( -91, -8, -7);

-- ------------------------------------------ Subjects and related data ---------------------------------------------------------------------------------
TRUNCATE staging_depth_of_knowledge;
TRUNCATE staging_common_core_standard;
TRUNCATE staging_target;
TRUNCATE staging_claim;
TRUNCATE staging_subject;
TRUNCATE staging_subject_translation;
TRUNCATE staging_subject_asmt_type;
TRUNCATE staging_subject_asmt_scoring;
TRUNCATE staging_subject_score;
TRUNCATE staging_subject_trait;

-- CLEAN UP reporting
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM exam_available_accommodation where exam_id < 0;
DELETE FROM exam_item where exam_id < 0;
DELETE FROM exam_target_score where exam_id < 0;
DELETE FROM exam_trait_score where exam_id < 0;
DELETE FROM exam where id < 0;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM student where id in ( -11, -89, -88, -87, -86, -33);
DELETE FROM student_group where id in ( -91, -8, -7);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM school where id in (-99, -98, -1);
DELETE FROM district where id in (-99, -98, -1);
DELETE FROM district_group where id in (-98);
DELETE FROM school_group where id in (-98, -1);

-- ------------------------------------------ Percentile ---------------------------------------------------------------------------------------------------------
DELETE FROM percentile_score WHERE percentile_id IN (-89,-88);
DELETE FROM percentile WHERE id IN (-89, -88);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM item_other_target where item_id < 0;
DELETE FROM item_common_core_standard where item_id < 0;
DELETE FROM item where asmt_id < 0;
DELETE FROM asmt_target where asmt_id < 0;
DELETE FROM asmt where id < 0;

-- ------------------------------------------ Subjects and related data ---------------------------------------------------------------------------------
DELETE FROM depth_of_knowledge WHERE subject_id < 0 or id < 0;
DELETE FROM common_core_standard  WHERE subject_id < 0 or id < 0;
DELETE FROM subject_translation WHERE subject_id < 0 or label_code like '%integration test%';
DELETE FROM subject_asmt_type WHERE subject_id < 0;
DELETE FROM subject_score WHERE subject_id < 0;
DELETE FROM subject_trait WHERE subject_id < 0;
-- TODO: this is not ideal since we are deleting more data that created by the test
-- This is because we have some data pre-loaded in warehouse and when testing the batch they moved into reporting
-- Ideally, with the configurable subjects introduction, there should not be any data pre-loaded into warehouse
-- But this is not the case...
DELETE FROM target;
DELETE FROM claim;
DELETE FROM subject WHERE id < 0;

DELETE FROM migrate;
