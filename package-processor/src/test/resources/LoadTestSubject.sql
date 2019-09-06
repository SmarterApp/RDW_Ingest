INSERT INTO subject (id, code, import_id, update_import_id) VALUES
  (-1, 'test', 1, 1),
  (-2, 'test2', 1, 1);

INSERT INTO subject_asmt_type (subject_id, asmt_type_id, target_report, printed_report) VALUES
  -- for subject test2, there is ICA (1) and IAB (2)
  (-2, 1, 1, 1),
  (-2, 2, 0, 0);

INSERT INTO subject_asmt_scoring (subject_id, asmt_type_id, score_type_id, min_score, max_score, performance_level_count, performance_level_standard_cutoff) VALUES
  -- for subject test2 ICA, there is Overall (1) and Claim (3)
  (-2, 1, 1, 1000, 3500, 2, 1),
  (-2, 1, 3, null, null, 5, null),
  -- for subject test2 IAB, there is Overall
  (-2, 2, 1, null, null, 10, 3);
