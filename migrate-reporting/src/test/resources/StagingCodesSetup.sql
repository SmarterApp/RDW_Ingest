INSERT INTO staging_grade (id, code, name, sequence) VALUES (-99,'99','K-garten', 9),(-98 ,'98','1st-grade', 8);
INSERT INTO staging_elas (id, code) VALUES (-99, 'E99'),(-98, 'E98');
INSERT INTO staging_completeness (id, code) VALUES (-99, 'test99'), (-98, 'test98');
INSERT INTO staging_administration_condition VALUES (-99,'99-test'),(-98,'98-test'),(-97,'97-test'),(-96,'96-test');
INSERT INTO staging_ethnicity VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO staging_gender VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO staging_accommodation VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO staging_school_year VALUES(1999),(1998);
INSERT INTO staging_claim VALUES (-99 ,2,'1-IT','Read Analytically: Informational Text','Read Analytically: Informational Text ...'),( -98,2,'2-W','Write Effectively','Write Effectively - ..');
INSERT INTO staging_depth_of_knowledge  VALUES (-99,1,1,'Recall and Reproduction','something'),(-98,2,1,'Basic Skills and Concepts','anything');
INSERT INTO staging_math_practice(practice, description, code) VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
INSERT INTO staging_item_trait_score VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO staging_target VALUES (-99, -99,'target-99','WORD MEANINGS: Determine intended meanings of words..'),(-98, -98,'target-98','WORD MEANINGS:..)');
INSERT INTO staging_common_core_standard VALUES (-99,'naturalid-99', 1, 'standard 99.'),(-98, 'naturalid-98',  2, 'standard 98:..)');
INSERT INTO staging_accommodation_translation (label_code, language_code, label) VALUES ('code1-test', 'lan','Hola'),('code2-test', 'gua','Hello');