-------------------------- Preload exams into warehouse  -------------------------------------------------------------------------------------------------------
INSERT INTO import (id, status, content, contentType, digest) VALUES
(-5000, 0, 8, 'content-type', 'digest');

INSERT INTO district (id, name, natural_id) VALUES
(-1, 'Preload District -1', 'natural_id-1');

INSERT INTO school (id, district_id, name, natural_id, deleted, import_id, update_import_id, created, updated) VALUES
  (-1, -1, 'Preload School -1', 'natural_id-1', 0, -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000');

INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id, created, updated) VALUES
  (-11, '(SBAC)SBAC-IAB-ASMT TEST-11', 1, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', 0, -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000');

INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, difficulty_code, max_points, math_practice, allow_calc, position) VALUES
  (-9,   8, 1, '200-2019',  -11, 1, -0.23, 'E', 2, null, 0, 1),
  (-8,   8, 1, '200-2018',  -11, 1, -0.23, 'E', 2, null, 0, 2),
  (-7,   8, 1, '200-2017',  -11, 1, -0.23, 'E', 2, null, 0, 3),
  (-6,   8, 1, '200-2016',  -11, 1, -0.23, 'E', 2, null, 0, 4);

INSERT INTO item_common_core_standard(item_id, common_core_standard_id) values
  (-9, 1),
  (-9, 2),
  (-8, 3);

INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                     lep_exit_at, birthday, import_id, update_import_id, deleted, created, updated) VALUES
  (-11, '11', 'LastName-preload', 'FirstName-preload', 'MiddleName-preload', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -5000, -5000, 0, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000');

INSERT INTO  exam ( id, type_id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
                    administration_condition_id, session_id, performance_level, scale_score, scale_score_std_err, completed_at,
                    import_id, update_import_id, deleted, created, updated,
                    grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
                    migrant_status, eng_prof_lvl, t3_program_type, language_id, prim_disability_type) VALUES
  (-87, 1, 2016, -11,  null, 1, 1, 1, 'session', 1, null, null, '2016-08-14', -5000, -5000, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 0, null),
  (-86, 2, 2016, -11,  null, 1, 1, 1, 'session', 1, null, null, '2016-08-14', -5000, -5000, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 0, null),
  (-85, 1, 2016, -11,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -5000, -5000, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 0, null);

INSERT INTO exam_available_accommodation (exam_id, accommodation_id) VALUES
  (-87, -98),
  (-86, -98),
  (-85, -98);

INSERT INTO exam_item (id, exam_id, item_id, score, score_status, response, position) VALUES
  (-5, -87,  -6, -1, 'SCORED', null, 16),
  (-6, -85,  -6, -1, 'SCORED', null, 16),
  (-7, -86,  -6, -1, 'SCORED', null, 16);

INSERT INTO exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
  (-2, -87, 1, 2014, 0.19, 1),
  (-3, -86, 1, 2014, 0.19, 1),
  (-4, -85, 1, 2014, 0.19, 1);
