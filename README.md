## RDW_Ingest
RDW ingest applications:
1. Import Service - RESTful API for submitting test results (exams), packages, etc.
1. Exam Processor - Spring Cloud Stream application for processing test results.
1. Package Processor - Spring Cloud Stream application for processing assessment packages.

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

The applications depend on the database being configured properly. This is done using RDW_Schema.
```bash
git clone https://github.com/SmarterApp/RDW_Schema
cd RDW_Schema
git checkout develop
cd warehouse
../scripts/migrate
```

### Building
If you're reading this you might want to build the artifacts from scratch. That's great but know that you can run
the applications using docker images without all the mucking about in source (see `Running` below). That said ...

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
fwsbac/rdw-ingest-import-service        latest              fc700c6e8518        14 minutes ago      131 MB
fwsbac/rdw-ingest-exam-processor        latest              cf83654e781f        9 seconds ago       130 MB
rabbitmq                                3-management        cda8025c010b        3 weeks ago         179 MB
java                                    8-jre-alpine        d85b17c6762e        6 weeks ago         108 MB
```

### Running
The apps are wrapped in docker containers and should be built and run that way. Descriptors can be found for various
environments in RDW_Deployment. For example to run a local docker deployment:
```bash
git clone https://gitlab.com/fairwaytech/RDW_Deployment
cd RDW_Deployment/local-docker
docker-compose -f config.yml -f ingest.yml up -d
```
Please read the comments in the docker scripts for setting required environment variables.

To stop a single service, use regular docker commands; to stop them all use docker-compose, e.g.:
```bash
docker stop docker_import-service_1
docker-compose -f config.yml -f ingest.yml down
```

You can use a REST client to hit end-points, e.g.
```text
POST /exams/imports  with an XML payload should return an import request payload
GET /exams/imports/:id   should return an import request payload
GET /exams/imports?batch=<batch>&status=<status>  should return a list of imports matching criteria
```

### Documentation TODO
* Make a CHANGE_LOG file