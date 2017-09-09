-- CLEAN UP staging
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM staging_exam_available_accommodation where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM staging_exam_item where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM staging_exam_claim_score where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM staging_exam where id in (-88, -87, -86, -85, -84);
DELETE FROM staging_exam_student where id in (-18, -17, -16);
-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DElETE FROM staging_school where id < 0;
DElETE FROM staging_district where id in ( -99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DElETE FROM staging_item_other_target where item_id < 0;
DElETE FROM staging_item_common_core_standard where item_id < 0;
DElETE FROM staging_item where asmt_id in ( -11, -99, -98);
DElETE FROM staging_asmt_score where asmt_id in ( -99, -98);
DElETE FROM staging_asmt where id in (-11, -99, -98);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM staging_student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM staging_user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM staging_student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM staging_student where id in (-11,  -89, -88, -87, -86);
DELETE FROM staging_student_group where id in ( -91, -8, -7);


-- CLEAN UP reporting
-- ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
DELETE FROM exam_available_accommodation where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM exam_item where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM exam where id in (-88, -87, -86, -85, -84, -100);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM student where id in ( -11, -89, -88, -87, -86);
DELETE FROM student_group where id in ( -91, -8, -7);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DElETE FROM school where id in ( -99, -98, -1);
DElETE FROM district where id in ( -99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DElETE FROM item_other_target where item_id in (-991, -990, -980, -98, -99);
DElETE FROM item_common_core_standard where item_id in (-991, -990, -980, -98, -99);
DElETE FROM item where asmt_id in ( -11, -99, -98);
DElETE FROM asmt_score where asmt_id in ( -99, -98);
DElETE FROM asmt where id in ( -11, -99, -98);

DELETE FROM migrate;