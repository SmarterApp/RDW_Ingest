-- need some sample districts
INSERT INTO district (id, name, natural_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99'),
  (-98, 'Sample District -98', 'natural_id-98');

-- and a sample school year
INSERT INTO school_year (year) values (1999);

-- and the district embargo staging ...
INSERT INTO staging_district_embargo (school_year, district_id, subject_id, individual, migrate_id) VALUES
  (1999, -99, 1, 1, -99),
  (1999, -98, 1, 1, -99);
