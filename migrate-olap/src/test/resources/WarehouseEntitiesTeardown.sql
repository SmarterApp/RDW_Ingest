-- ---------------------------------------------- Exams ---------------------------------------------------------------------------------------------
DELETE FROM exam_score where exam_id < 0;
DELETE FROM exam_target_score where exam_id < 0;
DELETE FROM exam where id < 0;

-- ------------------------------------------ Student and Groups  ------------------------------------------------------------------------------------------------
DELETE FROM student_ethnicity where student_id in ( -89, -88, -87, -86);
DELETE FROM student where id in (-11,  -89, -88, -87, -86, -33, -18);

-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
DELETE FROM school where id in (-99, -98, -1);
DELETE FROM district where id in (-99, -98, -1);
DELETE FROM district_group where id in (-98);
DELETE FROM school_group where id in (-98, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
DELETE FROM asmt_score where asmt_id < 0;
DELETE FROM item where id < 0;
DELETE FROM asmt_target_exclusion where asmt_id < 0 or target_id < 0;
DELETE FROM asmt where id < 0;

DELETE FROM target WHERE id < 0;
DELETE FROM common_core_standard WHERE id < 0;
DELETE FROM claim WHERE id < 0;
DELETE FROM depth_of_knowledge WHERE id < 0;
DELETE FROM subject_score where id < 0 or subject_id <0;
DELETE FROM subject_asmt_scoring where subject_id < 0;
DELETE FROM subject_asmt_type where subject_id < 0;
DELETE FROM subject where id < 0;
