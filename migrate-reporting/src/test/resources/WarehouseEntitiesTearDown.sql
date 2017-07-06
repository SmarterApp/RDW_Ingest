--
-- Can be used if test does not add all records.
--
-- Clean up warehouse
-- ---------------------------------------------- Exams ---------------------------------------------------------------------------------------------
DELETE FROM warehouse_test.exam_available_accommodation where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM warehouse_test.exam_item where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM warehouse_test.exam_claim_score where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM warehouse_test.exam where id in (-88, -87, -86, -85, -84);
DELETE FROM warehouse_test.exam_student where id in (-18, -17, -16, -15);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM warehouse_test.student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM warehouse_test.user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM warehouse_test.student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM warehouse_test.student where id in (-11,  -89, -88, -87, -86, -33);
DELETE FROM warehouse_test.student_group where id in ( -91, -8, -7);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM warehouse_test.school where id in (-99, -98, -1);
DELETE FROM warehouse_test.district where id in (-99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM warehouse_test.item_other_target where item_id in (-991, -990, -980);
DELETE FROM warehouse_test.item_common_core_standard where item_id in (-991, -990, -980, -9, -8);
DELETE FROM warehouse_test.item where asmt_id in ( -11, -99, -98);
DELETE FROM warehouse_test.asmt_score where asmt_id in ( -99, -98);
DELETE FROM warehouse_test.asmt where id in (-11, -99, -98);


-- CLEAN UP reporting
-- ------------------------------------------ Exams ---------------------------------------------------------------------------------------------
DELETE FROM reporting_test.exam_available_accommodation where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM reporting_test.exam_item where exam_id in (-88, -87, -86, -85, -84);
DELETE FROM reporting_test.exam where id in (-88, -87, -86, -85, -84);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM reporting_test.student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM reporting_test.user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM reporting_test.student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM reporting_test.student where id in ( -11, -89, -88, -87, -86, -33);
DELETE FROM reporting_test.student_group where id in ( -91, -8, -7);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DElETE FROM reporting_test.school where id in ( -99, -98, -1);
DElETE FROM reporting_test.district where id in ( -99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DElETE FROM reporting_test.item_other_target where item_id in (-991, -990, -980);
DElETE FROM reporting_test.item_common_core_standard where item_id in (-991, -990, -980, -9, -8);
DElETE FROM reporting_test.item where asmt_id in ( -11, -99, -98);
DElETE FROM reporting_test.asmt_score where asmt_id in ( -99, -98);
DElETE FROM reporting_test.asmt where id in ( -11, -99, -98);

DELETE FROM reporting_test.migrate;







