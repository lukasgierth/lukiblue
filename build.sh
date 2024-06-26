#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# install stuff that i may want/need as a package outside of toolbox/distrobox

# INFO: INSTALL
rpm-ostree install android-tools
rpm-ostree install fira-code-fonts
rpm-ostree install gcc
rpm-ostree install gnome-shell-extension-caffeine

# INFO: UNINSTALL
# INFO: reference https://github.com/ublue-os/main/blob/main/packages.json
rpm-ostree uninstall firefox-langpacks
rpm-ostree uninstall firefox
rpm-ostree uninstall fzf
rpm-ostree uninstall gnome-epub-thumbnailer
rpm-ostree uninstall gnome-software-rpm-ostree
rpm-ostree uninstall gnome-software
rpm-ostree uninstall gnome-tour
rpm-ostree uninstall gnome-tweaks
rpm-ostree uninstall net-tools
rpm-ostree uninstall nvtop
rpm-ostree uninstall tmux
rpm-ostree uninstall traceroute
rpm-ostree uninstall ublue-os-update-services

# TODO: add mullvad tool?, add own service for laptop battery maintenance, add other stuff i may need outside
rm -f /usr/share/applications/htop.desktop

# TODO: some of the bluefin devtools maybe? https://github.com/ublue-os/bluefin/blob/main/packages.json

#### Example for enabling a System Unit File

systemctl enable podman.socket
