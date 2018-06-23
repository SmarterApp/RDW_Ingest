INSERT INTO school_year(year) VALUES (1999),(1998);
INSERT INTO grade(id, code, name, sequence) VALUES (111 ,'31','11th-grade-test', 11),(109,'29','9th-grade-test', 9),(108 ,'28','8th-grade-test', 8),(107 ,'27','7th-grade-test', 7);
INSERT INTO elas(id, code) VALUES (-99, 'E99'),(-98, 'E98');
INSERT INTO completeness(id, code) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO administration_condition(id, code) VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO ethnicity(id, code) VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO gender(id, code) VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO accommodation(id, code) VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO depth_of_knowledge(id, level, subject_id, description, reference) VALUES (-99,-1,1,'Recall and Reproduction','something'),(-98,-2,1,'Basic Skills and Concepts','anything');
INSERT INTO math_practice(practice, description, code)  VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
INSERT INTO item_trait_score(id, dimension) VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO common_core_standard(id, natural_id, subject_id, description) VALUES (-99, 'naturalId-99', 1,'ccommon core -99'),(-98, 'naturalId-98', 2, 'common core -98');
INSERT INTO accommodation_translation(accommodation_id, language_code, label) VALUES (-99, 'lan', 'Hola'),(-98, 'gua','Hello');

insert into claim (id, subject_id, code, name, description) values
  (-1,   1, '1', 'Math-claim1', 'Math-c1'),
  (-2,   1, '3', 'Math-claim2', 'Math-c1'),
  (-99,  2, 'c9', '3', ''),
  (-98,  2, 'c8', '2', ''),
  (-11,  2, '1',  'ELA-claim1', 'ELA-c1'),
  (-12,  2, '2',  'ELA-claim2', 'ELA-c2'),
  (-13,  2, '3',  'ELA-claim3', 'ELA-c3'),
  (-14,  2, '4',  'ELA-claim4', 'ELA-c4');

INSERT INTO target(id, code, natural_id, claim_id, description) VALUES
  (-99,  'E-3', 'NBT|99',  -11,  'NBT|E-3-1'),
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