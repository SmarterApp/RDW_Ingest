-- ------------------------ Preload  entities into warehouse  -------------------------------------------------------------------------------------------------------
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

INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id, created, updated) VALUES
  (-11, '(SBAC)SBAC-IAB-ASMT TEST-11', -98, 2, 1, 1999, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', 0, -5000, -5000, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-99, '(SBAC)SBAC-IAB-ASMT TEST', -99, 2, 1, 1999, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'MTH IAB G4 OperationsAlgebraicThinking', '9835', 1, -5000, -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-98, 'SBAC)SBAC-ICA-ASMT TEST', -98, 1, 2, 1999, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 'Grade 5 ELA', '9831', 0, -20, -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-97, 'SBAC)SBAC-ICA-ASMT TEST-2', -98, 1, 2, 1999, 'SBAC-ICA-FIXED-G5E-COMBINED-2017-2', 'Grade 5 ELA-2', '9831', 0, -20, -20, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, difficulty_code, max_points, math_practice, allow_calc, position,
                field_test, active, type, options_count, answer_key, performance_task_writing_type ) VALUES
  (-9,   -99, -98, '200-2019',  -11, -99, -0.23, 'E', 2, -99, 0, 1, null, null, null, null, null, null),
  (-8,   -99, -98, '200-2018',  -11, -99, -0.23, 'E', 2, -99, 0, 2, null, null, null, null, null, null),
  (-7,   -99, -98, '200-2017',  -11, -99, -0.23, 'E', 2, -99, 0, 3, null, null, null, null, null, null),
  (-6,   -99, -98, '200-2016',  -11, -99, -0.23, 'E', 2, -99, 0, 4, null, null, null, null, null, null),
  (-990, -99, -99, '200-2010',  -99, -99, -0.23, 'E',  2, -99, 0, 4, null, null, null, null, null, null),
  (-991, -99, -99, '200-18943', -99, -99, -0.13, 'E', 2, -98, 0, 3, false, true, 1, 0, 'key', 'Narrative'),
  (-992, -99, -99, '200-8906',  -99, -99, -0.03, 'E', 2, -99, 1, 2, false, true, 1, 0, 'key', 'Informational'),
  (-993, -99, -99, '200-2014',  -99, -98,  1.23, 'D', 2, -98, 1, 1, false, true, 1, 0, 'key', 'Explanatory'),
  (-980, -98, -98, '200-60347', -98, -98, -0.32, 'E', 1, null, null, 5, false, true, 1, 0, 'key', 'Opinion'),
  (-981, -98, -98, '200-51719', -98, -98, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key', 'Opinion'),
  (-982, -98, -98, '200-59217', -98, -98, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key', 'Argumentative'),
  (-983, -98, -98, '200-59208', -98, -98, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key', 'Argumentative'),
  (-984, -98, -98, '200-30901', -98, -98, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key', 'Argumentative');

  INSERT INTO item_common_core_standard(item_id, common_core_standard_id) values
  (-9, -98),
  (-9, -99),
  (-8, -98),
  (-990, -98),
  (-990, -99),
  (-980, -98);

INSERT INTO asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701),
  (-98, 2442, 2502, 2582, 2201, 2701);


INSERT INTO item_other_target(item_id, target_id) values
  (-990, -98),
  (-990, -99),
  (-980, -98);


INSERT INTO percentile (id, asmt_id, start_date, end_date, count, mean, standard_deviation, min_score, max_score, import_id, update_import_id, created, updated)
VALUES
  (-89, -99, '2018-01-01', '2018-03-31', 835430, 2420.1, 88.9, 0, 9999, -99, -99, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-88, -98, '2018-01-01', '2018-03-31', 843395, 2461, 93.8, 1111, 4444, -99, -99, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-87, -97, '2018-01-01', '2018-03-31', 843395, 2467, NULL, 1500, 3500, -99, -99, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO percentile_score (percentile_id, percentile_rank, score, min_inclusive, max_exclusive)
VALUES (-89, 5, 2278, 0, 2303), (-89, 10, 2303, 2303, 2322), (-89, 15, 2322, 2322, 2338), (-89, 20, 2338, 2338, 2354),
  (-89, 25, 2354, 2354, 2368), (-89, 30, 2368, 2368, 2382), (-89, 35, 2382, 2382, 2395), (-89, 40, 2395, 2395, 2408),
  (-89, 45, 2408, 2408, 2420), (-89, 50, 2420, 2420, 2433), (-89, 55, 2433, 2433, 2445), (-89, 60, 2445, 2445, 2458),
  (-89, 65, 2458, 2458, 2471), (-89, 70, 2471, 2471, 2485), (-89, 75, 2485, 2485, 2500), (-89, 80, 2500, 2500, 2517),
  (-89, 85, 2517, 2517, 2538), (-89, 90, 2538, 2538, 2566), (-89, 95, 2566, 2566, 9999),
  (-88, 5, 2307, 1111, 2335),
  (-88, 10, 2335, 2335, 2356), (-88, 15, 2356, 2356, 2375), (-88, 20, 2375, 2375, 2392), (-88, 25, 2392, 2392, 2408),
  (-88, 30, 2408, 2408, 2422), (-88, 35, 2422, 2422, 2436), (-88, 40, 2436, 2436, 2450), (-88, 45, 2450, 2450, 2464),
  (-88, 50, 2464, 2464, 2477), (-88, 55, 2477, 2477, 2490), (-88, 60, 2490, 2490, 2503), (-88, 65, 2503, 2503, 2516),
  (-88, 70, 2516, 2516, 2530), (-88, 75, 2530, 2530, 2545), (-88, 80, 2545, 2545, 2562), (-88, 85, 2562, 2562, 2583),
  (-88, 90, 2583, 2583, 2612), (-88, 95, 2612, 2612, 4444),
  (-87, 5, 2345, 1500, 2375), (-87, 10, 2375, 2375, 2397),
  (-87, 15, 2397, 2397, 2415), (-87, 20, 2415, 2415, 2432), (-87, 25, 2432, 2432, 2448), (-87, 30, 2448, 2448, 2463),
  (-87, 35, 2463, 2463, 2477), (-87, 40, 2477, 2477, 2491), (-87, 45, 2491, 2491, 2504), (-87, 50, 2504, 2504, 2517),
  (-87, 55, 2517, 2517, 2530), (-87, 60, 2530, 2530, 2543), (-87, 65, 2543, 2543, 2556), (-87, 70, 2556, 2556, 2570),
  (-87, 75, 2570, 2570, 2584), (-87, 80, 2584, 2584, 2601), (-87, 85, 2601, 2601, 2621), (-87, 90, 2621, 2621, 2651),
  (-87, 95, 2651, 2651, 3500);



INSERT INTO student (id, ssid, last_or_surname, first_name, middle_name, gender_id, first_entry_into_us_school_at, lep_entry_at,
                                    lep_exit_at, birthday, inferred_school_id, import_id, update_import_id, deleted, created, updated) VALUES
  (-11, '11', 'LastName-preload', 'FirstName-preload', 'MiddleName-preload', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, -5000, -5000, 0, '2017-05-18 19:05:33.967000', '2017-05-18 20:06:34.966000'),
  (-89, '89', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, -5000, -89, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:00.966000'),
  (-88, '88', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', null, -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000'),
  (-87, '87', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, -87, -87, 0, '2017-07-18 19:09:33.966000', '2017-07-18 19:09:33.966000'),
  (-86, '86', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1,  -86, -86, 0, '2017-07-18 19:09:3.966000', '2017-07-18 19:09:33.966000'),
  (-33, '33', 'LastName2', 'FirstName2', 'MiddleName2', -98, '2012-08-14', '2012-11-13', null, '2000-01-01', -1, 2000, 2000, 0, '2017-07-18 20:16:33.966000', '2017-07-18 20:16:33.966000');

INSERT INTO student_ethnicity(student_id, ethnicity_id) values
  (-89,  -99),
  (-88,  -98),
  (-87,  -98),
  (-86,  -98),
  (-86,  -99);

-- student_group added at import -5000 and deleted at import -79
INSERT INTO student_group (id, creator, school_id, school_year, name, subject_id, import_id, update_import_id, active, deleted, created, updated) VALUES
  (-91, 'dwtest@example.com', -99, 1999, 'Test Student Group 9 - updated school', null, -5000, -79, 1, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:10:34.966000'),
  (-8, 'dwtest@example.com', -1, 1999, 'Test Student Group 8', null, -79, -79, 1, 0, '2017-07-18 19:10:34.966000', '2017-07-18 19:10:34.966000'),
  (-7, 'dwtest@example.com', -1, 1999, 'Test Student Group 7', null, -79, -79, 1, 0, '2017-07-18 19:10:34.966000', '2017-07-18 20:16:33.966000');

INSERT INTO student_group_membership (student_group_id, student_id) VALUES
  (-91, -89),
  (-91, -88),
  (-91, -87),
  (-91, -86),
  (-8, -87),
  (-7, -87),
  (-7, -86),
  (-7, -33);

INSERT INTO user_student_group (student_group_id, user_login) VALUES
  (-91, 'dwtest@example.com-91'),
  (-8, 'dwtest@example.com-8'),
  (-7, 'dwtest@example.com-7'),
  (-91, 'dwtest@example.com-91-2');

INSERT INTO  exam ( id, type_id, school_year, asmt_id, asmt_version, opportunity, completeness_id,
                    administration_condition_id, session_id, performance_level, scale_score, scale_score_std_err, completed_at,
                    import_id, update_import_id, deleted, created, updated,
                    grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage,
                    migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) VALUES
  (-88, 1, 1999, -99,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -5000, -88, 1, '2017-05-18 19:05:33.967000', '2017-07-18 19:06:07.966000', -98, -89, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-87, 1, 1999, -11,  null, 1, 1, 1, 'session', 1, null, null, '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-86, 2, 1999, -11,  null, 1, 1, 1, 'session', 1, null, null, '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null),
  (-85, 1, 1999, -11,  null, 1, 1, 1, 'session', 1, 2145, 0.17, '2016-08-14', -88, -88, 0, '2017-07-18 19:06:07.966000', '2017-07-18 19:06:07.966000', -98, -11, -1, 1, 1, 0, 0, 1, 'eng_prof_lvl', 't3_program_type', 'eng', null);

INSERT INTO exam_available_accommodation (exam_id, accommodation_id) VALUES
  (-88, -98),
  (-88, -99),
  (-87, -98),
  (-86, -98),
  (-85, -98);

INSERT INTO exam_item (id, exam_id, item_id, score, score_status, response, position) VALUES
  (-1, -88,  -9, 1, 'SCORED', '<response><math xmlns="http://www.w3.org/1998/Math/MathML" title="10"><mstyle><mn>10</mn></mstyle></math></response>', 1),
  (-2, -88,  -8, 1, 'SCORED', 'D', 2),
  (-3, -88,  -7, 0, 'SCORED', 'C', 3),
  (-4, -88,  -6, -1, 'SCORED', null, 16),
  (-5, -87,  -6, -1, 'SCORED', null, 16),
  (-6, -85,  -6, -1, 'SCORED', null, 16),
  (-7, -86,  -6, -1, 'SCORED', null, 16);

INSERT INTO exam_claim_score (id, exam_id, subject_claim_score_id, scale_score, scale_score_std_err, category) VALUES
   (-1, -88, 1, 2014, 0.19, 1),
   (-2, -87, 1, 2014, 0.19, 1),
   (-3, -86, 1, 2014, 0.19, 1),
   (-4, -85, 1, 2014, 0.19, 1);