/*
 *  warehouse to staging step tests that copy entities need to truncate staging
 */
TRUNCATE TABLE reporting_test.staging_school;
TRUNCATE TABLE reporting_test.staging_district;
TRUNCATE TABLE reporting_test.staging_student;
TRUNCATE TABLE reporting_test.staging_student_ethnicity;
TRUNCATE TABLE reporting_test.staging_student_group;
TRUNCATE TABLE reporting_test.staging_student_group_membership;
TRUNCATE TABLE reporting_test.staging_user_student_group;
TRUNCATE TABLE reporting_test.staging_asmt;
TRUNCATE TABLE reporting_test.staging_asmt_score;
TRUNCATE TABLE reporting_test.staging_item;
TRUNCATE TABLE reporting_test.staging_item_common_core_standard;
TRUNCATE TABLE reporting_test.staging_item_other_target;
TRUNCATE TABLE reporting_test.staging_exam_student;
TRUNCATE TABLE reporting_test.staging_exam;
TRUNCATE TABLE reporting_test.staging_exam_item;
TRUNCATE TABLE reporting_test.staging_exam_available_accommodation;
TRUNCATE TABLE reporting_test.staging_exam_claim_score;