FROM alpine

RUN apk add --no-cache \
    bash \
    curl \
    docker \
    gawk \
    gzip \
    jq \
    kubectl
