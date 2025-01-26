# LBRC Docker
All of the docker files for all of the things.
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
