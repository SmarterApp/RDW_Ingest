INSERT INTO upload_student_group (import_id, group_name, school_year, school_natural_id, school_id, student_ssid, student_id, group_id, group_user_login, subject_code) VALUES
  -- New Groups
  (-84, 'New Group 1', 2017, 'natural_id-1', null, '88', -88, null, null, 'Math'),
  (-84, 'New Group 1', 2017, 'natural_id-1', null, '86', -86, null, null, 'Math'),
  (-84, 'New Group 2', 2017, 'natural_id-98', null, '88', -88, null, null, 'Math'),
  -- Membership change groups
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', null, '88', -88, -8, null, null),
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', null, '86', -86, -8, null, null),
  (-84, 'Test Student Group 7', 2017, 'natural_id-98', null, '88', -88, -7, null, null),
  -- User change groups
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', null, null, null, -8, 'user1@somewhere.com', null),
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', null, null, null, -8, 'user1@somewhere.com', null),
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', null, null, null, -8, 'user2@somewhere.com', null),
  (-84, 'Test Student Group 7', 2017, 'natural_id-98', null, null, null, -7, 'user3@somewhere.com', null),
  -- Subject change group
  (-84, 'Test Student Group 8', 2017, 'natural_id-1', null, null, null, -8, null, 'Math'),
  -- Deleted group
  (-84, 'Test Student Group 9 - updated school', 2017, 'natural_id-99', null, null, null, null, null, null),
  -- Add student to group without students
  (-84, 'No Student Group', 2017, 'natural_id-1', null, '33', -33, -5, null, null),
  -- Remove students from group with students
  (-84, 'Existing Student Group', 2017, 'natural_id-1', null, null, null, -3, null, null),
  -- Add user to group without students
  (-84, 'No User Group', 2017, 'natural_id-1', null, null, null, -4, 'user1@somewhere.com', null),
  -- Remove users from group with users
  (-84, 'Existing User Group', 2017, 'natural_id-1', null, null, null, -2, null, null),

  -- New group with bad school year
  (-78, 'Bad Year', 1718, 'natural_id-1', null, '86', -86, null, null, null),
  (-78, 'Bad Year', 1718, 'natural_id-1', null, '87', -87, null, null, null),
  (-78, 'Bad Year', 1718, 'natural_id-1', null, '88', -88, null, null, null);

