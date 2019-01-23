INSERT INTO grade(id, code, name, sequence) VALUES (-99,'99','K-garten',9),(-98 ,'98','1st-grade', 8);
INSERT INTO elas(id, code) VALUES (-99, 'E99'),(-98, 'E98');
INSERT INTO language(id, code, display_order, name) VALUES (-99, 'abc', 1, 'lang-abc'),(-98, 'cba', 2, 'lang-cba');
INSERT INTO completeness(id, code) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO administration_condition(id, code) VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO military_connected(id, code) VALUES (-99,'No-test'),(-98,'Active-test');
INSERT INTO ethnicity(id, code) VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO gender(id, code) VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO accommodation(id, code) VALUES(-99, 'code1-test'),( -98 ,'code2-test');
INSERT INTO accommodation_translation(accommodation_id, language_code, school_year, label) VALUES (-99, 'lan', 2017, 'Hola'), (-98, 'gua', 2017, 'Hello');
INSERT INTO school_year(year) VALUES(1999),( 1998);
INSERT INTO math_practice(practice, description, code) VALUES (-99,'Make sense of problems and persevere in solving them', '-9'),(-98,'Reason abstractly and quantitatively', '-8');
