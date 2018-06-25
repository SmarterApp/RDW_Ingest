TRUNCATE staging_elas;
TRUNCATE staging_completeness;
TRUNCATE staging_administration_condition;
TRUNCATE staging_ethnicity;
TRUNCATE staging_gender;
TRUNCATE staging_accommodation_translation;
TRUNCATE staging_accommodation;
TRUNCATE staging_school_year;
TRUNCATE staging_math_practice;
TRUNCATE staging_grade;

DELETE FROM elas WHERE id in (-99, -98);
DELETE FROM completeness WHERE id IN (-99,-98, -95);
DELETE FROM administration_condition WHERE id IN (-99,-98, -97, -96, -95);
DELETE FROM ethnicity WHERE id IN (-99,-98);
DELETE FROM gender WHERE id IN (-99,-98);
DELETE FROM accommodation_translation where language_code in ('lan', 'gua');
DELETE FROM accommodation WHERE id IN (-99,-98);
DELETE FROM school_year WHERE year IN (1999,1998);
DELETE FROM math_practice WHERE practice IN (-99,-98);
DELETE FROM grade WHERE id IN (-99,-98);

DELETE FROM migrate;