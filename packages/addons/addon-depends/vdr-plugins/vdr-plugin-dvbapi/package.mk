# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="vdr-plugin-dvbapi"
PKG_VERSION="d7c7587"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/manio/vdr-plugin-dvbapi"
PKG_URL="https://github.com/manio/vdr-plugin-dvbapi/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr libdvbcsa"
PKG_NEED_UNPACK="$(get_pkg_directory vdr)"
PKG_LONGDESC="VDR dvbapi plugin for use with OSCam"
PKG_TOOLCHAIN="manual"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make \
    LIBDIR="." \
    LOCDIR="./locale" \
    LIBDVBCSA=1 \
    all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
  $STRIP libvdr-*.so*
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}
