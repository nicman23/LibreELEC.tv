# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2012 Yann Cézard (eesprit@free.fr)
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="open-iscsi"
PKG_VERSION="bf39941"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/mikechristie/open-iscsi"
PKG_URL="https://github.com/mikechristie/open-iscsi/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_INIT="toolchain util-linux"
PKG_LONGDESC="The open-iscsi package allows you to mount iSCSI targets."
PKG_TOOLCHAIN="configure"

PKG_MAKE_OPTS_INIT="user"

pre_configure_init() {
  export OPTFLAGS="$CFLAGS $LDFLAGS"
}

configure_init() {
  cd utils/open-isns
    ./configure --host=$TARGET_NAME \
                --build=$HOST_NAME \
                --with-security=no
  cd ../..
}

makeinstall_init() {
  mkdir -p $INSTALL/usr/sbin
    cp -P $PKG_BUILD/usr/iscsistart $INSTALL/usr/sbin
}
