/*
 * Used from warehouse.
 * Need to make sure constraints to not conflict with initial DML
 */
INSERT INTO warehouse_test.grade (id, code, name) VALUES (-99,'99','K-garten'),(-98 ,'98','1st-grade');
INSERT INTO warehouse_test.completeness (id, name) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO warehouse_test.administration_condition VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO warehouse_test.ethnicity VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO warehouse_test.gender VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO warehouse_test.accommodation VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO warehouse_test.claim VALUES (-99 ,2,'1-IT','Read Analytically: Informational Text','Read Analytically: Informational Text ...'),( -98,2,'2-W','Write Effectively','Write Effectively - ..');
INSERT INTO warehouse_test.depth_of_knowledge  VALUES (-99,1,1,'Recall and Reproduction','something'),(-98,2,1,'Basic Skills and Concepts','anything');
INSERT INTO warehouse_test.math_practice  VALUES (-99,'Make sense of problems and persevere in solving them'),(-98,'Reason abstractly and quantitatively');
INSERT INTO warehouse_test.item_trait_score VALUES (-99,'Conventions-test'),(-98,'Evidence/Elaboration-test');
INSERT INTO warehouse_test.target VALUES (-99, 'natural-99', -99,'10-1','WORD MEANINGS: Determine intended meanings of words..'),(-98, 'natural-99', -98,'10-12','WORD MEANINGS:..)');
INSERT INTO warehouse_test.item_difficulty_cuts  VALUES (-99, 1, 2, -99,-1.93882,-0.43906),(-98 ,1, 2, -98,-1.51022,0.14288);
INSERT INTO warehouse_test.language VALUES (-99,'lan'),(-98,'gua');
INSERT INTO warehouse_test.accommodation_translation VALUES (-99, -99,'Hola'),(-98, -98,'Hello');