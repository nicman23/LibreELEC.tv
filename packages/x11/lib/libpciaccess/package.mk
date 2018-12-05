# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libpciaccess"
PKG_VERSION="0.13.4"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://freedesktop.org"
PKG_URL="http://xorg.freedesktop.org/archive/individual/lib/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros zlib"
PKG_LONGDESC="X.org libpciaccess library."

CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_header_asm_mtrr_h=set \
                           --with-pciids-path=/usr/share \
                           --with-zlib "
