# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="liblogging"
PKG_VERSION="1.0.5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.liblogging.org"
PKG_URL="http://download.rsyslog.com/liblogging/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_LONGDESC="An easy to use and lightweight signal-safe logging library."

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --disable-man-pages \
                           ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes"
