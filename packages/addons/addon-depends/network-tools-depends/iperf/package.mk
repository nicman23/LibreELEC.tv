# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="iperf"
PKG_VERSION="3.1.2"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://iperf.fr/"
PKG_URL="https://iperf.fr/download/source/$PKG_NAME-$PKG_VERSION-source.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="network/testing"
PKG_SHORTDESC="iperf: A modern alternative for measuring maximum TCP and UDP bandwidth performance"
PKG_LONGDESC="Iperf was developed by NLANR/DAST as a modern alternative for measuring maximum TCP and UDP bandwidth performance. Iperf allows the tuning of various parameters and UDP characteristics. Iperf reports bandwidth, delay jitter, datagram loss."
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared"

makeinstall_target() {
  :
}
