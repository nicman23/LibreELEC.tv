# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="flex"
PKG_VERSION="2.5.39"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://flex.sourceforge.net/"
PKG_URL="$SOURCEFORGE_SRC/flex/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="A tool for generating programs that perform pattern-matching on text."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_HOST="--enable-static --disable-shared --disable-rpath --with-gnu-ld"

post_makeinstall_host() {
  cat > $TOOLCHAIN/bin/lex << "EOF"
#!/bin/sh
exec flex "$@"
EOF

  chmod -v 755 $TOOLCHAIN/bin/lex
}
