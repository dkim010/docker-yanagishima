#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

OWNER=dkim010
IMAGE_NAME=yanagishima
VERSION=20.0

# docker image tag
docker tag $IMAGE_NAME:$VERSION $OWNER/$IMAGE_NAME:$VERSION

# push to dockerhub
docker push $OWNER/$IMAGE_NAME:$VERSION
