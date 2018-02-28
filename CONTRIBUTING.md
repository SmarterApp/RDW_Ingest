## RDW_Ingest for Developers

This document is targeted at developers contributing to the RDW_Ingest project.

### Coding Conventions

#### Application Configuration
The ingest applications rely on a centralized configuration server that pulls property files from a git repo. Every
application therefore has two property files: the embedded application.yml file and the config-repo application.yml
file (of course properties may be put in separate yml files, there will be two instances of each). Properties fall 
into three broad categories: 
* Code-like properties should be specified only in the embedded file. Examples: jaxb settings, local cache settings.
* Configuration properties should have a reasonable default in the embedded file and profile-specific variations in 
the config-repo file. These are properties that vary depending on the environment and profile, for example: host 
names for external services.
* Secrets should be specified only in the config-repo file, and they should be encrypted using the config server.

#### Logging Level
When selecting the level to log a message consider the following:
* TRACE.
* DEBUG. 
* INFO. Assume this is the log level in production, so don't be too chatty with it. It should be used to confirm 
proper configuration and code paths that are not business-as-usual but also aren't problematic.
* WARN. This is the level to use for a problem the application has handled but still needs attention.
* ERROR. Assume that messages logged at this level will cause a person to be called in the middle of the night.

### Version Control Conventions
Repo: https://github.com/SmarterApp/RDW_Ingest
Config Repo: https://gitlab.com/fairwaytech/sbac-config-repo

This project follows the common convention of having two main branches with infinite lifetime: `master` is the main
branch where HEAD contains the production-ready state, while `develop` is the main branch where HEAD contains the 
latest changes for the next release.
 
Use feature branches off of `develop` for all new features. Use a prefix of `feature/` to highlight those branches.
For example, the new shoesize feature work would be in `feature/shoesize`. Create pull requests from the feature
branch to `develop` to solicit code reviews and feedback. Once approved use `squash and merge` into `develop`.


##### Developing with RDW_Schema
If you are making changes within a standalone clone of RDW_Schema and want to test RDW_Ingest with the local changes to
the schema, then all you have to do is install the changes to RDW_Schema that you have made, and tell ingest to use the 
SNAPSHOT version of the RDW_Schema:
```bash
//under the RDW_Schema directory...
./gradlew install
```
and then run the integration tests as usual, but using the local SNAPSHOT version of RDW_Schema:
```bash
//under the RDW_Ingest directory...
 ./gradlew build it -Pschema=1.1.0-SNAPSHOT
```

### Running

#### Running From IDE
The README outlines how to run the applications using docker. As a developer you will want to run an application 
locally from the IDE. This works fine; after using docker-compose to launch all the other applications, stop the
application you're working on, then launch it from the IDE. Note that this defaults to running without a 
configuration server; since the embedded property files do not contain any secrets they must be specified on the
command line. The server port may also have to be specified to avoid conflict with other running applications, 
e.g. `--server.port=8082`.

#### Running Standalone
The artifacts are Spring Boot executable jars so you can just run them. Just as when running from the IDE the default
is to run without a configuration server so all secrets must be specified as program arguments and ports must be
specified to avoid conflict.
```bash
java -jar import-service/build/libs/rdw-ingest-import-service-1.1.0-SNAPSHOT.jar
java -jar exam-processor/build/libs/rdw-ingest-exam-processor-1.1.0-SNAPSHOT.jar --server.port=8082
```

#### FTP Server
The task service can be configured to use FTP to send reconciliation reports. If you don't have an FTP server but want 
to test that functionality, you can use docker to run ProFTPD. Either directly run it and modify the task service 
application.yml to hit localhost:
```bash
docker run -d --name ftpd -e FTP_USERNAME=alice -e FTP_PASSWORD=pswd -v /tmp/ftpd:/home/alice -p 20:20 -p 21:21 hauptmedia/proftpd
```
```bash
task:
  send-reconciliation-report:
    cron: 0 0/1 * * * *
    query: status=PROCESSED
    ftp-sender:
      server:localhost
      username:alice
      password:pswd
```
Or, set it all in the docker-compose.yml:
```yaml
  ftpd:
    image: hauptmedia/proftpd
    container_name: ftpd
    ports:
      - 0021:0021
      - 0020:0020
    volumes:
      - /tmp/ftpd:/home/alice
    environment:
      - FTP_USERNAME=alice
      - FTP_PASSWORD=pswd
...
  task-service:
    links:
      - ftpd
    environment:
      - task.send-reconciliation-report.ftp-sender.server=ftpd
```
Either way, the reconciliation reports should appear in `/tmp/ftpd` if things are working properly.