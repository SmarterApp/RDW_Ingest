## RDW_Ingest
RDW ingest applications:
1. Exam Service - RESTful API for submitting test results, aka exams.

#### Building
RDW_Ingest apps make use of RDW_Common modules. 
There is no common artifact repository so you must build common locally:
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
The artifacts are Spring Boot standalone executable jars so you can just run them, e.g.:
```bash
java -jar exam-service/build/libs/exam-service-0.0.1-SNAPSHOT.jar
```


