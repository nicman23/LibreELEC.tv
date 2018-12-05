# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="intltool"
PKG_VERSION="0.51.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnome.org"
PKG_URL="http://launchpad.net/intltool/trunk/$PKG_VERSION/+download/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="Tools to translate strings from various source files (.xml.in, .glade, .desktop.in, .server.in, .oaf.in)."

post_makeinstall_host() {
  mkdir -p  $SYSROOT_PREFIX/usr/share/aclocal
    cp ../intltool.m4 $SYSROOT_PREFIX/usr/share/aclocal
}
