### Overview
"Migrate reporting" service moves data from the warehouse to the reporting database.

The process is controlled by the `warehouse.import` table and the `reporting.migrate` table.
The service pulls data in two steps, first from `warehouse` to `staging`, and then from `staging` to `reporting`.

The migration process is scheduled to run periodically on service start up. In each period, data is processed
in batches until there is no full batch remaining. A batch is defined by a continuous sequence of import ids
with status 1 (PROCESSED). 

The service start up parameters that are worth noting:
- ```--migrate.batch.delay=300000``` - a sleep time time in milliseconds.
- ```--migrate.batch.size=1000``` - a number of import ids migrated in one chunk/iteration.

The service is not built to be horizontally scalable. Starting more than one migrate reporting service will cause a failure.

### Maintenance Guidelines

The migrate service is controlled via the status end-point which is natively served on port 8008. 
This end-point is not publicly available and is accessed via deployment orchestration. For example, 
in kubernetes port-forwarding can be used.

#### Pausing the service
Pausing will temporarily suspend the migrate task which may be desired during the maintenance downtime.
```bash
$ curl -X POST http://migrate-reporting/pause
```
####  Restarting the service
Restarting will resume a previously paused task.
```bash
$ curl -X POST http://migrate-reporting/resume
```

##### Check the current service status
```bash
$ curl http://migrate-reporting/status
{
  "statusText": "Warning",
  "statusRating": 2,
  "level": 0,
  "dateTime": "2017-06-13T15:10:46.925+0000",
  "migrate-reporting-job": {
    "statusText": "Warning",
    "statusRating": 2,
    "lifecycle": "paused,enabled"
  }
}
```

### Troubleshooting Guide

####  Disabled service 

The migrate reporting service will disable itself if there is an error during processing. You can see this by
getting the service status or analyzing the logs.

####  Finding the cause of the failure
To research the cause of the service failure:
- check the status and message in the `reporting.migrate` table:
```sql
mysql> select * from reporting.migrate order by id desc limit 1;
```
-- review the service logs for error messages.

##### Blocked Migrate
A migrate job could be blocked by an import in the `warehouse`. The records are migrated in chunks of a sequential import ids.
If a chunk has at least one import that stays in the status 0 for a long time, the migrate will be blocked at that record and
will disable itself.

##### Unexpected failure
- if a message in the migrate table does not provide enough data for the cause of the failure, check the `spring_batch_reporting` db:
```sql
mysql> SELECT be.* FROM reporting.migrate m JOIN spring_batch_reporting.BATCH_JOB_EXECUTION be ON be.JOB_INSTANCE_ID = m.job_id WHERE m.id = 124
```
- if you see any failed SQLs in the logs, you can manually analyze the data in the `staging` db. 
Data in the `staging` schema will be left at the state of the failure. You do not need to worry about cleaning this data, the system will do it automatically on the restart.

####  Restarting the disabled service
Once the cause of the problem has been resolved the service can be enabled by adjusting the status of the most recent migrate task in the 
reporting database. Connect with your favorite SQL client using a write-enabled account and change the status
to -10 setting a message to explain.

```sql
mysql> select * from reporting.migrate order by id desc limit 1;
+------+--------+--------+-----------------+----------------+----------------------------+----------------------------+---------+
| id   | job_id | status | first_import_id | last_import_id | created                    | updated                    | message |
+------+--------+--------+-----------------+----------------+----------------------------+----------------------------+---------+
| 1443 |   1443 |    -20 |         1434005 |        1435004 | 2017-06-13 14:31:57.582819 | 2017-06-13 14:34:00.395498 | NULL    |
+------+--------+--------+-----------------+----------------+----------------------------+----------------------------+---------+
1 row in set (0.04 sec)

mysql> update reporting.migrate set status=-10, message='manually abandoned, fixed problem' where id=1443;
```

 

			 