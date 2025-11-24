# LBRC Docker
All of the docker files for all of the things.
## Authentication
In order to push images to DockerHub you will first need to login, using the following command:
```bash
docker login
```
## Building and Pushing
Building and pushing uses [Make](https://www.gnu.org/software/make/) that will build not only your required docker files, but also its dependencies.  To build a specific set of docker files run the command `make build_{application name}`, such as:
```bash
make build_identity
```
If the set of docker files has already been built it will not be built again.  To rebuild a set of docker files you will first have to clean up the previous builds:
```bash
make clean_{application name}
```
It is also possible to clean or build everything by running:
```bash
make build_clean
make build_all
```
### Pushing
As well as building docker images, they can also be pushed to DockerHub by replacing the `build_` prefix with `push_`, such as:
```bash
make push_clean
make push_all
# or
make push_identity
```
## Build Targets
### Build and Push All
```bash
make build_all
make push_all
```
### Cleaning
```bash
make build_clean # Clean builds
make push_clean # Clean pushes
make clean # Clean builds and pushes
```
### Tools
#### Airflow
```bash
make build_airflow
make push_airflow
```
### Python Applications
```bash
make build_indentity
make push_identity
```
#### GENVASC Portal
```bash
make build_genvasc_portal
make push_genvasc_portal
```
#### Link Checker
```bash
make build_link_checker
make push_link_checker
```
#### MS SQL Github
```bash
make build_mssql_github
make push_mssql_github
```
### REDCap
All of the redcaps can be built with one target
```bash
make build_redcap
make push_redcap
```
