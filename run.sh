#!/usr/bin/env bash

VERSION=${LEXION_SIMPLE_VERSION:-"1.0"}
IMAGE=${LEXION_SIMPLE_IMAGE:-"lexicon-simple"}

docker build . -t ${IMAGE}:${VERSION}

mkdir -p ./certificates

docker run -ti \
    -u `id -u`:`id -g` \
    -v ${PWD}/config:/etc/dehydrated \
    -v ${PWD}/certificates:/etc/certificates \
    -e AUTH_TOKEN=${DNSIMPLE_OAUTH_TOKEN} \
    ${IMAGE}:${VERSION} ${1}

