/*
 * Used from warehouse.
 * Need to make sure constraints to not conflict with initial DML
 */
INSERT INTO warehouse_test.grade (id, code, name) VALUES (-98, '98', '1st-grade');
INSERT INTO warehouse_test.completeness (id, code) VALUES (-98, 'test55');
INSERT INTO warehouse_test.administration_condition VALUES (-98, 'NS-test'), (-97, 'SD-test'), (-96, 'Valid-test');
INSERT INTO warehouse_test.ethnicity VALUES (-98, 'Asian-test');
INSERT INTO warehouse_test.gender VALUES (-98, 'Male-test');
INSERT INTO warehouse_test.accommodation VALUES (-98, 'code2-test');
INSERT INTO warehouse_test.claim VALUES (-98, 2, 'claim-98', 'Write Effectively', 'Write Effectively - ..');
INSERT INTO warehouse_test.depth_of_knowledge VALUES (-98, 2, 1, 'Basic Skills and Concepts', 'anything');
INSERT INTO warehouse_test.math_practice VALUES (-98, 'Reason abstractly and quantitatively');
INSERT INTO warehouse_test.item_trait_score VALUES (-98, 'Evidence/Elaboration-test');
INSERT INTO warehouse_test.target VALUES (-98, 'target-98', -98, '10-12', 'WORD MEANINGS:..)');
INSERT INTO warehouse_test.common_core_standard VALUES (-98,'natural-98', 2, 'common core 98..)');
INSERT INTO warehouse_test.item_difficulty_cuts (id, asmt_type_id, subject_id, grade_id, moderate_low_end, difficult_low_end) VALUES (-98, 1, 2, -98, -1.51022, 0.14288);
INSERT INTO warehouse_test.language VALUES (-98,'gua');
INSERT INTO warehouse_test.accommodation_translation VALUES (-98, -98, 'Adios');