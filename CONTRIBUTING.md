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

#### Release Process
1. Checkout the latest `develop` branch
2. Verify the version number is right for the upcoming release, e.g. 5.1.0-SNAPSHOT.
3. Update the CHANGELOG to capture the changes for the upcoming release.
4. Create a release branch off of develop; name it with release/ prefix and release number, e.g. release/5.1.0.
```bash
# create new release branch
git pull origin develop
git checkout -b release/5.1.0 develop 
git push -u origin release/5.1.0
```
5. Finalize the CHANGELOG.md if necessary
6. Refine the release candidate, starting with RC1 (details depend on CI server)
    a. Prefer applying bug fixes to the release branch, merging into develop as necessary
    ```bash
    # merge changes from release branch into develop 
    git checkout release/5.1.0; git pull
    git checkout develop; git pull
    git merge release/5.1.0
    git push origin develop
    ```
    b. If bug fix is made in develop, merge into the release branch (may require cherry picking).
    ```bash
    # merge changes from develop into release branch 
    git checkout develop; git pull
    git checkout release/5.1.0; git pull
    git merge develop
    git push origin release/5.1.0
    ```
7. Once release looks good, merge into master and tag it. This can be done in the GitHub UI.
*NOTE: do _NOT_ squash changes when merging, we want the full commit history in master*
```bash
# merge release branch into master and create tag
# NOTE: these commands are not fully vetted, use with caution 
git checkout release/5.1.0; git pull
git rebase -i master
git checkout master
git merge --ff-only release/5.1.0
git tag -a 5.1.0
git push --tags origin master
```
8. Verify the release build, should create artifacts with release suffix, e.g. 5.1.0-RELEASE.
9. Delete the release branch
```bash
# delete the release branch
git push origin -d release/1.0.0 
git branch -d release/1.0.0
```
10. Advance the version in develop, e.g. 5.2.0-SNAPSHOT.

#### Hotfix Process
Hotfixes are focused changes to a release. The branching happens directly off master.

1. Create a hotfix branch off of master; name it with hotfix/ prefix and the release number. 
The release number should be the same as master major.minor with the patch number incremented, e.g. hotfix/5.1.1.
```bash
# create new hotfix branch
git pull origin master
git checkout -b hotfix/5.1.1 master 
git push -u origin hotfix/5.1.1
```
2. Update the release number in the source code.
3. Update the CHANGELOG.md to reflect changes.
4. Refine the hotfix candidate
    a. Apply the hotfix code changes to the branch.
    b. Manually trigger the hotfix build. CI should produce an artifact with 5.1.1-HOTFIX.
    c. Test the artifact, focusing on the hotfix and basic regression testing.
    d. Iterate. These instructions don't really deal with iterations but i guess the artifact could get incremented HOTFIX# suffixes.
5. Merge the hotfix branch into master. This should be done from GitHub as a PR. Do not squash the changes, we want the commit history in master. Tag the master branch with the release tag, 5.1.1.
6. Manually trigger the release build. CI should produce an artifact with 5.1.1-RELEASE.
7. Verify the release build is happy and healthy.
8. Merge the hotfix branch into develop so the changes are preserved in the next release. However, you'll want to not merge the version
changes.
9. Delete the hotfix branch.

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
* Get access to the Redshift and Aurora dev/test databases, ask the project lead.
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
