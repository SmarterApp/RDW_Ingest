DELETE FROM staging_district_embargo WHERE district_id IN (-99, -98);
DELETE FROM school WHERE id IN (-99, -98, -97);
DELETE FROM district WHERE id IN (-99, -98);
