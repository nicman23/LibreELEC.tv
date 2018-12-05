# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="distutilscross"
PKG_VERSION="0.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://bitbucket.org/lambacck/distutilscross/"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python2:host setuptools:host"
PKG_LONGDESC="distutilscross enhances distutils to support Cross Compile of Python extensions"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  python setup.py install --prefix=$TOOLCHAIN
}
