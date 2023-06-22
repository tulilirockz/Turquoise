ARG FEDORA_MAJOR_VERSION=38
ARG BASE_IMAGE_URL=ghcr.io/ublue-os/silverblue-main

FROM ${BASE_IMAGE_URL}:${FEDORA_MAJOR_VERSION}
ARG META_FOLDER=meta

COPY usr /usr
COPY ${META_FOLDER} /tmp/meta
COPY scripts /tmp/scripts

RUN cp -r /usr/etc/yum.repos.d /etc && \
        chmod +x /tmp/scripts/build.sh && \
        /tmp/scripts/build.sh && \
        rm -rf /tmp/* /var/* && \
        ostree container commit