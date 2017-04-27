# Dockerised Gitman

Source of the docker image [`redmatter/gitman`](https://hub.docker.com/r/redmatter/gitman/).

Documentation on `gitman` can be found at https://github.com/jacebrowning/gitman

Inspiration and entrypoint logic from [php composer](https://github.com/composer/docker/).

# How to use it?

In what ever way you use it, you will have to setup a volume with your project content; the easiest way to do that is by
setting up your current working directory. i.e by passing in the `docker run` option `--volume=$(pwd):/project`.

## Safest way to run it

Here is the safest way to run it; with the same privileges as your user. i.e by passing in the `docker run` option
`--user=$(id -u):$(id -g)`

The entrypoint script can take all [`gitman` commandline options](https://gitman.readthedocs.io/en/latest/).

```
docker run --rm -it \
    --user="$(id -u):$(id -g)" \
    --volume="$(pwd):/project" \
    redmatter/gitman \
    init
```

## Customisations via environment variable

### `PROJECT_DIR`

default: `/project`

If you fancy setting up the project volume to be somewhere other than `/project`, you will need to set this variable up.

### `GITMAN_CACHE`

default: `/tmp`

This is the folder that `gitman` uses for caching git repos.
