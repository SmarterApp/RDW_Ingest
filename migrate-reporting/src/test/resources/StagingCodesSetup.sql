INSERT INTO staging_grade(id, code, name, sequence) VALUES (-99,'99','K-garten', 9),(-98 ,'98','1st-grade', 8);
INSERT INTO staging_elas(id, code) VALUES (-99, 'E99'),(-98, 'E98');
INSERT INTO staging_completeness(id, code) VALUES (-99, 'test99'), (-98, 'test98');
INSERT INTO staging_administration_condition(id, code) VALUES (-99,'99-test'),(-98,'98-test'),(-97,'97-test'),(-96,'96-test');
INSERT INTO staging_ethnicity(id, code) VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO staging_gender(id, code) VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO staging_accommodation(id, code) VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO staging_school_year(year) VALUES(1999),(1998);
INSERT INTO staging_depth_of_knowledge(id, level, subject_id, description, reference) VALUES (-99,1,1,'Recall and Reproduction','something'),(-98,2,1,'Basic Skills and Concepts','anything');
INSERT INTO staging_math_practice(practice, description, code) VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
INSERT INTO staging_item_trait_score(id, dimension) VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO staging_common_core_standard(id, natural_id, subject_id, description) VALUES (-99,'naturalid-99', 1, 'standard 99.'),(-98, 'naturalid-98',  2, 'standard 98:..)');
INSERT INTO staging_accommodation_translation (label_code, language_code, label) VALUES ('code1-test', 'lan','Hola'),('code2-test', 'gua','Hello');

insert into staging_claim (id, subject_id, code, name, description) values
  (-99,  2, 'c9', '3', ''),
  (-98,  2, 'c8', '2', ''),
  (-11,  2, '1',  'ELA-claim1', 'ELA-c1'),
  (-14,  2, '4',  'ELA-claim4', 'ELA-c4');

INSERT INTO staging_target(id, code, natural_id, claim_id, description) VALUES
  (-99,  'E-3', 'NBT|99',  -11,  'NBT|E-3-1'),
  (-98,  'E-3', 'NBT|98',  -11,  'NBT|E-3-1'),

  (-41,  'E',    'OA|E',   -14,  'OA|E-4'   ),
  (-42,  'D',    'MD|D',   -14,  'MD|D-4'   ),
  (-43,  'A',    'OA|A',   -14,  'OA|A-4'   );