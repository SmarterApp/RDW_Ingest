## RDW_Ingest for Developers

This document targets developers contributing to the RDW_Ingest project. It includes conventions 
and guidelines (please read before contributing), and detailed instructions for running the services
in various development-friendly configurations.

Table of Contents:
* [Coding Conventions](#coding-conventions)
* [Version Control Conventions](#version-control-conventions)
* [Documentation Conventions](#documentation-conventions)
* [Developer Setup](#developer-setup)
* [Running](#running)

### Coding Conventions

#### Application Configuration
The ingest applications rely on a centralized configuration server that pulls property files from a git repo. Every
application therefore has two property files: the embedded application.yml file and the config-repo application.yml
file (of course properties may be put in separate yml files, there will be two instances of each). Properties fall 
into three broad categories: 
* Code-like properties should be specified only in the embedded file. Examples: jaxb settings, message queue names, local cache settings.
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

#### PII Data
This system is designed to ingest student test results which includes sensitive Personally Identifiable Information.
Although the system will be run in a secure environment, separation of duties dictates that system admins, devops, etc.
should never see PII. For developers this means that no PII or secrets (e.g. credentials) should ever be logged or
made available through unsecured interfaces. Put simply: do not log student information or client/user credentials, nor
include that information in any system status/monitoring end-points.


### Version Control Conventions
Repo: https://github.com/SmarterApp/RDW_Ingest

This project follows the GitFlow convention of having two main branches with infinite lifetime: `master` is the main
branch where HEAD contains the production-ready state, while `develop` is the main branch where HEAD contains the
latest changes for the next release.
 
Use feature branches off of `develop` for all new features. Use a prefix of `feature/` to highlight those branches.
For example, the new shoesize feature work would be in `feature/shoesize`. Create pull requests from the feature
branch to `develop` to solicit code reviews and feedback. Once approved use `squash and merge` into `develop`.


### Documentation Conventions
As changes are made to the project, please maintain the documentation. Within this project `README.md` is
intended as an introduction with sufficient information for building and deploying the project.
`CONTRIBUTING.md` is targeted at developers and has more detailed information on building, testing, and
debugging the applications. Please update `CHANGELOG.md` as work is completed so we don't have to mine 
the vcs log to glean the high level changes.  

##### Resource Requirements Documentation
As changes are made to the code, the resulting services will change their resource requirements. Since these are
documented for the users, e.g. https://github.com/SmarterApp/RDW/blob/develop/docs/Runbook.md#import-service, it is
important to keep them current. This isn't too hard to do using Native Memory Tracking (NMT). Please refer to
https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr007.html to calculate the off-heap
memory utilization.


### Developer Setup
Developers should start with the [basic build instructions](./README.md#building). And, of course, developers
should have their favorite Java IDE installed, IntelliJ is a good choice. Pull down the repository and load
the project from its gradle configuration.

Additionally, developers should:
* Pull down [RDW](https://github.com/SmarterApp/RDW)
* Pull down [RDW_Common](https://github.com/SmarterApp/RDW_Common)
* Pull down [RDW_Schema](https://github.com/SmarterApp/RDW_Schema) 
* Get access to the git repository backing the configuration service, ask the project lead.
* Load the test data mentioned in [loading data](./README.md#loading-data), ask the project lead for the file.
```bash
mysql -u root < ~/mysqltestdata.dmp
gw migrateAll
```

##### Developing with RDW_Schema
If you are developing RDW_Schema and would like to test your local changes in this project, you can build 
RDW_Schema locally, install your changes to the local repository, and specify the SNAPSHOT version of 
RDW_Schema when building RDW_Ingest:
```bash
cd ../RDW_Schema
# make local changes
gw install

cd ../RDW_Ingest
gw build it -Pschema=2.4.0-SNAPSHOT
```

##### Developing with RDW_Common
If you are developing RDW_Common and would like to test your local changes in this project, you can build 
RDW_Common locally, install your changes to the local repository, and specify the SNAPSHOT version of 
RDW_Common when building RDW_Ingest:
```bash
cd ../RDW_Common
# make local changes
gw install

cd ../RDW_Ingest
gw build it -Pcommon=1.1.0-SNAPSHOT
```

### Running

RDW_Ingest applications are loosely coupled using a message queue to coordinate work. And the default
configuration for the applications is "developer-friendly" pointing at local resources. Because of this,
it is seldom necessary to orchestrate all the applications to do effective development. Instead:
1. Use unit tests to develop core functionality.
1. Use integration tests to develop database-related and application framework functionality.
1. Run one or two applications from the IDE to do system-level testing.

#### Running From IDE
The [README](./README.md) outlines how to run the applications using docker. As a developer you will want to run an
application locally from the IDE. This works fine; after using docker-compose to launch all the other applications,
stop the application you're working on, then launch it from the IDE. Note that this defaults to running without a
configuration server; since the embedded property files do not contain any secrets they must be specified on the
command line. The server port may also have to be specified to avoid conflict with other running applications, 
e.g. `--server.port=8082`. As an extreme example, running the migrate-olap application requires configuring cloud
resources and credentials (note this app isn't included in the docker-compose file because of this) so the run
configuration has many program arguments, please see the comments in [build.gradle](./migrate_olap/build.gradle).

#### Running Standalone
The artifacts are Spring Boot executable jars so you can just run them. Just as when running from the IDE the default
is to run without a configuration server so all secrets must be specified as program arguments and ports must be
specified to avoid conflict.
```bash
java -jar import-service/build/libs/rdw-ingest-import-service-1.1.0-SNAPSHOT.jar
java -jar exam-processor/build/libs/rdw-ingest-exam-processor-1.1.0-SNAPSHOT.jar --server.port=8082
```
