################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="lm_sensors"
PKG_VERSION="0d5ccf6"
PKG_ARCH="arm x86_64"
PKG_LICENSE="GPL"
PKG_SITE="http://secure.netroedge.com/~lm78/"
PKG_URL="https://github.com/groeck/lm-sensors/archive/${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="lm-sensors-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Provides user-space support for the hardware monitoring drivers."

PKG_MAKE_OPTS_TARGET="PREFIX=/usr CC=$CC AR=$AR"
PKG_MAKEINSTALL_OPTS_TARGET="PREFIX=/usr"

pre_make_target() {
  export CFLAGS="$TARGET_CFLAGS"
  export CPPFLAGS="$TARGET_CPPFLAGS"
}

makeinstall_target() {
  :
}
