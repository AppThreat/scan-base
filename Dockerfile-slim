FROM registry.access.redhat.com/ubi8/ubi-minimal as builder

ARG CLI_VERSION
ARG BUILD_DATE

ENV PATH=${PATH}:/usr/local/go/bin:

LABEL maintainer="AppThreat" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="AppThreat" \
      org.label-schema.name="scan-base" \
      org.label-schema.version=$CLI_VERSION \
      org.label-schema.license="MIT" \
      org.label-schema.description="Base image containing multiple programming languages" \
      org.label-schema.url="https://appthreat.io" \
      org.label-schema.usage="https://github.com/appthreat/scan-base" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/appthreat/scan-base.git" \
      org.label-schema.docker.cmd="docker run --rm -it --name scan-base appthreat/scan-base-slim /bin/bash"

USER root

RUN microdnf install -y tar xz curl wget unzip python36 ruby ruby-libs ruby-devel rubygems nodejs golang git-core java-11-openjdk-headless \
    && npm install -g yarn \
    && microdnf clean all
