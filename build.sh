#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# install stuff that i may want/need as a package outside of toolbox/distrobox

rpm-ostree install android-tools
rpm-ostree install dfu-util
rpm-ostree install fira-code-fonts
rpm-ostree install heimdall
rpm-ostree install picocom
rpm-ostree install screen

# uninstall stuff that was added by ublue:main that i don't need
rpm-ostree uninstall tmux

# uninstall stuff that is in silverblue that i don't need
# INFO: reference https://github.com/ublue-os/main/blob/main/packages.json
rpm-ostree uninstall apr-util
rpm-ostree uninstall apr
rpm-ostree uninstall firefox-langpacks
rpm-ostree uninstall firefox
rpm-ostree uninstall fzf
rpm-ostree uninstall gnome-epub-thumbnailer
rpm-ostree uninstall gnome-software-rpm-ostree
rpm-ostree uninstall gnome-software
rpm-ostree uninstall gnome-tweaks
rpm-ostree uninstall just
rpm-ostree uninstall net-tools
rpm-ostree uninstall traceroute
rpm-ostree uninstall vim

# TODO: add mullvad tool, add own service for laptop bat maintenance, add other stuff i may need outside

#### Example for enabling a System Unit File

systemctl enable podman.socket
