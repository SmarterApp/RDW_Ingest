/*
 *  warehouse to staging step tests that copy codes need to truncate staging to clear out
 *  initial dml codes that get copied.
 */
TRUNCATE reporting_test.staging_completeness;
TRUNCATE reporting_test.staging_administration_condition;
TRUNCATE reporting_test.staging_ethnicity;
TRUNCATE reporting_test.staging_gender;
TRUNCATE reporting_test.staging_translation;
TRUNCATE reporting_test.staging_accommodation;
TRUNCATE reporting_test.staging_school_year;
TRUNCATE reporting_test.staging_depth_of_knowledge;
TRUNCATE reporting_test.staging_math_practice;
TRUNCATE reporting_test.staging_item_trait_score;
TRUNCATE reporting_test.staging_target;
TRUNCATE reporting_test.staging_common_core_standard;
TRUNCATE reporting_test.staging_claim;
TRUNCATE reporting_test.staging_grade;

