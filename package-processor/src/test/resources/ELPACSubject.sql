-- Create entries for ELPAC subject
INSERT INTO subject (id, code, import_id, update_import_id) VALUES
  (11, 'ELPAC', -1, -1);
INSERT INTO subject_asmt_type (subject_id, asmt_type_id, target_report, printed_report) VALUES
  (11, 3, 0, 0);
INSERT INTO subject_asmt_scoring (subject_id, asmt_type_id, score_type_id, min_score, max_score, performance_level_count, performance_level_standard_cutoff) VALUES
  (11, 3, 1, 1150, 1950, 4, 4),
  (11, 3, 2, 1150, 1950, 4, null),
  (11, 3, 3, null, null, 3, null);
INSERT INTO subject_score (subject_id, asmt_type_id, score_type_id, code, display_order, data_order) VALUES
  (11, 3, 2, '1', 1, 1),
  (11, 3, 2, '2', 2, 2),
  (11, 3, 3, '1-L', 1, 1),
  (11, 3, 3, '1-S', 2, 2),
  (11, 3, 3, '2-R', 3, 4),
  (11, 3, 3, '2-W', 4, 5);
