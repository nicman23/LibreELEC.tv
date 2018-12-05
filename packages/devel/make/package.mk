# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="make"
PKG_VERSION="4.2.1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://www.gnu.org/software/make/"
PKG_URL="http://ftpmirror.gnu.org/make/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST=""
PKG_LONGDESC="Utility to maintain groups of programs."

export CC=$LOCAL_CC

post_makeinstall_host() {
  ln -sf make $TOOLCHAIN/bin/gmake
}
