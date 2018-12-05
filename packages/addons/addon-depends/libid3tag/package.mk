# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libid3tag"
PKG_VERSION="0.15.1b"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.mars.org/home/rob/proj/mpeg/"
PKG_URL="$SOURCEFORGE_SRC/mad/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_LONGDESC="A library for id3 tagging."

PKG_MAINTAINER="Lukas Sabota (LTsmooth42@gmail.com)"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
