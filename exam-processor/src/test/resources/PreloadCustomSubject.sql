
INSERT INTO subject(id, code) VALUES (-1, 'Custom');

INSERT INTO subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count) VALUES
  (1, -1, 10, 3, 6);

INSERT INTO subject_claim_score (id, subject_id, asmt_type_id, code, name, display_order) VALUES
  (-1,  -1, 1, 'Score1', 'Score1 Name', 1) ,
  (-2,  -1, 1, 'Score2', 'Score2 Name', 2),
  (-3,  -1, 1, 'Score3', 'Score3 Name', 3),
  (-4,  -1, 1, 'Score4', 'Score4 Name', 4),
  (-5,  -1, 1, 'Score5', 'Score5 Name', 5),
  (-6,  -1, 1, 'Score6', 'Score6 Name', 6);

INSERT INTO claim (id, subject_id, code, name, description) VALUES
  (-1, -1, 'ClaimCode1', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-2, -1, 'ClaimCode2', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-3, -1, 'ClaimCode3', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-4, -1, 'ClaimCode4', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-5, -1, 'ClaimCode5', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-6, -1, 'ClaimCode6', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-7, -1, 'ClaimCode7', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-8, -1, 'ClaimCode8', 'ClaimCode1 Name', 'ClaimCode1 Description'),
  (-9, -1, 'ClaimCode9', 'ClaimCode1 Name', 'ClaimCode1 Description');

INSERT INTO target (id, claim_id, natural_id, code, description) VALUES
(-1,-1,'Target1','F','Algebra: Perform arithmetic operations on polynomials.'),
(-2,-2,'Target2','X','Algebra: Understand the relationship between zeros and factors of polynomials.'),
(-3,-3,'Target3','XX','Algebra: Use polynomial identities to solve problems.'),
(-4,-4,'Target4','XXX','Algebra: Rewrite rational expressions.'),
(-5,-5,'Target5','G','Algebra: Create equations that describe numbers or relationships'),
(-6,-6,'Target6','H','Algebra: Understand solving equations as a process of reasoning and explain the reasoning.'),
(-7,-7,'Target7','I','Algebra: Solve equations and inequalities in one variable.'),
(-8,-8,'Target8','J','Algebra: Represent and solve equations and inequalities graphically.'),
(-9,-9,'Target9','X','Algebra: Solve systems of equations.'),
(-10,-1,'Target10','D','Algebra: Interpret the structure of expressions.'),
(-11,-2,'Target11','E','Algebra: Write expressions in equivalent forms to solve problems.');

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