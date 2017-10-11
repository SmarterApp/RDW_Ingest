-- add back what initial dml adds
INSERT INTO import (id, status, content, contentType, digest) VALUES
  (1, 1, 3, 'initial load', 'initial load');

-- Delete imports
DELETE FROM import WHERE id IN (-1, -2, -20, -89, -88, -87, -86, -84, -79, -78, -90, -99, -5000, 2000);