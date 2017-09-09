-- ---------------------------------------------- Exams ---------------------------------------------------------------------------------------------
DELETE FROM exam_available_accommodation where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM exam_item where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM exam_claim_score where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM exam where id in (-88, -87, -86, -85, -84);
DELETE FROM exam_student where id in (-18, -17, -16, -15);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM student where id in (-11,  -89, -88, -87, -86, -33);
DELETE FROM student_group where id in ( -91, -8, -7);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM school where id in (-99, -98, -1);
DELETE FROM district where id in (-99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM item_other_target where item_id in (-991, -990, -980);
DELETE FROM item_common_core_standard where item_id in (-991, -990, -980, -9, -8);
DELETE FROM item where asmt_id in ( -11, -99, -98);
DELETE FROM asmt_score where asmt_id in ( -99, -98);
DELETE FROM asmt where id in (-11, -99, -98);


