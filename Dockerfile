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
    azure-cli \
    google-cloud-sdk \
    && rm -rf /var/cache/apk/*
