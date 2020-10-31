DELETE FROM staging_district_embargo WHERE school_year = 1999 AND district_id IN (-99, -98);
DELETE FROM district_embargo WHERE school_year = 1999 AND district_id IN (-99, -98);
DELETE FROM school_year where year = 1999;
DELETE FROM district WHERE id IN (-99, -98);

