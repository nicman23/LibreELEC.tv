# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="ngrep"
PKG_VERSION="1.45"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/jpr5/ngrep"
PKG_URL="https://github.com/jpr5/ngrep/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libpcap"
PKG_LONGDESC="A tool like GNU grep applied to the network layer."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-pcap-includes=$SYSROOT_PREFIX/usr/include \
                           --enable-ipv6 \
                           --disable-dropprivs"

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

makeinstall_target() {
  :
}
