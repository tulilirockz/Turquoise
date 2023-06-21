# Turquoise

[![build-ublue](https://github.com/tulilirockz/turquoise/actions/workflows/build.yml/badge.svg)](https://github.com/tulilirockz/turquoise/actions/workflows/build.yml)

"Turquoise" is an image that is meant to have reasonable defaults for development and regular desktop usage for me and anyone else that is going to use this image

This was firstly created using `podman run -v "$(pwd)":/host:z -it ghcr.io/einohr/create-ublue-image` (this is community mantained, so use it at your own risk!), now I am using a slightly different system but it is pretty much the same


## Installation

Install [Fedora Silverblue](https://silverblue.fedoraproject.org/), [Ublue](https://ublue.it/installation/), or their variants. Then rebase to this image by running this:

```
rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:latest
```

You can also rebase to one specific day, like

```
rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:DAY (e.g.: 20230408)
```

