-- Leave original for staging to reporting step tests.
-- Move delete as migrate entities steps are completed
-- todo: remove this files when all entity steps complete
-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
-- UPDATE staging_test.staging_school SET deleted = 1 WHERE id = -99;
-- district in the staging should have only updated or inserted rows
-- DELETE FROM staging_test.staging_district WHERE id = -99;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
# UPDATE staging_test.staging_asmt SET deleted = 1 WHERE id = -99;
# DELETE FROM staging_test.staging_asmt_score WHERE asmt_id = -99;
# DELETE FROM staging_test.staging_item WHERE asmt_id = -99;
# DELETE FROM staging_test.staging_item_other_target WHERE item_id = -990;
# DELETE FROM staging_test.staging_item_common_core_standard WHERE item_id = -990;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
# UPDATE staging_test.staging_student SET deleted = 1 WHERE id = -89;
# UPDATE staging_test.staging_student_group SET deleted = 1 WHERE id = -91;
# DELETE from staging_test.staging_student_ethnicity where student_id = -91;
# DELETE from staging_test.staging_student_group_membership where student_group_id = -91;
# DELETE from staging_test.staging_user_student_group where student_group_id = -91;

-- ------------------------------------------ IAB Exams ---------------------------------------------------------------------------------------------
UPDATE staging_test.staging_iab_exam SET deleted = 1 WHERE id = -88;
DELETE from staging_test.staging_iab_exam_student WHERE id = -18;
DELETE from staging_test.staging_iab_exam_available_accommodation  WHERE iab_exam_id = -88;
DELETE from staging_test.staging_iab_exam_item  WHERE iab_exam_id = -88;

 ------------------------------------------  Exams ---------------------------------------------------------------------------------------------
UPDATE staging_test.staging_exam SET deleted = 1 WHERE id = -88;
DELETE from staging_test.staging_exam_student WHERE id = -18;
DELETE from staging_test.staging_exam_available_accommodation  WHERE exam_id = -88;
DELETE from staging_test.staging_exam_item  WHERE exam_id = -88;
