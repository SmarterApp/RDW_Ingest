## RDW_Ingest for Developers

This document is targeted at developers contributing to the RDW_Ingest project. Please check README.md for more info.

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
Source Repo: https://github.com/SmarterApp/RDW_Ingest
Config Repo: https://gitlab.com/fairwaytech/sbac-config-repo
Deployment Repo: https://gitlab.com/fairwaytech/RDW_Deployment

This project follows the common convention of having two main branches with infinite lifetime: `master` is the main
branch where HEAD contains the production-ready state, while `develop` is the main branch where HEAD contains the 
latest changes for the next release.
 
Use feature branches off of `develop` for all new features. Use a prefix of `feature/` to highlight those branches.
For example, the new shoesize feature work would be in `feature/shoesize`. Create pull requests from the feature
branch to `develop` to solicit code reviews and feedback. Once approved use `squash and merge` into `develop`.

### Building
The README outlines basic building steps.

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

### Running

#### Running From IDE
The README outlines how to run the applications using docker. As a developer you will want to run an application 
locally from the IDE. This works fine; after using docker-compose to launch all the other applications, stop the
application you're working on, then launch it from the IDE. Note that this defaults to running without a 
configuration server; since the embedded property files do not contain any secrets they must be specified on the
command line. The server port may also have to be specified to avoid conflict with other running applications, 
e.g. `--server.port=8081`.

#### Running Standalone
The artifacts are Spring Boot executable jars so you can just run them. Just as when running from the IDE the default
is to run without a configuration server so all secrets must be specified as program arguments and ports must be
specified to avoid conflict.
```bash
java -jar import-service/build/libs/rdw-ingest-import-service-0.0.1-SNAPSHOT.jar --server.port=8080
java -jar exam-processor/build/libs/rdw-ingest-exam-processor-0.0.1-SNAPSHOT.jar --server.port=8081
```