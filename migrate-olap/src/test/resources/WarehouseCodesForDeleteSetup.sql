INSERT INTO school_year(year) VALUES (1998);
INSERT INTO grade(id, code, name, sequence) VALUES (108, '20', '8th-grade-test', 8);
INSERT INTO elas(id, code) VALUES (-98, 'E98');
INSERT INTO completeness(id, code) VALUES (-98, 'test55');
INSERT INTO administration_condition(id, code) VALUES (-98, 'NS-test'), (-97, 'SD-test'), (-96, 'Valid-test');
INSERT INTO ethnicity(id, code) VALUES (-98, 'Asian-test');
INSERT INTO gender(id, code) VALUES (-98, 'Male-test');
insert into claim (id, subject_id, code, name, description) values (-11,  2, '1',  'ELA-claim1', 'ELA-c1');
INSERT INTO target(id, code, natural_id, claim_id, description) VALUES (-98,  'E-3', 'NBT|98', -11,  'NBT|E-3-1');