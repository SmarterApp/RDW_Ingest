-- CLEAN UP staging
-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DElETE FROM staging_test.staging_school where id in ( -99, -98, -1);
DElETE FROM staging_test.staging_district where id in ( -99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DElETE FROM staging_test.staging_item where id in ( -990, -991, -992, -993, -980, -981, -982, -983, -984);
DElETE FROM staging_test.staging_asmt_score where asmt_id in ( -99, -98);
DElETE FROM staging_test.staging_asmt where id in ( -99, -98);

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM staging_test.staging_student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM staging_test.staging_user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM staging_test.staging_student where id in ( -89, -88, -87, -86);
DELETE FROM staging_test.staging_student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM staging_test.staging_student_group where id in ( -91, -8, -7);


-- CLEAN UP reporting
-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM reporting_test.student_group_membership where student_group_id in ( -91, -8, -7);
DELETE FROM reporting_test.user_student_group where student_group_id in ( -91, -8, -7);
DELETE FROM reporting_test.student where id in ( -89, -88, -87, -86);
DELETE FROM reporting_test.student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM reporting_test.student_group where id in ( -91, -8, -7);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DElETE FROM reporting_test.school where id in ( -99, -98, -1);
DElETE FROM reporting_test.district where id in ( -99, -98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DElETE FROM reporting_test.item where id in ( -990, -991, -992, -993, -980, -981, -982, -983, -984, -9);
DElETE FROM reporting_test.asmt_score where asmt_id in ( -99, -98);
DElETE FROM reporting_test.asmt where id in ( -99, -98);








