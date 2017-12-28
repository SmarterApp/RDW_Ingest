-- set individual embargo for the districts
-- (the state setting will be done differently for each test)

INSERT INTO district_embargo (district_id, school_year, updated, updated_by, individual, aggregate) VALUES
  (-1,  1999, '2017-07-18 19:06:35.966000', 'dwtest@example.com', null, null),
  (-98, 1999, '2017-07-18 19:06:35.966000', 'dwtest@example.com', null, 0),
  (-99, 1999, '2017-07-18 19:06:35.966000', 'dwtest@example.com', null, 1);
