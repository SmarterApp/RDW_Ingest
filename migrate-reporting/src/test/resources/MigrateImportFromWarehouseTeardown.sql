-- Delete completed migration import id's in reporting
DELETE FROM reporting_test.migrate
WHERE id IN (-1, -2);

-- Delete imports
DELETE FROM warehouse_test.import
WHERE id IN (-1000, -999, -998, -997, -996, -995, -994, -993, -992, -991);

