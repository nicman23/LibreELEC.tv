# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="qemu"
PKG_VERSION="2.7.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://wiki.qemu.org"
PKG_URL="https://download.qemu.org/qemu-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="toolchain glib:host pixman:host Python2:host zlib:host"
PKG_LONGDESC="QEMU is a generic and open source machine emulator and virtualizer."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

HOST_CONFIGURE_OPTS="--prefix=$TOOLCHAIN \
  --bindir=$TOOLCHAIN/bin \
  --sbindir=$TOOLCHAIN/sbin \
  --sysconfdir=$TOOLCHAIN/etc \
  --libexecdir=$TOOLCHAIN/lib \
  --localstatedir=$TOOLCHAIN/var \
  --extra-cflags=-I$TOOLCHAIN/include \
  --extra-ldflags=-L$TOOLCHAIN/lib \
  --static \
  --sysconfdir=$TOOLCHAIN/etc \
  --disable-blobs \
  --disable-docs \
  --disable-gcrypt \
  --disable-system \
  --disable-user \
  --disable-vnc \
  --disable-werror"
