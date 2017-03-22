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

### Version Control Conventions
Repo: https://github.com/SmarterApp/RDW_Ingest
Config Repo: https://gitlab.com/fairwaytech/sbac-config-repo

This project follows the common convention of having two main branches with infinite lifetime: `master` is the main
branch where HEAD contains the production-ready state, while `develop` is the main branch where HEAD contains the 
latest changes for the next release.
 
Use feature branches off of `develop` for all new features. Use a prefix of `feature/` to highlight those branches.
For example, the new shoesize feature work would be in `feature/shoesize`. Create pull requests from the feature
branch to `develop` to solicit code reviews and feedback. Once approved use `squash and merge` into `develop`.

### Running

#### Running From IDE
The README outlines how to run the applications using docker. As a developer you will want to run an application 
locally from the IDE. This works fine; after using docker-compose to launch all the other applications, stop the
application you're working on, then launch it from the IDE. Note that this defaults to running without a 
configuration server; since the embedded property files do not contain any secrets they must be specified on the
command line. For example, the exam-service needs the oauth2 client secret so it must be specified in the program 
arguments, i.e. `--oauth2.client-secret=mysecret`. The server port may also have to be specified to avoid conflict 
with other running applications, e.g. `--server.port=8081`.

You will need valid credentials and connectivity to our SSO OAuth2 server. 

#### Running Standalone
The artifacts are Spring Boot executable jars so you can just run them. Just as when running from the IDE the default
is to run without a configuration server so all secrets must be specified as program arguments and ports must be
specified to avoid conflict.
```bash
java -jar exam-service/build/libs/rdw-ingest-exam-service-0.0.1-SNAPSHOT.jar --server.port=8080
java -jar exam-processor/build/libs/rdw-ingest-exam-processor-0.0.1-SNAPSHOT.jar --server.port=8081
```