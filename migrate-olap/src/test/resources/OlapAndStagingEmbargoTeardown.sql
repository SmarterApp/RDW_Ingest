DELETE FROM staging_district_embargo WHERE district_id < 0;
DELETE FROM district_embargo WHERE district_id < 0;
DELETE FROM school_year WHERE year in (1998, 1999);
DELETE FROM district WHERE id < 0;
