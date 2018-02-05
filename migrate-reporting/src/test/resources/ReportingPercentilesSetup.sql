
-- ------------------------------------------ Asmt ---------------------------------------------------------------------------------------------------------
INSERT INTO asmt (id, natural_id, grade_id, grade_code, type_id, subject_id, school_year, name, label, version, update_import_id, cut_point_1, cut_point_2, cut_point_3, min_score, max_score, updated, migrate_id) VALUES
   (-11, '(SBAC)SBAC-IAB-ASMT TEST-11', -98, '98', 2, 1, 1999, 'SBAC-IAB-FIXED-G4M-OA-MATH-4',     'test',          '9835', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1),
   (-98, 'SBAC)SBAC-ICA-ASMT TEST',     -98, '98', 1, 1, 1999, 'SBAC-ICA-FIXED-G5E-COMBINED-2017', 'Grade 5 ELA',   '9835', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1),
   (-97, 'SBAC)SBAC-ICA-ASMT TEST-2',   -98, '98', 1, 2, 1999, 'SBAC-ICA-FIXED-G5E-COMNED-2017-2', 'Grade 5 ELA-2', '9835', -1, 2442, 2502, 2582, 2201, 2701, '2017-07-18 20:14:34.000000', -1);

-- ------------------------------------------ Percentiles --------------------------------------------------------------------------------------------------
-- 89  -- to be updated
-- 88  -- to be modified
-- 87  -- insert not in reporting yet

INSERT INTO percentile (id, asmt_id, start_date, end_date, count, mean, standard_deviation, min_score, max_score, update_import_id, updated, migrate_id) VALUES
  (-89, -11, '2018-01-01', '2018-03-31', 835430, 2420.1, 88.9, 1000, 3000, -99, '2017-07-18 19:05:34.966000', -99),
  (-88, -98, '2018-01-01', '2018-03-31', 843395, 2461, 93.8, 1111, 4444, -99, '2017-07-18 19:05:34.966000', -99);

INSERT INTO percentile_score (percentile_id, percentile_rank, score, min_inclusive, max_exclusive) VALUES
  (-89, 25, 2278, 1000, 2420),(-89, 50, 2420, 2420, 2566),(-89, 75, 2566, 2566, 3000),
  (-88, 25, 2307, 1010, 2464),(-88, 50, 2464, 2464, 2612),(-88, 75, 2612, 2612, 4040);