INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, import_id, update_import_id, created, updated) VALUES
  (-99, '(SBAC)SBAC-IAB-ASMT TEST-5', 5, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-5', 'MTH IAB G5 OperationsAlgebraicThinking', '9835', 1, 1, 1, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-98, '(SBAC)SBAC-ICA-ASMT TEST-8', 8, 1, 2, 2015, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 'Grade 5 ELA', '9831', 0, 1, 1, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-97, '(naturalId)MOCK-ICA-G11-2017-2018', 8, 1, 2, 2018, 'MOCK-ICA-G11-2017-2018', 'Grade 5 ELA', '9831', 0, 1, 1, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-96, '(naturalId)MOCK-IAB-G11M-2017-2018', 8, 1, 2, 2018, 'MOCK-IAB-G11M-2017-2018', 'Grade 5 ELA', '9831', 0, 1, 1, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000'),
  (-95, '(naturalId)MOCK-IAB-G11E-2017-2018', 8, 1, 2, 2018, 'MOCK-IAB-G11E-2017-2018', 'Grade 5 ELA', '9831', 0, 1, 1, '2017-07-18 19:05:34.966000', '2017-07-18 19:05:34.966000');

INSERT INTO asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701),
  (-98, null, 2502, null, 2201, 2701),
  (-97, 2442, 2502, 2582, 2201, 2701),
  (-96, 2442, 2502, 2582, 2201, 2701),
  (-95, 2442, 2502, 2582, 2201, 2701);

INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, difficulty_code, max_points, math_practice, allow_calc, position,
                field_test, active, type, options_count, answer_key) VALUES
  (-990, 1, 2, '200-2010',  -99, 1, -0.23, 'E', 2, 1, 0, 4, false, true, 1, 0, 'key990'),
  (-991, 1, 1, '200-18943', -99, 2, -0.13, 'E', 2, 2, 0, 3, false, true, 1, 0, 'key'),
  (-992, 2, 3, '200-8906',  -99, 3, -0.03, 'E', 2, 3, 1, 2, false, true, 1, 0, 'key'),
  (-993, 3, 2, '200-2014',  -99, 4,  1.23, 'D', 2, 4, 1, 1, false, true, 1, 0, 'key'),
  (-980, 1, 1, '200-60347', -98, 1, -0.32, 'E', 1, null, null, null, null, null, 1, 0, null),
  (-981, 1, 2, '200-51719', -98, 2, -1.32, 'D', 1, null, null, 4, false, true, 1, 0, 'key'),
  (-982, 2, 3, '200-59217', -98, 3, -2.32, 'D', 1, null, null, 3, false, true, 1, 0, 'key'),
  (-983, 3, 4, '200-59208', -98, 4, -0.32, 'D', 1, null, null, 2, false, true, 1, 0, 'key'),
  (-984, 4, 5, '200-30901', -98, 1, -0.32, 'D', 1, null, null, 1, true, false, 2, 8, 'key');

  INSERT INTO item_common_core_standard(item_id, common_core_standard_id) values
  (-990, 1),
  (-990, 2),
  (-980, 3);

INSERT INTO item_other_target(item_id, target_id) values
  (-990, 2),
  (-990, 3),
  (-980, 3),
  (-991, 6);