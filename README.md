## RDW_Ingest
RDW ingest applications:
1. Exam Service - RESTful API for submitting test results, aka exams.

#### Building
RDW_Ingest apps make use of RDW_Common modules. Because there is no common artifact repository, you must do something
to make the artifacts available. You could make an uber project in your IDE. Or you could build common locally:
```bash
git clone https://github.com/SmarterApp/RDW_Common
cd RDW_Common
git checkout develop
./gradlew build install
```

RDW_Ingest depends on the database being configured properly. This is done using RDW_Schema.
```bash
git clone https://github.com/SmarterApp/RDW_Schema
cd RDW_Schema
git checkout develop
cd warehouse
../scripts/migrate
```

Now you should be able to build and test the ingest apps:
```bash
git clone https://github.com/SmarterApp/RDW_Ingest
cd RDW_Ingest
git checkout develop
gradle build
```
Code coverage report can be found at `./build/reports/jacoco/test/html/index.html` 


#### Running
The apps are wrapped in docker containers and should be built and run that way. 

First, we need to get rabbitmq running in a container.  Stop rabbitmq if it is running natively and start a 
containerized version (map ports directly for convenience). NOTE: if the rabbitmq container is already created 
you can simply do `docker start rabbitmq`.
```bash
rabbitmqctl stop
docker run -d --hostname rabbitmq --name rabbitmq -p :15672:15672 -p :5672:5672 rabbitmq:3-management
```

Currently, building the images is not part of the build task so do that and verify images are created:
```bash
$ gradle buildImage
$ docker images
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
fwsbac/rdw-exam-service                 latest              fc700c6e8518        14 minutes ago      131 MB
fwsbac/rdw-exam-processor               latest              cf83654e781f        9 seconds ago       130 MB
rabbitmq                                3-management        cda8025c010b        3 weeks ago         179 MB
java                                    8-jre-alpine        d85b17c6762e        6 weeks ago         108 MB
```

Now you can run the containers, linking rabbitmq and specifying the port mappings.
Currently the exam processor just logs results so tail the log to see stuff happening.
```bash
docker run -d -p :8080:8080 --name exam-service --link rabbitmq:rabbitmq fwsbac/rdw-exam-service --spring.rabbitmq.host=rabbitmq
docker run -d -p :8081:8080 --name exam-processor --link rabbitmq:rabbitmq fwsbac/rdw-exam-processor --spring.rabbitmq.host=rabbitmq
docker logs -f exam-processor
```

You can use a REST client to hit end-points, e.g.
```text
POST /exams/imports  with an XML payload should return an import request payload
GET /exams/imports/:id   should return a mock import request payload (unless id starts with 'a')
```
You will need valid credentials and connectivity to our SSO OAuth2 server. 


#### Running Standalone
It is not the recommended approach but the artifacts are Spring Boot executable jars so you can just run them, e.g.:
```bash
java -jar exam-service/build/libs/exam-service-0.0.1-SNAPSHOT.jar --server.port=8080
java -jar exam-processor/build/libs/exam-processor-0.0.1-SNAPSHOT.jar --server.port=8081
```

All the ingest apps work with a message broker, currently RabbitMQ. So RabbitMQ must be running; you can use the
docker rabbitmq if the ports are mapped directly or run it natively, for mac folks:
```bash
rabbitmq-server -detached
```
