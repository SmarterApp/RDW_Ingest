INSERT INTO reporting_test.district (id, name, natural_id) VALUES
  (-99, 'Before Test -99', 'natural_id-99');

INSERT INTO reporting_test.school (id, district_id, name, natural_id, import_id) VALUES
  (-99, -99, 'Before Test -99', 'natural_id-99', -1);
