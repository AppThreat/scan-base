FROM registry.access.redhat.com/ubi8/python-36 as builder

ARG CLI_VERSION
ARG BUILD_DATE

ENV GOPATH=/opt/app-root/go \
    GO_VERSION=1.13.10 \
    PATH=${PATH}:/opt/app-root/src/.cargo/bin:${GOPATH}/bin:/usr/local/go/bin:

LABEL maintainer="AppThreat" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="AppThreat" \
      org.label-schema.name="scan-base" \
      org.label-schema.version=$CLI_VERSION \
      org.label-schema.license="MIT" \
      org.label-schema.description="Base image containing multiple programming languages" \
      org.label-schema.url="https://www.appthreat.io" \
      org.label-schema.usage="https://github.com/AppThreat/scan-base" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/AppThreat/scan-base.git" \
      org.label-schema.docker.cmd="docker run --rm -it --name scan-base appthreat/scan-base /bin/bash"

USER root

RUN yum update -y \
    && yum install -y ruby ruby-libs ruby-devel rubygems nodejs java-1.8.0-openjdk-headless java-11-openjdk-headless \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust-installer.sh \
    && chmod +x rust-installer.sh \
    && bash rust-installer.sh -y \
    && rm rust-installer.sh \
    && cargo install cargo-audit \
    && curl -LO "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz \
    && npm install -g yarn \
    && go get github.com/google/go-licenses \
    && yum clean all
