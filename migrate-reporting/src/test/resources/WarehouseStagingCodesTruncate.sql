/*
 *  warehouse to staging step tests that copy codes need to truncate staging to clear out
 *  initial dml codes that get copied.
 */
TRUNCATE staging_test.staging_completeness;
TRUNCATE staging_test.staging_administration_condition;
TRUNCATE staging_test.staging_ethnicity;
TRUNCATE staging_test.staging_gender;
TRUNCATE staging_test.staging_translation;
TRUNCATE staging_test.staging_accommodation;
TRUNCATE staging_test.staging_depth_of_knowledge;
TRUNCATE staging_test.staging_math_practice;
TRUNCATE staging_test.staging_item_trait_score;
TRUNCATE staging_test.staging_target;
TRUNCATE staging_test.staging_common_core_standard;
TRUNCATE staging_test.staging_claim;
TRUNCATE staging_test.staging_grade;

