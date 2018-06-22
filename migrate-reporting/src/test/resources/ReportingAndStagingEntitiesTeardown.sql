-- CLEAN UP staging
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM staging_exam_available_accommodation where exam_id < 0;
DELETE FROM staging_exam_item where exam_id < 0;
DELETE FROM staging_exam_claim_score where exam_id < 0;
DELETE FROM staging_exam_target_score where exam_id < 0;
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


-- CLEAN UP reporting
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM exam_available_accommodation where exam_id < 0;
DELETE FROM exam_item where exam_id < 0;
DELETE FROM exam_target_score where exam_id < 0;
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
DELETE FROM asmt_score where asmt_id < 0;
DELETE FROM asmt_target where asmt_id < 0;
DELETE FROM asmt where id < 0;

DELETE FROM migrate;