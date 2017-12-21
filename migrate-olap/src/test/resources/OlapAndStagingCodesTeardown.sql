DELETE FROM staging_school_year WHERE year IN (1999, 1998);
delete from staging_completeness;
delete from staging_administration_condition;
delete from staging_ethnicity;
delete from staging_gender;
delete from staging_grade;

DELETE FROM school_year WHERE year IN (1999, 1998);
DELETE FROM completeness WHERE id IN (-99,-98);
DELETE FROM administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM ethnicity WHERE id IN (-99,-98);
DELETE FROM gender  WHERE id IN (-99,-98);
DELETE FROM grade WHERE id IN (-99,-98);
DELETE FROM active_asmt_per_year WHERE school_year IN (1999, 2000);