ARG FEDORA_MAJOR_VERSION=38
ARG BASE_IMAGE_URL=ghcr.io/ublue-os/kinoite-main

FROM ${BASE_IMAGE_URL}:${FEDORA_MAJOR_VERSION}
ARG RECIPE

COPY usr /usr
COPY ${RECIPE} /usr/share/ublue-os/recipe.yml
COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq
COPY scripts /tmp/scripts

RUN wget https://copr.fedorainfracloud.org/coprs/principis/howdy/repo/fedora-$(rpm -E %fedora)/principis-howdy-fedora-$(rpm -E %fedora).repo -O /usr/etc/yum.repos.d/_copr_principis-howdy.repo && \
        cp -r /usr/etc/yum.repos.d /etc && \
        chmod +x /tmp/scripts/build.sh

RUN /tmp/scripts/build.sh && \
        pip install --prefix=/usr yafti && \
        rm -rf /tmp/* /var/* && \
        ostree container commit