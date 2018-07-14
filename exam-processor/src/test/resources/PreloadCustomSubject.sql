
INSERT INTO subject(id, code, import_id, update_import_id) VALUES (-1, 'Custom', 1, 1);

INSERT INTO subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count) VALUES
  (1, -1, 10, 3, 6);

INSERT INTO subject_claim_score (id, subject_id, asmt_type_id, code, display_order) VALUES
  (-1,  -1, 1, 'Score1', 1) ,
  (-2,  -1, 1, 'Score2', 2),
  (-3,  -1, 1, 'Score3', 3),
  (-4,  -1, 1, 'Score4', 4),
  (-5,  -1, 1, 'Score5', 5),
  (-6,  -1, 1, 'Score6', 6);

INSERT INTO claim (id, subject_id, code) VALUES
  (-1, -1, 'ClaimCode1'),
  (-2, -1, 'ClaimCode2'),
  (-3, -1, 'ClaimCode3'),
  (-4, -1, 'ClaimCode4'),
  (-5, -1, 'ClaimCode5'),
  (-6, -1, 'ClaimCode6'),
  (-7, -1, 'ClaimCode7'),
  (-8, -1, 'ClaimCode8'),
  (-9, -1, 'ClaimCode9');

INSERT INTO target (id, claim_id, natural_id) VALUES
(-1,-1,'Target1'),
(-2,-2,'Target2'),
(-3,-3,'Target3'),
(-4,-4,'Target4'),
(-5,-5,'Target5'),
(-6,-6,'Target6'),
(-7,-7,'Target7'),
(-8,-8,'Target8'),
(-9,-9,'Target9'),
(-10,-1,'Target10'),
(-11,-2,'Target11');

INSERT INTO asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, import_id, update_import_id, deleted) VALUES
  (-1, 'Custom-Subject-ICA-2016-2017', 4, 1, -1, 2016, 'Custom-Subject-ICA', 'SBAC-IAB-FIXED-G4M-G-MATH-4', NULL, -1, -1, 0);

INSERT INTO item (id, claim_id, target_id, natural_id, asmt_id, math_practice, allow_calc, dok_id, difficulty_code, difficulty, max_points, position) VALUES
  (-1,  -1, -1, '200-30', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-2,  -2, -2, '200-40', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-3,  -3, -3, '200-50', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-4,  -4, -4, '200-60', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-5,  -5, -5, '200-70', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-6,  -6, -6, '200-80', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-7,  -7, -7, '200-90', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-8,  -8, -8, '200-100', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-9,  -9, -9, '200-110', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-10, -1, -10,'200-120', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL),
  (-11, -2, -11, '200-130', -1, NULL, NULL, 1, 'D', 0.5, 5, NULL);