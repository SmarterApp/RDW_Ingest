/*
 *  warehouse to staging step tests that copy entities need to truncate staging
 */
TRUNCATE TABLE staging_test.staging_school;
TRUNCATE TABLE staging_test.staging_district;
TRUNCATE TABLE staging_test.staging_student;
TRUNCATE TABLE staging_test.staging_student_ethnicity;
TRUNCATE TABLE staging_test.staging_student_group;
TRUNCATE TABLE staging_test.staging_student_group_membership;
TRUNCATE TABLE staging_test.staging_user_student_group;
TRUNCATE TABLE staging_test.staging_asmt;
TRUNCATE TABLE staging_test.staging_asmt_score;
TRUNCATE TABLE staging_test.staging_item;
TRUNCATE TABLE staging_test.staging_item_common_core_standard;
TRUNCATE TABLE staging_test.staging_item_other_target;
TRUNCATE TABLE staging_test.staging_exam_student;
TRUNCATE TABLE staging_test.staging_exam;
TRUNCATE TABLE staging_test.staging_exam_item;
TRUNCATE TABLE staging_test.staging_exam_available_accommodation;
TRUNCATE TABLE staging_test.staging_exam_claim_score;