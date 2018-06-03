INSERT INTO staging_grade(id, code, name, sequence) VALUES (-98, '98', '1st-grade', 8);
INSERT INTO staging_elas(id, code) VALUES (-98, 'E98');
INSERT INTO staging_completeness(id, code) VALUES (-98, 'test55');
INSERT INTO staging_administration_condition(id, code) VALUES (-98, 'NS-test'), (-97, 'SD-test'), (-96, 'Valid-test');
INSERT INTO staging_ethnicity(id, code) VALUES (-98, 'Asian-test');
INSERT INTO staging_gender(id, code) VALUES (-98, 'Male-test');
INSERT INTO staging_accommodation(id, code) VALUES (-98, 'code2-test');
INSERT INTO staging_school_year(year) VALUES (1998);
INSERT INTO staging_depth_of_knowledge(id, level, subject_id, description, reference) VALUES (-98, 2, 1, 'Basic Skills and Concepts', 'anything');
INSERT INTO staging_math_practice(practice, description, code) VALUES (-98, 'Reason abstractly and quantitatively', '-8');
INSERT INTO staging_item_trait_score(id, dimension) VALUES (-98, 'Evidence/Elaboration-test');
INSERT INTO staging_common_core_standard(id, natural_id, subject_id, description) VALUES (-98, 'naturalid-98', 2, 'standard 98');
INSERT INTO staging_accommodation_translation(label_code, language_code, label) VALUES ('code2-test', 'gua', 'Adios');

insert into staging_claim (id, subject_id, code, name, description) values
  (-1,   1, '1', 'Math-claim1', 'Math-c1'),
  (-2,   1, '3', 'Math-claim2', 'Math-c1'),
  (-98,  2, 'c8', '2', ''),
  (-11,  2, '1',  'ELA-claim1', 'ELA-c1'),
  (-12,  2, '2',  'ELA-claim2', 'ELA-c2'),
  (-13,  2, '3',  'ELA-claim3', 'ELA-c3'),
  (-14,  2, '4',  'ELA-claim4', 'ELA-c4');

INSERT INTO staging_target(id, code, natural_id, claim_id, description) VALUES
  (-98,  'E-3', 'NBT|98',  -11,  'NBT|E-3-1'),

  (-71,  'E-3', 'NBT|E-3', -1,  'NBT|E-3-1'),
  (-72,  'J-3',  'MD|J-3', -2,  'MD|J-3-1' ),
  (-73,  'D',    'OA|D',   -2,  'OA|D-2'   ),

  (-11,  'E-3', 'NBT|E-3', -11,  'NBT|E-3-1'),
  (-12,  'J-3',  'MD|J-3', -11,  'MD|J-3-1' ),
  (-21,  'D',    'OA|D',   -12,  'OA|D-2'   ),
  (-22,  'A',    'OA|A',   -12,  'OA|A-2'   ),
  (-31,  'C',    'NF|C',   -13,  'NF|C-3'   ),
  (-32,  'D',    'MD|D',   -13,  'MD|D-3'   ),
  (-33,  'E',    'MD|E',   -13,  'MD|E-3'   ),
  (-34,  'E',    'OA|E',   -13,  'OA|E-3'   ),
  (-41,  'E',    'OA|E',   -14,  'OA|E-4'   ),
  (-42,  'D',    'MD|D',   -14,  'MD|D-4'   ),
  (-43,  'A',    'OA|A',   -14,  'OA|A-4'   );