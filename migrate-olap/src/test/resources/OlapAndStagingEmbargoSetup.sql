INSERT INTO district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -10),
  (-98, 'Sample District -98', 'natural_id-98', -10);

INSERT INTO school_year VALUES (1998), (1999);

INSERT INTO district_embargo (school_year, district_id, subject_id, aggregate, migrate_id) VALUES
(1998, -98, 1, 2, 1),
(1998, -98, 2, 2, 1),
(1999, -99, 1, 0, 1),
(1999, -99, 2, 0, 1);

-- and the district embargo staging ...
INSERT INTO staging_district_embargo (school_year, district_id, subject_id, aggregate, migrate_id) VALUES
(1998, -99, 1, 2, 2),
(1998, -99, 2, 2, 2),
(1999, -99, 1, 1, 2),
(1999, -99, 2, 0, 2);
