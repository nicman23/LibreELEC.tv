# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)

PKG_NAME="tsdecrypt"
PKG_VERSION="10.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://georgi.unixsol.org/programs/tsdecrypt"
PKG_URL="http://georgi.unixsol.org/programs/tsdecrypt/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libdvbcsa"
PKG_LONGDESC="A tool that reads incoming mpeg transport stream over UDP/RTP and then decrypts it using libdvbcsa/ffdecsa."

make_target() {
  make CC=$CC LINK="$LD -o"
}

post_make_target() {
  make strip STRIP=$STRIP
}

makeinstall_target() {
  : # nop
}
