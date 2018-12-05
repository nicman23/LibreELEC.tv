# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="faad2"
PKG_VERSION="2.7"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.audiocoding.com"
PKG_URL="https://downloads.sourceforge.net/sourceforge/faac/faad2-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="An MPEG-4 AAC decoder."

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --without-drm \
                           --with-gnu-ld \
                           --without-mpeg4ip \
                           --without-xmms"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
