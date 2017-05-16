-- ------------------------------------------ School/Districts --------------------------------------------------------------------------------------------------
INSERT INTO staging_test.staging_district (id, name, natural_id, migrate_id) VALUES
  (-99, 'Sample District -99', 'natural_id-99', -99);

INSERT INTO staging_test.staging_district (id, name, natural_id, migrate_id) VALUES
  (-98, 'Sample District -98', 'natural_id-98', -99);

INSERT INTO staging_test.staging_school (id, district_id, name, natural_id, deleted, migrate_id, import_id) VALUES
  (-99, -99, 'Sample School -99', 'natural_id-99', 0, -99, -1);

INSERT INTO staging_test.staging_school (id, district_id, name, natural_id, deleted, migrate_id, import_id) VALUES
  (-98, -98, 'Sample School -98', 'natural_id-98', 0, -99, -1);

-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------

INSERT INTO staging_test.staging_asmt (id, natural_id, grade_id, type_id, subject_id, school_year, name, label, version, deleted, migrate_id, import_id) VALUES
   (-99, '(SBAC)SBAC-IAB-ASMT TEST', -99, 2, 1, 2016, 'SBAC-IAB-FIXED-G4M-OA-MATH-4', 'MTH IAB G4 OperationsAlgebraicThinking', '9835', 0, -99, -1),
   (-98, 'SBAC)SBAC-ICA-ASMT TEST', -98, 1, 2, 2016, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 'Grade 5 ELA', '9831', 0, -99, -1);

INSERT INTO staging_test.staging_asmt_score (asmt_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, migrate_id) VALUES
  (-99, 2442, 2502, 2582, 2201, 2701, -99),
  (-98, 2442, 2502, 2582, 2201, 2701, -99);

INSERT INTO staging_test.staging_item (id, claim_id, target_id, natural_id, asmt_id, dok_id, difficulty, max_points, math_practice, allow_calc, migrate_id) VALUES
  (-990, -99, null, '200-2010',  -99, -99, -0.23, 2, -99, 0, -99),
  (-991, -99, null, '200-18943', -99, -99, -0.13, 2, -98, 0, -99),
  (-992, -99, null, '200-8906',  -99, -99, -0.03, 2, -99, 1, -99),
  (-993, -99, null, '200-2014',  -99, -98,  1.23, 2, -98, 1, -99),

  (-980, -98, null, '200-60347', -98, -98, -0.32, 1, null, null, -99),
  (-981, -98, null, '200-51719', -98, -98, -1.32, 1, null, null, -99),
  (-982, -98, null, '200-59217', -98, -98, -2.32, 1, null, null, -99),
  (-983, -98, null, '200-59208', -98, -98, -0.32, 1, null, null, -99),
  (-984, -98, null, '200-30901', -98, -98, -0.32, 1, null, null, -99);
