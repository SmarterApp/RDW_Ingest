INSERT INTO school_year(year) VALUES (1999), (1998);
INSERT INTO grade(id, code, sequence) VALUES (107,'27', 7),(108 ,'28', 8), (109,'29', 9),(100,'30', 10),(111,'31', 11),(112,'32', 12);
INSERT INTO elas(id, code) VALUES (-99, 'E99'), (-98, 'E98');
INSERT INTO completeness(id, code) VALUES (-99, 'test1'), (-98, 'test55');
INSERT INTO administration_condition(id, code) VALUES (-99,'IN-test'),(-98,'NS-test'),(-97,'SD-test'),(-96,'Valid-test');
INSERT INTO ethnicity(id, code) VALUES (-99,'AmericanIndianOrAlaskaNative-test'),(-98,'Asian-test');
INSERT INTO gender(id, code) VALUES (-99,'Female-test'),(-98,'Male-test');
INSERT INTO target(id, natural_id, claim_code) VALUES
  (-11, 'NBT|E-3', '1'),
  (-12, 'MD|J-3',  '1'),
  (-21, 'OA|D',    '2'),
  (-22, 'OA|A',    '2'),
  (-31, 'NF|C',    '3'),
  (-32, 'MD|D',    '3'),
  (-33, 'MD|E',    '3'),
  (-34, 'OA|E',    '3'),
  (-41, 'OA|E',    '4'),
  (-42, 'MD|D',    '4'),
  (-43, 'OA|A',    '4');