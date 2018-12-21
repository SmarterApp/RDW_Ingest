INSERT INTO subject (id, code, import_id, update_import_id) VALUES
    (-1, 'test', 1, 1),
    (-2, 'test2', 1, 1);

INSERT INTO subject_asmt_type (asmt_type_id, subject_id, performance_level_count, performance_level_standard_cutoff, claim_score_performance_level_count, target_report) VALUES
  (1, -2, 1, 2, 5, 0),
  (2, -2, 10, 3, 6, 0);
