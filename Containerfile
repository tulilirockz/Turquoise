ARG FEDORA_MAJOR_VERSION=38
ARG BASE_IMAGE_URL=ghcr.io/ublue-os/kinoite-main

FROM ${BASE_IMAGE_URL}:${FEDORA_MAJOR_VERSION}
ARG RECIPE

COPY usr /usr
COPY ${RECIPE} /usr/share/ublue-os/recipe.yml
COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq
COPY scripts /tmp/scripts

RUN cp /usr/etc/yum.repos.d/vscode.repo /etc/yum.repos.d/ && wget "https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo" -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
        chmod +x /tmp/scripts/build.sh && \
        /tmp/scripts/build.sh && \
        sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
        rm -rf /tmp/* /var/* && \
        ostree container commit
