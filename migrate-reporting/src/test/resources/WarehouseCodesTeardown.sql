/*
 *  Delete codes after spring batch commits.
 */
DELETE FROM warehouse_test.completeness WHERE id IN (-99,-98);
DELETE FROM warehouse_test.administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM warehouse_test.ethnicity WHERE id IN (-99,-98);
DELETE FROM warehouse_test.gender WHERE id IN (-99,-98);
DELETE FROM warehouse_test.accommodation_translation WHERE accommodation_id IN (-99, -98) AND language_id in (-99, -98);
DELETE FROM warehouse_test.accommodation WHERE id IN (-99,-98);
DELETE FROM warehouse_test.depth_of_knowledge  WHERE id IN (-99,-98);
DELETE FROM warehouse_test.math_practice  WHERE practice IN (-99,-98);
DELETE FROM warehouse_test.item_trait_score WHERE id IN (-99,-98);
DELETE FROM warehouse_test.target WHERE id IN (-99,-98);
DELETE FROM warehouse_test.common_core_standard WHERE id IN (-99,-98);
DELETE FROM warehouse_test.item_difficulty_cuts  WHERE id IN (-99,-98);
DELETE FROM warehouse_test.claim WHERE id IN (-99,-98);
DELETE FROM warehouse_test.grade WHERE id IN (-99,-98);
DELETE FROM warehouse_test.language WHERE id IN (-99, -98);

DELETE FROM staging_test.staging_completeness WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM staging_test.staging_ethnicity WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_gender WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_translation WHERE label_code IN ('code1-test', 'code2-test') AND language_code in ('lan', 'gua') AND namespace in ('backend');
DELETE FROM staging_test.staging_accommodation WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_depth_of_knowledge  WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_math_practice  WHERE practice IN (-99,-98);
DELETE FROM staging_test.staging_item_trait_score WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_target WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_common_core_standard WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_claim WHERE id IN (-99,-98);
DELETE FROM staging_test.staging_grade WHERE id IN (-99,-98);

DELETE FROM reporting_test.completeness WHERE id IN (-99,-98);
DELETE FROM reporting_test.administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM reporting_test.ethnicity WHERE id IN (-99,-98);
DELETE FROM reporting_test.gender  WHERE id IN (-99,-98);
DELETE FROM reporting_test.translation WHERE label_code IN ('code1-test', 'code2-test') AND language_code in ('lan', 'gua') AND namespace in ('backend');
DELETE FROM reporting_test.accommodation WHERE id IN (-99,-98);
DELETE FROM reporting_test.depth_of_knowledge  WHERE id IN (-99,-98);
DELETE FROM reporting_test.math_practice  WHERE practice IN (-99,-98);
DELETE FROM reporting_test.item_trait_score WHERE id IN (-99,-98);
DELETE FROM reporting_test.target  WHERE id IN (-99,-98);
DELETE FROM reporting_test.common_core_standard  WHERE id IN (-99,-98);
DELETE FROM reporting_test.grade WHERE id IN (-99,-98);
DELETE FROM reporting_test.claim WHERE id IN (-99,-98);

DELETE FROM reporting_test.migrate;