## RDW_Ingest
RDW ingest applications:
1. Import Service - RESTful API for submitting test results (exams), packages, etc.
1. Exam Processor - Spring Cloud Stream application for processing test results.
1. Group Processor - Spring Cloud Stream application for processing student groups.
1. Package Processor - Spring Cloud Stream application for processing Assessment Packages.
1. Task Service - Spring Boot application for running scheduled tasks.
1. Migrate Reporting - Spring Boot application for migrating data from the warehouse to the reporting data mart.

RDW Ingest uses other processes:
1. MySQL - warehouse and reporting databases
1. RabbitMQ - message queue
1. Configuration Server - centralized Spring configuration server
1. OpenAM - centralized auth server
1. ART - Administration and Registration Tools

Additional documentation:
1. [Change log](CHANGELOG.md)
1. [Contributing developer notes](CONTRIBUTING.md)
1. [API](API.md)

#### MySQL
MySQL is required for building (integration tests) and running these applications. To better match production, MySQL
should be run as a native app outside the container framework . There are various ways to install it; please be sure 
to install version 5.6 which is older and not the default! Here are the basic brew instructions:
```bash
brew update
brew install mysql@5.6
```
At the end of the install, there is a suggestion to add the mysql location to the path:
```bash
echo 'export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"' >> ~/.bash_profile
```

Because brew isn't cool and directly sets the bind address you must modify `/usr/local/Cellar/mysql@5.6/5.6.34/homebrew.mxcl.mysql@5.6.plist` 
(make sure to use your minor version of the installation) and set `--bind-address=*`. 
You'll need to restart mysql after that, `brew services restart mysql@5.6`. You may need to fully stop and start
the service if you get a `mysql.sock` error at this point:
```bash
brew services stop mysql@5.6
brew services start mysql@5.6 
```

You may need to grant permissions to 'root'@'%':
```bash
mysql -uroot
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
mysql> exit
```

You should load your timezone info, because we'll be forcing the timezone to 'UTC' in the next step. You may see 
some warnings of skipped files but no errors when you do this:
```bash
mysql_tzinfo_to_sql /usr/share/zoneinfo | sed -e "s/Local time zone must be set--see zic manual page/local/" | mysql -u root mysql
```

