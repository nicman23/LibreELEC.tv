# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="squashfs"
PKG_VERSION="4.3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git"
PKG_URL="https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git/snapshot/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host zlib:host lzo:host xz:host zstd:host"
PKG_NEED_UNPACK="$(get_pkg_directory zlib) $(get_pkg_directory lzo) $(get_pkg_directory xz) $(get_pkg_directory zstd)"
PKG_LONGDESC="A compressed read-only filesystem for Linux."
PKG_TOOLCHAIN="manual"

make_host() {
  make -C squashfs-tools mksquashfs \
       XZ_SUPPORT=1 LZO_SUPPORT=1 \
       INCLUDEDIR="-I. -I$TOOLCHAIN/include"
}

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
    cp squashfs-tools/mksquashfs $TOOLCHAIN/bin
}
