INSERT INTO district (id, name, natural_id) VALUES
  (-11, 'Sample District 1', 'District1NaturalId');

INSERT INTO import (id, status, content, contentType, batch, digest, message) VALUES
  (-99, 1, 1, 'type', 'batch1', '-99', null),
  (-98, 1, 1, 'type', 'batch1', '-98', null),
  (-97, 1, 1, 'type', null, '-97', null),
  (-96, -6, 1, 'type', 'batch1', '-96', 'unknown school 123');

INSERT INTO school (id, district_id, name, natural_id, import_id, update_import_id) VALUES
  (-12, -11, 'Sample School 1', 'School1NaturalId', -99, -99);

INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, import_id, update_import_id, name, label) VALUES
  (-20, 'ASMT20', 11, 1, 1, 2017, -99, -99, 'name', 'label');

INSERT INTO student (id, ssid, last_or_surname, first_name, gender_id, birthday, import_id, update_import_id) VALUES
  (-199, '6666666669', 'LastName9', 'FirstName9', 1, '2006-07-09', -99, -99),
  (-198, '6666666668', 'LastName8', 'FirstName8', 1, '2006-07-08', -98, -98),
  (-197, '6666666667', 'LastName7', 'FirstName7', 1, '2006-07-07', -97, -97);

INSERT INTO exam_student (id, grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage) VALUES
  (-299, 11, -199, -12, 0, 0, 0, 0),
  (-298, 11, -198, -12, 0, 0, 0, 0),
  (-297, 11, -197, -12, 0, 0, 0, 0);

INSERT INTO exam (id, type_id, exam_student_id, school_year, asmt_id, oppId, completeness_id, administration_condition_id, completed_at, import_id, update_import_id, session_id) VALUES
  (-399, 1, -299, 2017, -20, '1021', 2, 1, '2017-05-12', -99, -99, 'session'),
  (-398, 1, -298, 2017, -20, null, 2, 1, '2017-05-12', -98, -98, 'session'),
  (-397, 1, -297, 2017, -20, '3333', 2, 1, '2017-05-12', -97, -97, 'session');