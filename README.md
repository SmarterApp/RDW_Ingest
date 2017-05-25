## RDW_Ingest
RDW ingest applications:
1. Import Service - RESTful API for submitting test results (exams), packages, etc.
1. Exam Processor - Spring Cloud Stream application for processing test results.
1. Package Processor - Spring Cloud Stream application for processing Assessment Packages.
1. Task Service - Spring Boot application for running scheduled tasks.
1. Migrate Reporting - Spring Boot application for migrating data from the warehouse to the reporting data mart.

RDW Ingest uses other processes:
1. MySQL - warehouse and reporting databases
1. RabbitMQ - message queue
1. Configuration Server - centralized Spring configuration server
1. OpenAM - centralized auth server
1. ART - Administration and Registration Tools

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

The applications depend on the database being configured properly. See instructions below under [Running](#running)


### Cloning
This project has a RDW_Schema as a submodule, so when cloning use the recursive flag:
```bash
git clone --recursive https://github.com/SmarterApp/RDW_Ingest
```

### Building
RDW_Ingest apps make use of RDW_Common modules. Because there is no common artifact repository, you must do something
to make the artifacts available. You could make an uber project in your IDE. Or you could build common locally:
```bash
git clone https://github.com/SmarterApp/RDW_Common
cd RDW_Common
git checkout develop
./gradlew install
```

Now you should be able to build and test the ingest apps from where you cloned this project:
```bash
cd RDW_Ingest
git checkout develop
./gradlew build
or to also run Integration Tests
./gradlew build IT 
```
Code coverage reports can be found in each project under `./build/reports/jacoco/test/html/index.html` 

You must explicitly build the docker images:
```bash
$ gradle buildImage
$ docker images
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
fwsbac/rdw-ingest-import-service        latest              fc700c6e8518        14 minutes ago      131 MB
fwsbac/rdw-ingest-exam-processor        latest              cf83654e781f        9 seconds ago       130 MB
rabbitmq                                3-management        cda8025c010b        3 weeks ago         179 MB
java                                    8-jre-alpine        d85b17c6762e        6 weeks ago         108 MB
```

### Running
The applications depend on the database being configured properly. This project has the RDW_Schema submodule pinned at a
version that is compatible with the current version of this project, so there is no need to separately clone the RDW_Schema.
```bash
cd RDW_Schema
./gradlew migrateAll
or to completely clean out any existing data you might have, if you already have the database set up:
./gradlew cleanAllTest migrateAllTest
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
fwsbac/rdw-ingest-import-service    latest              ad78b95ae39f        2 minutes ago       140 MB
<none>                              <none>              13b96a973d59        About an hour ago   140 MB
<none>                              <none>              cb5063cbcc56        2 hours ago         140 MB
<none>                              <none>              2236259b73f0        3 hours ago         140 MB
fwsbac/rdw-ingest-exam-processor    latest              293d8744377d        3 hours ago         132 MB
<none>                              <none>              bdae5c1151d5        24 hours ago        140 MB
<none>                              <none>              233d2f87c185        24 hours ago        132 MB
```
These can be quickly cleaned up:
```bash
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

### Documentation TODO
* Make README.md more user-facing
* Make a CHANGE_LOG file