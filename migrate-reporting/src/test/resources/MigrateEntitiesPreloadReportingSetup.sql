-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.district (id, name, natural_id) VALUES
  (-99, 'Before Test -99', 'natural_id-99');

INSERT INTO reporting_test.school (id, district_id, name, natural_id, import_id) VALUES
  (-99, -99, 'Before Test -99', 'natural_id-99', -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO reporting_test.asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, import_id) VALUES
   (-99, '(SBAC)SBAC-IAB-ASMT TEST', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'test', '9835', -1);

INSERT INTO reporting_test.asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701);

INSERT INTO reporting_test.item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc) VALUES
  (-9,   -99, null, '200-2010',  -99, -99, -0.23, 2, -99, 0), -- this should be deleted after an update
  (-990, -99, null, '200-2010',  -99, -99, -0.23, 2, -99, 0),
  (-991, -99, null, '200-18943', -99, -99, -0.13, 2, -98, 0),
  (-992, -99, null, '200-8906',  -99, -99, -0.03, 2, -99, 1),
  (-993, -99, null, '200-2014',  -99, -98,  1.23, 2, -98, 1);
