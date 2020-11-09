-- set individual embargo for the districts
-- (the state setting will be done differently for each test)

INSERT INTO district_embargo (district_id, school_year, subject_id, updated, updated_by, individual, aggregate) VALUES
  (-1,  1999, 1, '2017-07-18 19:06:35.966000', 'dwtest@example.com', 2, 2),
  (-98, 1999, 1, '2017-07-18 19:06:35.966000', 'dwtest@example.com', 2, 2),
  (-99, 1999, 1, '2017-07-18 19:06:35.966000', 'dwtest@example.com', 1, 1);
