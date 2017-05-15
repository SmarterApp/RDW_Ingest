UPDATE staging_test.staging_school SET deleted = 1 WHERE id = -99;
-- district in the staging should have only updated or inserted rows
DELETE FROM staging_test.staging_district WHERE id = -99;