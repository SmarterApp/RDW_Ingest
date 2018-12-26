DELETE FROM staging_school_year WHERE year IN (1999, 1998);
DELETE FROM staging_elas;
DELETE FROM staging_language;
DELETE FROM staging_completeness;
DELETE FROM staging_administration_condition;
DELETE FROM staging_ethnicity;
DELETE FROM staging_gender;
DELETE FROM staging_grade;

DELETE FROM school_year WHERE year IN (1999, 1998);
DELETE FROM elas WHERE id < 0 ;
DELETE FROM language WHERE id < 0 ;
DELETE FROM completeness WHERE id < 0 ;
DELETE FROM administration_condition WHERE id < 0;
DELETE FROM ethnicity WHERE id < 0;
DELETE FROM gender WHERE id < 0;
DELETE FROM grade WHERE id >= 100;
DELETE FROM asmt_active_year WHERE school_year IN (1999, 2000);
