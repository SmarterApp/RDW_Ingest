-- need some schools that use the districts ...
INSERT INTO district (id, name, natural_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99'),
  (-98, 'Sample District -98', 'natural_id-98');

INSERT INTO school (id, district_id, name, natural_id, embargo_enabled, migrate_id, update_import_id, updated) VALUES
  (-99, -99, 'Sample School -99', 'natural_id-99', 0, -10, -1, '2017-07-18 20:14:34.000000'),
  (-98, -98, 'Sample School -98', 'natural_id-98', 0, -10, -1, '2017-07-18 20:14:34.000000'),
  (-97, -98, 'Sample School -97', 'natural_id-97', 0, -10, -1, '2017-07-18 20:14:34.000000');

-- and the district embargo staging ...
INSERT INTO staging_district_embargo (district_id, individual, aggregate, migrate_id) VALUES
  (-99, 0, 1, -99),
  (-98, 1, 1, -99);