Finally, you need to configure MySQL settings in `my.cnf` file. Locate the file (for a brew install it will be
`/usr/local/Cellar/mysql@5.6/5.6.34/my.cnf` but if you can't find it try `sudo find -name my.cnf -print`) 
and add the following lines:
```
[mysqld]
explicit_defaults_for_timestamp=1
default-time-zone='UTC'
```

Restart MySQL:
```bash
brew services restart mysql@5.6
```

To verify the settings, run a mysql client:
```bash
mysql> SELECT @@explicit_defaults_for_timestamp;
+-----------------------------------+
| @@explicit_defaults_for_timestamp |
+-----------------------------------+
|                                 1 |
+-----------------------------------+

mysql> SELECT @@system_time_zone, @@global.time_zone, @@session.time_zone;
+--------------------+--------------------+---------------------+
| @@system_time_zone | @@global.time_zone | @@session.time_zone |
+--------------------+--------------------+---------------------+
| PDT                | UTC                | UTC                 |
+--------------------+--------------------+---------------------+
```

The applications depend on the database schema being created properly. See instructions below under [Running](#running)


### Cloning
```bash
git clone https://github.com/SmarterApp/RDW_Ingest
```

### Building
RDW_Ingest apps make use of RDW_Common modules. If you are developing RDW_Common and would like to test changes in this 
project, you can build RDW_Common locally and install your changes to the local repository:
```bash
git clone https://github.com/SmarterApp/RDW_Common
cd RDW_Common
git checkout develop
//make code changes
./gradlew install
```
Then to use those new changes, you can specify the SNAPSHOT version of RDW_Common
```bash
//In RDW_Ingest
./gradlew build it -Pcommon=1.1.0-SNAPSHOT
```

Now you should be able to build and test the ingest apps from where you cloned this project:
```bash
cd RDW_Ingest
git checkout develop
./gradlew build
or to also run Integration Tests
./gradlew build it 
```

Code coverage reports can be found in each project under `./build/reports/coverage/index.html` after explicitly
generating them using:
```bash
./gradlew coverage
``` 

You must explicitly build the docker images:
```bash
$ gradle buildImage
$ docker images
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
smarterbalanced/rdw-ingest-import-service        latest              fc700c6e8518        14 minutes ago      131 MB
smarterbalanced/rdw-ingest-exam-processor        latest              cf83654e781f        9 seconds ago       130 MB
rabbitmq                                3-management        cda8025c010b        3 weeks ago         179 MB
java                                    8-jre-alpine        d85b17c6762e        6 weeks ago         108 MB
```

### Running
Running the applications locally depends on the local database being configured properly.
```bash
To completely clean out any existing data you might have and start fresh:
./gradlew cleanallprod migrateallprod
or, if you want to use a different version of the schema, say version 1.1.0-68 of RDW_Schema
./gradlew -Pschema=1.1.0-68 cleanallprod migrateallprod
```

The apps are wrapped in docker containers and should be built and run that way. There is a docker-compose spec
to make it easy: it runs RabbitMQ, the configuration server and all the RDW_Ingest applications. Please read the
comments in the docker-compose script for setting required environment variables. Then invoke docker-compose, e.g.:
```bash
cd docker
docker-compose up -d
docker logs -f docker_import-service_1
```
To stop a single service, use regular docker commands; to stop them all use docker-compose, e.g.:
```bash
docker stop docker_import-service_1
docker-compose down
```

After cycling through some builds you will end up with a number of dangling images, e.g.:
```bash
docker images
REPOSITORY                          TAG                 IMAGE ID            CREATED             SIZE
smarterbalanced/rdw-ingest-import-service    latest              ad78b95ae39f        2 minutes ago       140 MB
<none>                              <none>              13b96a973d59        About an hour ago   140 MB
<none>                              <none>              cb5063cbcc56        2 hours ago         140 MB
<none>                              <none>              2236259b73f0        3 hours ago         140 MB
smarterbalanced/rdw-ingest-exam-processor    latest              293d8744377d        3 hours ago         132 MB
<none>                              <none>              bdae5c1151d5        24 hours ago        140 MB
<none>                              <none>              233d2f87c185        24 hours ago        132 MB
```
These can be quickly cleaned up:
```bash
docker container prune 
# reply when prompted to confirm
docker image prune 
# reply when prompted to confirm
```

### Loading Data
To properly load data into the system involves a few steps. The supporting data must be loaded before test results
can be submitted. This includes assessments, accommodations, organization data, and groups. 
1. Get assessment packages in tabulator output. Usually for a given year.
1. Get accessibility codes. This is an XML payload provided by SB.
1. Use the Data Generator to generate sample TRTs and associated organization.json from the assessment package.
1. Load the assessment packages, accommodations and organization data into the system.
1. Load the generated TRTs into the system.
1. Define student groups and user membership. Since the generated test results have student groups specified this 
simply requires associating your favorite user login with one-or-more of those groups.

This assumes you are running the ingest pipeline locally with normal configuration. If you are doing this against
a more production-like environment you'll need to replace the access token and edit submit_xml.sh appropriately.

The data generator project has some sample output for steps 1 and 2 so use that to generate data and load everything
(yes, this is cloning the data generator project but still using the docker image to do the work; if you really want
you can run the data generator directly from source but that is left as an exercise for the reader):
```bash
git clone https://github.com/SmarterApp/RDW_DataGenerator
cd RDW_DataGenerator
docker run -v `pwd`/out:/src/data_generator/out -v `pwd`/in:/src/data_generator/in fwsbac/rdw-datagen --state_type tiny --gen_iab --gen_ica --gen_item --xml_out --pkg_source /src/data_generator/in
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./in/FULL_2016.items.csv" http://localhost:8080/packages/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./in/accommodations.xml" http://localhost:8080/accommodations/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./out/organization.json" http://localhost:8080/organizations/imports
./scripts/submit_xml.sh
```
I usually associate my user login with all the groups from a single school. First i look at distributions, then i
pick a school and add the user to all those groups:
```sql
use reporting;
select * from student_group sg
  join ( select student_group_id, count(*) as cnt from reporting.student_group_membership group by student_group_id order by cnt desc ) size
  on size.student_group_id = sg.id;
# find school that has a few groups in the top 10 then ...
insert into reporting.user_student_group (student_group_id, user_login) 
  SELECT id, 'dwtest@example.com' from reporting.student_group where school_id = 4;
```