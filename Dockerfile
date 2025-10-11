FROM alpine

RUN apk add --no-cache \
    kubectl \
    gzip \
    docker \
    curl \
    bash
