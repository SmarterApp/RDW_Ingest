DELETE FROM staging_school_year WHERE year IN (1999, 1998);
delete from staging_completeness;
delete from staging_administration_condition;
delete from staging_ethnicity;
delete from staging_gender;
delete from staging_grade;

DELETE FROM school_year WHERE year IN (1999, 1998);
DELETE FROM completeness WHERE id < 0 ;
DELETE FROM administration_condition WHERE id < 0;
DELETE FROM ethnicity WHERE id < 0;
DELETE FROM gender WHERE id < 0;
DELETE FROM grade WHERE id < 0;
DELETE FROM asmt_active_year WHERE school_year IN (1999, 2000);