-- CLEAN UP staging
DElETE FROM `staging-test`.staging_school where id in ( -99, -98);
DElETE FROM `staging-test`.staging_district where id in ( -99, -98);

DElETE FROM `staging-test`.staging_item where id in ( -990, -991, -992, -993, -980, -981, -982, -983, -984);
DElETE FROM `staging-test`.staging_asmt_score where asmt_id in ( -99, -98);
DElETE FROM `staging-test`.staging_asmt where id in ( -99, -98);

-- CLEAN UP reporting
DElETE FROM `reporting-test`.school where id in ( -99, -98);
DElETE FROM `reporting-test`.district where id in ( -99, -98);

DElETE FROM `reporting-test`.item where id in ( -990, -991, -992, -993, -980, -981, -982, -983, -984);
DElETE FROM `reporting-test`.asmt_score where asmt_id in ( -99, -98);
DElETE FROM `reporting-test`.asmt where id in ( -99, -98);

