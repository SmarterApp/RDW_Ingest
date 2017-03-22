## RDW_Ingest
RDW ingest applications:
1. Exam Service - RESTful API for submitting test results, aka exams.
1. Exam Processor - Spring Cloud Stream application for processing test results.

RDW Ingest uses other processes:
1. MySQL - warehouse and reporting databases
1. RabbitMQ - message queue
1. Configuration Server - centralized configuration server

#### MySQL
MySQL is required for building (integration tests) and running these applications. To better match production, MySQL
should be run as a native app outside the container framework . There are various ways to install it; please be sure 
to install version 5.6 which is older and not the default! Here are the basic brew instructions:
```bash
brew update
brew install mysql56
```
You might want to add `/usr/local/Cellar/mysql@5.6/5.6.34/bin` to your path (.bash_profile). Because brew isn't cool 
and directly sets the bind address you must modify `/usr/local/Cellar/mysql@5.6/5.6.34/homebrew.mxcl.mysql@5.6.plist`
and set `--bind-address=*`. You'll need to restart mysql after that, `brew services restart mysql@5.6`. 
_You may need to grant permissions to 'root'@'%', TBD_

The applications depend on the database being configured properly. This is done using RDW_Schema.
```bash
git clone https://github.com/SmarterApp/RDW_Schema
cd RDW_Schema
git checkout develop
cd warehouse
../scripts/migrate
```

### Building
RDW_Ingest apps make use of RDW_Common modules. Because there is no common artifact repository, you must do something
to make the artifacts available. You could make an uber project in your IDE. Or you could build common locally:
```bash
git clone https://github.com/SmarterApp/RDW_Common
cd RDW_Common
git checkout develop
./gradlew build install
```

Now you should be able to build and test the ingest apps:
```bash
git clone https://github.com/SmarterApp/RDW_Ingest
cd RDW_Ingest
git checkout develop
gradle build
```
Code coverage reports can be found in each project under `./build/reports/jacoco/test/html/index.html` 

You must explicitly build the docker images:
```bash
$ gradle buildImage
$ docker images
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
fwsbac/rdw-ingest-exam-service          latest              fc700c6e8518        14 minutes ago      131 MB
fwsbac/rdw-ingest-exam-processor        latest              cf83654e781f        9 seconds ago       130 MB
rabbitmq                                3-management        cda8025c010b        3 weeks ago         179 MB
java                                    8-jre-alpine        d85b17c6762e        6 weeks ago         108 MB
```

### Running
The apps are wrapped in docker containers and should be built and run that way. There is a docker-compose spec
to make it easy: it runs RabbitMQ, the configuration server and all the RDW_Ingest applications. Please read the
comments in the docker-compose script for setting required environment variables. Then invoke docker-compose, e.g.:
```bash
cd docker
docker-compose up -d
docker logs -f docker_exam-service_1
```
To stop a single service, use regular docker commands; to stop them all use docker-compose, e.g.:
```bash
docker stop docker_exam-service_1
docker-compose down
```

You can use a REST client to hit end-points, e.g.
```text
POST /exams/imports  with an XML payload should return an import request payload
GET /exams/imports/:id   should return an import request payload
GET /exams/imports?batch=<batch>&status=<status>  should return a list of imports matching criteria
```

After cycling through some builds you will end up with a number of dangling images, e.g.:
```bash
docker images
REPOSITORY                          TAG                 IMAGE ID            CREATED             SIZE
fwsbac/rdw-ingest-exam-service      latest              ad78b95ae39f        2 minutes ago       140 MB
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