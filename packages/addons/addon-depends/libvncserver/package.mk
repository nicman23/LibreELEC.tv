# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libvncserver"
PKG_VERSION="0.9.11"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libvnc.github.io/"
PKG_URL="https://github.com/LibVNC/libvncserver/archive/LibVNCServer-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libvncserver-LibVNCServer-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo libpng openssl"
PKG_SECTION="libs"
PKG_SHORTDESC="LibVNCServer/LibVNCClient are cross-platform C libraries that allow you to easily implement VNC server or client functionality in your program."
PKG_LONGDESC="LibVNCServer/LibVNCClient are cross-platform C libraries that allow you to easily implement VNC server or client functionality in your program."

PKG_IS_ADDON="no"
PKG_USE_CMAKE="no"
PKG_AUTORECONF="yes"

PKG_MAINTAINER="Lukas Rusak (lrusak at irc.freenode.net)"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --with-sysroot=$SYSROOT_PREFIX \
                           --with-jpeg \
                           --with-png \
                           --without-sdl \
                           --without-gcrypt \
                           --without-client-gcrypt \
                           --without-gnutls"
