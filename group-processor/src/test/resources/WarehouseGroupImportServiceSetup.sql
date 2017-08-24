INSERT INTO upload_student_group (batch_id, group_name, school_year, school_natural_id, school_id, student_ssid, student_id, group_id, group_user_login, subject_id) VALUES
  -- New Groups
  (33, 'New Group 1', 2017, 'natural_id-1', -1, '88', -88, null, null, null),
  (33, 'New Group 1', 2017, 'natural_id-1', -1, '86', -86, null, null, null),
  (33, 'New Group 2', 2017, 'natural_id-98', -98, '88', -88, null, null, null),
  -- Membership change groups
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, '88', -88, -8, null, null),
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, '86', -86, -8, null, null),
  (33, 'Test Student Group 7', 2017, 'natural_id-98', -98, '88', -88, -7, null, null),
  -- User change groups
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, null, null, -8, 'user1@somewhere.com', null),
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, null, null, -8, 'user2@somewhere.com', null),
  (33, 'Test Student Group 7', 2017, 'natural_id-98', -98, null, null, -7, 'user3@somewhere.com', null),
  -- Subject change group
  (33, 'Test Student Group 8', 2017, 'natural_id-1', -1, null, null, -8, null, 1),
  -- Deleted group
  (33, 'Test Student Group 9 - updated school', 2017, 'natural_id-99', -99, null, null, null, null, null);