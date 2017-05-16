-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
UPDATE staging_test.staging_school SET deleted = 1 WHERE id = -99;
-- district in the staging should have only updated or inserted rows
DELETE FROM staging_test.staging_district WHERE id = -99;

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
UPDATE staging_test.staging_asmt SET deleted = 1 WHERE id = -99;
DELETE FROM staging_test.staging_asmt_score WHERE asmt_id = -99;
DELETE FROM staging_test.staging_item WHERE asmt_id = -99;



