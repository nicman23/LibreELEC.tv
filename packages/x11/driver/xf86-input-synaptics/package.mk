# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="xf86-input-synaptics"
PKG_VERSION="1.9.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://lists.freedesktop.org/mailman/listinfo/xorg"
PKG_URL="http://xorg.freedesktop.org/archive/individual/driver/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libXi"
PKG_LONGDESC="Synaptics touchpad driver for X.Org."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-xorg-module-dir=$XORG_PATH_MODULES"
