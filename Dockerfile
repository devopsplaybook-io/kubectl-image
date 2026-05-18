FROM alpine:3.21

RUN apk add --no-cache \
    bash \
    curl \
    docker \
    gawk \
    gzip \
    jq \
    kubectl \
    aws-cli \
    && rm -rf /var/cache/apk/*
