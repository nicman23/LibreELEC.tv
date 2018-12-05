# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bcm2835-bootloader"
PKG_VERSION="3aa8060"
PKG_ARCH="arm"
PKG_LICENSE="nonfree"
PKG_SITE="http://www.broadcom.com"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux bcmstat"
PKG_LONGDESC="bcm2835-bootloader: Tool to create a bootable kernel for RaspberryPi"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/bootloader
    cp -PRv LICENCE* $INSTALL/usr/share/bootloader
    cp -PRv bootcode.bin $INSTALL/usr/share/bootloader
    cp -PRv fixup_x.dat $INSTALL/usr/share/bootloader/fixup.dat
    cp -PRv start_x.elf $INSTALL/usr/share/bootloader/start.elf

    find_file_path config/dt-blob.bin && cp -PRv $FOUND_PATH $INSTALL/usr/share/bootloader

    if [ -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/config/distroconfig.txt ]; then
      cp -PRv $PROJECT_DIR/$PROJECT/devices/$DEVICE/config/distroconfig.txt $INSTALL/usr/share/bootloader
    elif [ -f $PROJECT_DIR/$PROJECT/config/distroconfig.txt ]; then
      cp -PRv $PROJECT_DIR/$PROJECT/config/distroconfig.txt $INSTALL/usr/share/bootloader
    elif [ -f $DISTRO_DIR/$DISTRO/config/distroconfig.txt ]; then
      cp -PRv $DISTRO_DIR/$DISTRO/config/distroconfig.txt $INSTALL/usr/share/bootloader
    else
      cp -PRv $PKG_DIR/files/3rdparty/bootloader/distroconfig.txt $INSTALL/usr/share/bootloader
    fi

    if [ -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/config/config.txt ]; then
      cp -PRv $PROJECT_DIR/$PROJECT/devices/$DEVICE/config/config.txt $INSTALL/usr/share/bootloader
    elif [ -f $PROJECT_DIR/$PROJECT/config/config.txt ]; then
      cp -PRv $PROJECT_DIR/$PROJECT/config/config.txt $INSTALL/usr/share/bootloader
    elif [ -f $DISTRO_DIR/$DISTRO/config/config.txt ]; then
      cp -PRv $DISTRO_DIR/$DISTRO/config/config.txt $INSTALL/usr/share/bootloader
    else
      cp -PRv $PKG_DIR/files/3rdparty/bootloader/config.txt $INSTALL/usr/share/bootloader
    fi
}
