# Dockerised Gitman

Source of the docker image [`redmatter/gitman`](https://hub.docker.com/r/redmatter/gitman/).

Documentation on `gitman` can be found at https://github.com/jacebrowning/gitman

Inspiration and entrypoint logic from [php composer](https://github.com/composer/docker/).

# How to use it?

```
docker run --rm -it \
    --user="$(id -u):$(id -g)"  # run as current user
    --volume="$(pwd):/project"  # use current directory as project volume
    init                        # your gitman sub-command(s)
```
