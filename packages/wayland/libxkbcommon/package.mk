# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libxkbcommon"
PKG_VERSION="0.6.1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://xkbcommon.org"
PKG_URL="http://xkbcommon.org/download/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain xkeyboard-config"
PKG_LONGDESC="xkbcommon is a library to handle keyboard descriptions."

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_CONFIGURE_OPTS_TARGET="--enable-x11"
else
  PKG_CONFIGURE_OPTS_TARGET="--disable-x11"
fi
