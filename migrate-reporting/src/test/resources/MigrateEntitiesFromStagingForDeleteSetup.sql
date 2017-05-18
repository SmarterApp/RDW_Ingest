-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
UPDATE staging_test.staging_school SET deleted = 1 WHERE id = -99;
-- district in the staging should have only updated or inserted rows
DELETE FROM staging_test.staging_district WHERE id = -99;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
UPDATE staging_test.staging_asmt SET deleted = 1 WHERE id = -99;
DELETE FROM staging_test.staging_asmt_score WHERE asmt_id = -99;
DELETE FROM staging_test.staging_item WHERE asmt_id = -99;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------

UPDATE staging_test.staging_student SET deleted = 1 WHERE id = -89;
UPDATE staging_test.staging_student_group SET deleted = 1 WHERE id = -91;
DELETE from staging_test.staging_student_ethnicity where student_id = -91;
DELETE from staging_test.staging_student_group_membership where student_group_id = -91;
DELETE from staging_test.staging_user_student_group where student_group_id = -91;

