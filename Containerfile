ARG FEDORA_MAJOR_VERSION=38
ARG BASE_IMAGE_URL=ghcr.io/ublue-os/silverblue-main

FROM ${BASE_IMAGE_URL}:${FEDORA_MAJOR_VERSION}
ARG META_FOLDER=meta

COPY usr /usr
COPY --from=ghcr.io/ublue-os/bling:latest /rpms/ublue-os-wallpapers-*.noarch.rpm /tmp/ublue-os-wallpapers.rpm
COPY --from=ghcr.io/ublue-os/bling:latest /rpms/ublue-update*.rpm /tmp/ublue-update.rpm
COPY --from=ghcr.io/ublue-os/bling:latest /files/usr/share/ublue-os/just /usr/share/ublue-os/just
COPY --from=ghcr.io/ublue-os/bling:latest /files/usr/bin/ublue-nix* /usr/bin
COPY --from=ghcr.io/ublue-os/bling:latest /files/usr/share/fonts /usr/share/fonts
COPY ${META_FOLDER} /usr/share/ublue-os/meta
COPY scripts /tmp/scripts

RUN rpm-ostree install /tmp/ublue-update.rpm /tmp/ublue-os-wallpapers.rpm && \
        cp -r /usr/etc/yum.repos.d /etc && \
        chmod +x /tmp/scripts/build.sh && \
        /tmp/scripts/build.sh && \
        rm -rf /tmp/* /var/* && \
        ostree container commit
