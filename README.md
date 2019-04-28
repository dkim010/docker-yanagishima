# Dockerhub
[![Docker Pulls](https://img.shields.io/docker/pulls/dkim010/yanagishima.svg?style=flat-square)](https://hub.docker.com/r/dkim010/yanagishima/)

- This repository is to create yanagishima docker image
- If you want to use just the created docker image, use dockerhub.
  - https://hub.docker.com/r/dkim010/yanagishima/tags

```
$ docker pull dkim010/yanagishima
$ docker run \
    -p $PORT:8080 \
    -e PRESTO_COORDINATOR_URL=$PRESTO_COORDINATOR_URL \
    -e CATALOG=$CATALOG \
    -e SCHEMA=$SCHEMA \
    dkim010/yanagishima
```

# Usage
  - `dockerize.sh`
    - Creating a yanagishima distribution (distZip)
    - Then `yanagishima-$VERSION.zip` will be in `dist/`
    - And `yanagishima:$VERSION` image will be created locally

# Troubleshooting
- Web UI 404 Error
  - https://github.com/yanagishima/yanagishima/issues/44
  - I solved by executing `yanagishima-start.sh` in yanagishima application home directory.
  - The directory includes `bin/`, `conf/`, `lib`, and so on.
  - I guess that yanagishima is referring to current path.
