FROM docker:dind

ENV HELM_VER 2.12.3 

RUN apk add bash \
    git \
    curl \ 
    bash-completion \ 
    jq \
    ca-certificates && \
    curl https://deislabs.blob.core.windows.net/porter/latest/install-linux.sh | bash && \
    curl -o helm.tgz https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VER}-linux-amd64.tar.gz && \
    tar -xzf helm.tgz && \
    mv linux-amd64/helm /usr/local/bin && \
    rm helm.tgz && \
    helm init --client-only && \
    mkdir -p /porter 

ENV PATH="$PATH:/root/.porter"

WORKDIR /porter