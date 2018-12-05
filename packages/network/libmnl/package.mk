# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libmnl"
PKG_VERSION="1.0.4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://netfilter.org/projects/libmnl"
PKG_URL="http://netfilter.org/projects/libmnl/files/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A minimalistic user-space library oriented to Netlink developers."

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"
