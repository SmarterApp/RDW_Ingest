--
INSERT INTO reporting_test.grade (id, code, name) VALUES (-99,'99','K-garten'),(-98 ,'98','1st-grade');
INSERT INTO reporting_test.completeness (id, code) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO reporting_test.administration_condition VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO reporting_test.ethnicity VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO reporting_test.gender VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO reporting_test.accommodation VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO reporting_test.school_year VALUES(1999),(1998);
INSERT INTO reporting_test.claim VALUES (-99 ,2,'claim-99','Read Analytically: Informational Text','Read Analytically: Informational Text ...'),( -98,2,'claim-98','Write Effectively','Write Effectively - ..');
INSERT INTO reporting_test.depth_of_knowledge  VALUES (-99,1,1,'Recall and Reproduction','something'),(-98,2,1,'Basic Skills and Concepts','anything');
INSERT INTO reporting_test.math_practice  VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
INSERT INTO reporting_test.item_trait_score VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO reporting_test.target  VALUES (-99,-99,'target-99','WORD MEANINGS: Determine intended meanings of words..'),(-98,-98,'target-98','WORD MEANINGS:..)');
INSERT INTO reporting_test.common_core_standard  VALUES (-99,'naturalid-99', 1, 'common core 99'),(-98, 'naturalid-98', 2,'common core 98');
INSERT INTO reporting_test.translation (namespace, label_code, language_code, label) VALUES ('backend', 'code1-test', 'lan', 'before test'), ('backend', 'code2-test', 'gua', 'before test 2');

