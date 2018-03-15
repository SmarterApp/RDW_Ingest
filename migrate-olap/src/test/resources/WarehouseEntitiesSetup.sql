-------------------------- Preload  entities into warehouse  -------------------------------------------------------------------------------------------------------
INSERT INTO district_group (id, name, natural_id) VALUES
  (-98, 'Sample District Group -98', 'natural_id-98');

INSERT INTO district (id, name, natural_id) VALUES
  (-1, 'Preload District -1', 'natural_id-1'),
  (-99, 'Sample District -99', 'natural_id-99'),
  (-98, 'Sample District -98', 'natural_id-98');

INSERT INTO school_group (id, name, natural_id) VALUES
  (-1, 'New School Group -1', 'natural_id-1'),
  (-98, 'Sample School Group -98', 'natural_id-98');

INSERT INTO school (id, district_id, district_group_id, school_group_id, name, natural_id, deleted, import_id, update_import_id, created, updated) VALUES
  (-1, -1, NULL, -1, 'Preload School -1', 'natural_id-1', 0, -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
-- -99 is marked as deleted.  It's district will not be copied.
  (-99, -99, NULL, NULL, 'Sample School -99', 'natural_id-99', 1, -1, -1, '2017-07-18 20:14:34.966000', '2017-07-18 20:14:34.000000'),
  (-98, -98, -98, -98, 'Sample School -98', 'natural_id-98', 0, -2, -2, '2017-07-18 20:13:34.000000', '2017-07-18 20:13:34.000000');

INSERT INTO asmt
  (id, type_id, natural_id,                    grade_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id, created, updated) VALUES
  (-11, 1,     'ica-1999-grade-98-subject-1',       -98,   1,        1999,        'ica-1999-grade-98-subject-1',        'test',       '9835', 0,   -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-99, 3,     'summative-1999-grade-99-subject-1', -99,   1,        1999,        'summative-1999-grade-99-subject-1',  'summative',  '9835', 1,   -5000,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-98, 1,     'ica-1999-grade-98-subject-2',       -98,   2,        1999,        'ica-1999-grade-98-subject-2',        'ica',        '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-66, 2,     'iab',                               -99,   2,        1999,        'iab',                                'iab',        '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-97, 2,     'iab-1999-grade-98-subject-2',       -98,   2,        1999,        'iab-1999-grade-98-subject-2',        'iab',        '9831', 0,     -20,   -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                                    lep_exit_at, birthday, import_id, update_import_id, deleted, created, updated) VALUES
  (-11, '11', 'LastName-preload', 'FirstName-preload', 'MiddleName-preload', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -5000, 0, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-89, '89', '漢字', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -89, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:00.966000'),
  (-88, '88', 'Last, Name2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000'),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -87, -87, 0, '2017-07-18 19:09:33.966000', '2017-07-18 19:09:33.966000'),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -86, -86, 0, '2017-07-18 19:09:3.966000', '2017-07-18 19:09:33.966000'),
  (-33, '33', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', 2000, 2000, 0, '2017-07-18 20:16:33.966000', '2017-07-18 20:16:33.966000');

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
  (-89,  -99),
  (-88,  -98),
  (-87,  -98),
  (-86,  -98),
  (-86,  -99);

INSERT INTO  exam ( id, type_id, school_year, asmt_id, student_id, completed_at,
                    asmt_version, opportunity, completeness_id,
                    administration_condition_id, session_id, performance_level, scale_score, scale_score_std_err,
                    import_id, update_import_id, deleted, created, updated,
                    grade_id, school_id, iep, lep, section504, economic_disadvantage,
                    migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) VALUES
  (-88, 3, 1999, -99, -89, '2016-08-14 19:05:33.967000', null, 1, 1, 1, 'session', 1,    2145, 20.17, -5000, -88, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-87, 1, 1998, -11, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2106, 21.17,  -88, -88, 0,   '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-85, 1, 1999, -11, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2125, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-68, 2, 1999, -66, -89, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2135, 30.17,  -88, -88, 1, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-84, 2, 1998, -66, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2135, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-83, 2, 1999, -66, -11, '2016-08-12 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2000, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-10, 2, 1999, -97, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', null, 2135, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-11, 2, 1998, -97, -89, '2016-08-12 19:06:07.966000', null, 1, 1, 1, 'session', 1,    null, 30.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-12, 2, 1999, -97, -89, '2016-08-12 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2000, null,   -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),

  (-15, 3, 1999, -99, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', 1,    null, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-16, 1, 1998, -98, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', 1,    2125, null,   -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-17, 1, 1999, -98, -11, '2016-08-14 19:06:07.966000', null, 1, 1, 1, 'session', null, 2125, 40.17,  -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null);

INSERT INTO exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
   (-1, -88, 1, 2014, 0.19, 1),
   (-2, -87, 1, 2014, 0.19, 1),
   (-4, -85, 1, 2014, 0.19, 1);