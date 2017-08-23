INSERT INTO upload_student_group (batch_id, name, school_year, school_natural_id, school_id, student_ssid, student_id) VALUES
  -- Existing Student
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, '88', -88),
  -- No student
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, null, null),
  -- Unknown students
  (33, 'Test Student Group 7', 2017, 'natural_id-98', -98, 'unknown_student1', null),
  (33, 'Test Student Group 7', 2017, 'natural_id-98', -98, 'unknown_student2', null),
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, 'unknown_student3', null),
  -- Deleted student
  (33, 'Test Student Group 7', 2017, 'natural_id-98', -98, '89', null);