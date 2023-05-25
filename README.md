# Turquoise

[![build-ublue](https://github.com/tulilirockz/rose-positivo-c464c/actions/workflows/build.yml/badge.svg)](https://github.com/tulilirockz/ublue-positivo-c464c/actions/workflows/build.yml)

This is an image based on [ublue](https://github.com/ublue-os/startingpoint) following their [instructions](https://ublue.it/making-your-own/) made with to bring some QOL linux support to Positivo c464c!

Use the following command to build your own: `podman run -v "$(pwd)":/host:z -it ghcr.io/einohr/create-ublue-image` (this is community mantained, so use it at your own risk!)


## Installation

Install [Fedora Silverblue](https://silverblue.fedoraproject.org/), [Ublue](https://ublue.it/installation/), or their variants. Then rebase to this image by running this:

```
sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:latest
```

You can also rebase to one specific day, like

```
sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:DAY (e.g.: 20230408)
```

You can also implement all these changes in your distro of choice by following our [DIY guide](docs/DIY.md)!
