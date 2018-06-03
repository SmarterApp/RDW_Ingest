INSERT INTO grade(id, code, name, sequence) VALUES (-99,'AA','before test', 9);
INSERT INTO elas(id, code) VALUES (-99, 'before test');
INSERT INTO completeness(id, code) VALUES (-99, 'before');
INSERT INTO administration_condition(id, code) VALUES (-99,'before test');
INSERT INTO ethnicity(id, code) VALUES (-99,'before test');
INSERT INTO gender(id, code) VALUES (-99,'before test');
INSERT INTO accommodation(id, code) VALUES(-99, 'before test');
INSERT INTO school_year(year) VALUES(1999);
INSERT INTO depth_of_knowledge(id, level, subject_id, description, reference) VALUES (-99, 1, 1,'before test', 'before');
INSERT INTO math_practice(practice, description, code) VALUES (-99,'before test', '-9');
INSERT INTO item_trait_score(id, dimension) VALUES (-99,'before test');
INSERT INTO common_core_standard(id, natural_id, subject_id, description) VALUES (-99, 'naturalId-99', 1, 'before test');
INSERT INTO accommodation_translation(label_code, language_code, label) VALUES ('code1-test', 'lan', 'before test');

INSERT INTO claim (id, subject_id, code, name, description) VALUES
  (-1,   1, '1', 'Math-claim1', 'Math-c1'),
  (-2,   1, '3', 'Math-claim2', 'Math-c1'),
  (-99,  2, 'c9', '3', ''),
  (-11,  2, '1',  'ELA-claim1', 'ELA-c1'),
  (-12,  2, '2',  'ELA-claim2', 'ELA-c2'),
  (-13,  2, '3',  'ELA-claim3', 'ELA-c3'),
  (-14,  2, '4',  'ELA-claim4', 'ELA-c4');

INSERT INTO target(id, code, natural_id, claim_id, description) VALUES
  (-99,  'E-3', 'NBT|99',  -11,  'NBT|E-3-1'),

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