DELETE FROM elas WHERE id in (-99, -98);
DELETE FROM language WHERE id in (-99, -98);
DELETE FROM completeness WHERE id IN (-99,-98);
DELETE FROM administration_condition WHERE id IN (-99,-98, -97, -96);
DELETE FROM military_connected WHERE id IN (-99,-98);
DELETE FROM ethnicity WHERE id IN (-99,-98);
DELETE FROM gender WHERE id IN (-99,-98);
DELETE FROM accommodation_translation WHERE accommodation_id IN (-99, -98);
DELETE FROM accommodation WHERE id IN (-99,-98);
DELETE FROM school_year WHERE year IN (1999,1998);
DELETE FROM math_practice  WHERE practice IN (-99,-98);
DELETE FROM grade WHERE id IN (-99,-98);

