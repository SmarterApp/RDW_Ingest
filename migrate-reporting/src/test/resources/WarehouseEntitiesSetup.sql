-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_test.staging_district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -99);

INSERT INTO staging_test.staging_district (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample District -98', 'natural_id-98', -99);

INSERT INTO staging_test.staging_school (id, district_id, name, natural_id, deleted, migrate_id, import_id) VALUES
  (-99, -99, 'Sample School -99', 'natural_id-99', 0, -99, -1);

INSERT INTO staging_test.staging_school (id, district_id, name, natural_id, deleted, migrate_id, import_id) VALUES
  (-98, -98, 'Sample School -98', 'natural_id-98', 0, -99, -1);

