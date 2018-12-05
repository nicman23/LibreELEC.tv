# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="containerd"
PKG_VERSION="aa8187d"
PKG_ARCH="any"
PKG_LICENSE="APL"
PKG_SITE="https://containerd.tools/"
PKG_URL="https://github.com/docker/containerd/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain go:host"
PKG_SECTION="system"
PKG_SHORTDESC="containerd is a daemon to control runC"
PKG_LONGDESC="containerd is a daemon to control runC, built for performance and density. containerd leverages runC's advanced features such as seccomp and user namespace support as well as checkpoint and restore for cloning and live migration of containers."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  case $TARGET_ARCH in
    x86_64)
      export GOARCH=amd64
      ;;
    arm)
      export GOARCH=arm

      case $TARGET_CPU in
        arm1176jzf-s)
          export GOARM=6
          ;;
        *)
          export GOARM=7
          ;;
      esac
      ;;
    aarch64)
      export GOARCH=arm64
      ;;
  esac

  export GOOS=linux
  export CGO_ENABLED=1
  export CGO_NO_EMULATION=1
  export CGO_CFLAGS=$CFLAGS
  export LDFLAGS="-w -extldflags -static -X github.com/docker/containerd.GitCommit=${PKG_VERSION} -extld $CC"
  export GOLANG=$TOOLCHAIN/lib/golang/bin/go
  export GOPATH=$PKG_BUILD.gopath:$PKG_BUILD/vendor/
  export GOROOT=$TOOLCHAIN/lib/golang
  export PATH=$PATH:$GOROOT/bin

  ln -fs $PKG_BUILD $PKG_BUILD/vendor/src/github.com/docker/containerd
}

make_target() {
  mkdir -p bin
  $GOLANG build -v -o bin/containerd      -a -tags "static_build no_btrfs" -ldflags "$LDFLAGS" ./cmd/containerd
  $GOLANG build -v -o bin/containerd-shim -a -tags "static_build no_btrfs" -ldflags "$LDFLAGS" ./cmd/containerd-shim
}

makeinstall_target() {
  :
}
