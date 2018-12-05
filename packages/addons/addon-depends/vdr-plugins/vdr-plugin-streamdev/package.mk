# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-streamdev"
PKG_VERSION="fc52e92"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-streamdev"
PKG_URL="https://projects.vdr-developer.org/git/vdr-plugin-streamdev.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr openssl"
PKG_SECTION="multimedia"
PKG_SHORTDESC="TV"
PKG_LONGDESC="TV"

PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make \
    LIBDIR="." \
    LOCDIR="./locale" \
    all
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}
  cp --remove-destination $PKG_BUILD/server/${LIB_NAME}-server.so $PKG_BUILD/server/${LIB_NAME}-server.so.${VDR_APIVERSION}
  cp --remove-destination $PKG_BUILD/client/${LIB_NAME}-client.so $PKG_BUILD/client/${LIB_NAME}-client.so.${VDR_APIVERSION}

  $STRIP client/libvdr-*.so*
  $STRIP server/libvdr-*.so*
}
