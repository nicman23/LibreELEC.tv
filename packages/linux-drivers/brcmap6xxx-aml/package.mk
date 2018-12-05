# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="brcmap6xxx-aml"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/wifi/"
PKG_VERSION="de3f5c5"
PKG_URL="https://github.com/openwetek/brcmap6xxx-aml/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux wlan-firmware-aml"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="brcmap6xxx-aml: Linux drivers for AP6xxx WLAN chips used in some devices based on Amlogic SoCs"
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

make_target() {
  cd bcmdhd_1_201_59_x
  LDFLAGS="" make V=1 \
    -C $(kernel_path) M=$PKG_BUILD/bcmdhd_1_201_59_x \
    ARCH=$TARGET_KERNEL_ARCH \
    CROSS_COMPILE=$TARGET_KERNEL_PREFIX
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/bcmdhd
  cp *.ko $INSTALL/$(get_full_module_dir)/bcmdhd

  mkdir -p $INSTALL/$(get_full_firmware_dir)/brcm
  cp $PKG_DIR/config/config.txt $INSTALL/$(get_full_firmware_dir)/brcm
}
