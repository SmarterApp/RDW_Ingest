INSERT INTO upload_student_group (import_id, group_name, school_year, school_natural_id, school_id, student_ssid) VALUES
  -- Existing Student
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', -1, '88'),
  -- No student
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', -1, null),
  -- Unknown students
  (-84, 'Test Student Group 7', 2017, 'natural_id-98', -98, 'unknown_student1'),
  (-84, 'Test Student Group 7', 2017, 'natural_id-98', -98, 'unknown_student2'),
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', -1, 'unknown_student3'),
  -- Deleted student
  (-84, 'Test Student Group 7', 2017, 'natural_id-98', -98, '89');