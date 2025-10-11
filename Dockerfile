FROM alpine

RUN apk add --no-cache \
    kubectl \
    gzip \
    docker \
    curl

# Install Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sh
