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

Now you should be able to build the ingest apps:
```bash
git clone https://github.com/SmarterApp/RDW_Ingest
cd RDW_Ingest
git checkout develop
gradle build
```

#### Running Standalone
All the ingest apps work with a message broker, currently RabbitMQ. So RabbitMQ must be running; for mac folks:
```bash
rabbitmq-server -detached
```

The artifacts are Spring Boot standalone executable jars so you can just run them, e.g.:
```bash
java -jar exam-service/build/libs/exam-service-0.0.1-SNAPSHOT.jar
```