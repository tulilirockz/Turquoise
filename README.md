# Turquoise

[![build-ublue](https://github.com/tulilirockz/turquoise/actions/workflows/build.yml/badge.svg)](https://github.com/tulilirockz/turquoise/actions/workflows/build.yml)
[![build-ublue](https://github.com/tulilirockz/turquoise/actions/workflows/build-mum.yml/badge.svg)](https://github.com/tulilirockz/turquoise/actions/workflows/build-mum.yml)
[![build-ublue](https://github.com/tulilirockz/turquoise/actions/workflows/build-dx.yml/badge.svg)](https://github.com/tulilirockz/turquoise/actions/workflows/build-dx.yml)

"Turquoise" is a collection of images for every computer I wish to install linux on, including my laptop, my mom's computer, and my gaming computer. Every image has it's customizations and base-images.

The "dx" image also includes Positivo C4128B-1 drivers! 

Use the following command to build your own: `podman run -v "$(pwd)":/host:z -it ghcr.io/einohr/create-ublue-image` (this is community mantained, so use it at your own risk!)


## Installation

Install [Fedora Silverblue](https://silverblue.fedoraproject.org/), [Ublue](https://ublue.it/installation/), or their variants. Then rebase to this image by running this:

```
rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:latest
```

You can also rebase to one specific day, like

```
rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:DAY (e.g.: 20230408)
```

