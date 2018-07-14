--
-- Used from warehouse.
-- Need to make sure constraints to not conflict with initial DML
--
INSERT INTO grade (id, code, name, sequence) VALUES (-99,'99','K-garten', 9),(-98 ,'98','1st-grade', 8);
INSERT INTO elas (id, code) VALUES (-99, 'E99'),(-98, 'E98');
INSERT INTO completeness (id, code) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO administration_condition VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO ethnicity VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO gender VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO accommodation (id, code) VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO claim VALUES (-99 ,2,'t1-IT'),( -98,2,'t2-W');
INSERT INTO depth_of_knowledge  VALUES (-99,-1,1,'something'),(-98,-2,1,'anything');
INSERT INTO math_practice  VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
INSERT INTO item_trait_score VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO target VALUES (-99, 'natural-99', -99),(-98, 'naturalId-99', -98);
INSERT INTO common_core_standard VALUES (-99, 'naturalId-99', 1),(-98, 'naturalId-98', 2);
INSERT INTO item_difficulty_cuts  VALUES (-99, 2, -99,-1.93882,-0.43906),(-98, 2, -98,-1.51022,0.14288);
INSERT INTO accommodation_translation(accommodation_id, language_code, label) VALUES (-99, 'lan', 'Hola'),(-98, 'gua','Hello');