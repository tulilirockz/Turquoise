# Turquoise

[![build-ublue](https://github.com/tulilirockz/turquoise/actions/workflows/build.yml/badge.svg)](https://github.com/tulilirockz/turquoise/actions/workflows/build.yml)

This is a spin on how I think a Fedora system for me should look like. 

It tries to make it so I just need to install it, and forget it, so it is quite opinionated, with my themes and settings by default. Also contains remote access tools and services, such as Cockpit and Tailscale.

This was firstly created using `podman run -v "$(pwd)":/host:z -it ghcr.io/einohr/create-ublue-image` (this is community mantained, so use it at your own risk!), now I am using a slightly different system but it is pretty much the same

## Installation

Install [Fedora Silverblue](https://silverblue.fedoraproject.org/), [Ublue](https://ublue.it/installation/), or their variants. Then rebase to this image by running this:

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:latest
```

You can also rebase to one specific day, like

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/tulilirockz/turquoise:DAY (e.g.: 20230408)
```

