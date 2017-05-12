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

#### Developing with Dependent Submodules
This section covers the development scenario of working on RDW_Schema and RDW_Ingest together.

This project utilizes git submodules (independent git repo, but checked out at a desired commit)for the RDW_Schema that 
it depends on. This means the project's RDW_Schema submodule is "pointing" to a commit in the RDW_Schema git repo that 
is the correct version of that project that is known to be working correctly with Ingest. During development, you may 
want to develop in RDW_Schema and make changes, test with Ingest, etc. Since RDW_Schema is in a "detached head" status, 
you will need to do the following to get RDW_Schema in a good state:
```bash
cd RDW_Schema
git pull
git checkout develop
git checkout -b feature/<your feature>
```
While you are making changes to the schema, you can be making corresponding changes in Ingest and running integration 
tests against your new RDW_Schema changes. When you are done with changes in RDW_Schema, you can commit and push the 
RDW_Schema repo as you would normally do, but from the RDW_Schema subdirectory.
```bash
git add -u
git commit -m "<message>"
git push -u origin <your branch name>
```
  
When you are done, the Ingest project's "version" of RDW_Schema will be at the commit hash of your new code changes, 
and will be under "Changes not staged for commit" section of 
```bash
//under the RDW_Ingest parent directory...
git status 
```
At this point, your current RDW_Schema submodule is out of sync with what your RDW_Ingest project is expecting. And, 
your RDW_Schema submodule is also on a branch, which will need to be merged in to the develop branch via normal procedures. 
RDW_Schema should be merged to develop and then resynced with the RDW_Ingest project before your commit and push your
changes because you don't want to be moving the submodule pointer to a feature branch. To move the submodule pointer to 
the new develop branch tip, do the following:
```bash
git submodule update --remote
```
This pulls the latest from the RDW_Schema develop branch in to your submodule. If you run "git status", you will also now
see RDW_Schema under the "Changes not staged for commit" section. You can now add any other remaining changes, commit
your changes, and push them to the server. The RDW_Schema submodule pointer is now pointing at the version that matches
your Ingest changes.


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