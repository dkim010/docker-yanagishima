#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

IMAGE_NAME=yanagishima
VERSION=20.0

DIST_DIR=dist
mkdir -p $DIST_DIR

# create a dist zip file
echo ">> create a dist zip file"
docker build . \
    -t $IMAGE_NAME-dist:latest \
    --build-arg YANAGISHIMA_VERSION=$VERSION \
    -f Dockerfile.dist

# extract the dist zip file
echo ">> extract the dist zip file"
docker run \
    -v $DIST_DIR:/dist \
    -e YANAGISHIMA_VERSION=$VERSION \
    $IMAGE_NAME-dist:latest

# create a dist docker image
echo ">> create a dist docker image"
docker build . \
    -t $IMAGE_NAME:$VERSION \
    --build-arg YANAGISHIMA_VERSION=$VERSION \
    -f Dockerfile
