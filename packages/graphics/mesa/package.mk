# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mesa"
PKG_VERSION="17.1.3"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.mesa3d.org/"
PKG_URL="https://mesa.freedesktop.org/archive/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain Python:host expat glproto dri2proto presentproto libdrm libXext libXdamage libXfixes libXxf86vm libxcb libX11 systemd dri3proto libxshmfence openssl"
PKG_SECTION="graphics"
PKG_SHORTDESC="mesa: 3-D graphics library with OpenGL API"
PKG_LONGDESC="Mesa is a 3-D graphics library with an API which is very similar to that of OpenGL*. To the extent that Mesa utilizes the OpenGL command syntax or state machine, it is being used with authorization from Silicon Graphics, Inc. However, the author makes no claim that Mesa is in any way a compatible replacement for OpenGL or associated with Silicon Graphics, Inc. Those who want a licensed implementation of OpenGL should contact a licensed vendor. While Mesa is not a licensed OpenGL implementation, it is currently being tested with the OpenGL conformance tests. For the current conformance status see the CONFORM file included in the Mesa distribution."

get_graphicdrivers

PKG_MESON_OPTS_TARGET="-Ddri-drivers=$DRI_DRIVERS \
                       -Dgallium-drivers=$GALLIUM_DRIVERS \
                       -Dgallium-extra-hud=false \
                       -Dgallium-xvmc=false \
                       -Dgallium-omx=disabled \
                       -Dgallium-nine=false \
                       -Dgallium-opencl=disabled \
                       -Dvulkan-drivers= \
                       -Dshader-cache=true \
                       -Dshared-glapi=true \
                       -Dopengl=true \
                       -Dgbm=true \
                       -Degl=true \
                       -Dglvnd=false \
                       -Dasm=true \
                       -Dvalgrind=false \
                       -Dlibunwind=false \
                       -Dlmsensors=false \
                       -Dbuild-tests=false \
                       -Dselinux=false \
                       -Dosmesa=none"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET xorgproto libXext libXdamage libXfixes libXxf86vm libxcb libX11 libxshmfence libXrandr"
  export X11_INCLUDES=
  PKG_MESON_OPTS_TARGET+=" -Dplatforms=x11,drm -Ddri3=true -Dglx=dri"
elif [ "$DISPLAYSERVER" = "weston" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET wayland wayland-protocols"
  PKG_MESON_OPTS_TARGET+=" -Dplatforms=wayland,drm -Ddri3=false -Dglx=disabled"
else
  PKG_MESON_OPTS_TARGET+=" -Dplatforms=drm -Ddri3=false -Dglx=disabled"
fi

if [ "$LLVM_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET elfutils llvm"
  export LLVM_CONFIG="$SYSROOT_PREFIX/usr/bin/llvm-config-host"
  PKG_MESON_OPTS_TARGET+=" -Dllvm=true"
else
  PKG_MESON_OPTS_TARGET+=" -Dllvm=false"
fi

if [ "$VDPAU_SUPPORT" = "yes" -a "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libvdpau"
  PKG_MESON_OPTS_TARGET+=" -Dgallium-vdpau=true"
else
  PKG_MESON_OPTS_TARGET+=" -Dgallium-vdpau=false"
fi

if [ "$VAAPI_SUPPORT" = "yes" ] && listcontains "$GRAPHIC_DRIVERS" "(r600|radeonsi)"; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libva"
  PKG_MESON_OPTS_TARGET+=" -Dgallium-va=true"
else
  PKG_MESON_OPTS_TARGET+=" -Dgallium-va=false"
fi

if listcontains "$GRAPHIC_DRIVERS" "vmware"; then
  PKG_MESON_OPTS_TARGET+=" -Dgallium-xa=true"
else
  PKG_MESON_OPTS_TARGET+=" -Dgallium-xa=false"
fi

if [ "$OPENGLES_SUPPORT" = "yes" ]; then
  PKG_MESON_OPTS_TARGET+=" -Dgles1=false -Dgles2=true"
else
  PKG_MESON_OPTS_TARGET+=" -Dgles1=false -Dgles2=false"
fi
 
PKG_CONFIGURE_OPTS_TARGET="CC_FOR_BUILD=$HOST_CC \
                           CXX_FOR_BUILD=$HOST_CXX \
                           CFLAGS_FOR_BUILD= \
                           CXXFLAGS_FOR_BUILD= \
                           LDFLAGS_FOR_BUILD= \
                           X11_INCLUDES= \
                           DRI_DRIVER_INSTALL_DIR=$XORG_PATH_DRI \
                           DRI_DRIVER_SEARCH_DIR=$XORG_PATH_DRI \
                           --disable-debug \
                           --disable-mangling \
                           --enable-texture-float \
                           --enable-asm \
                           --disable-selinux \
                           --enable-opengl \
                           --disable-gles1 \
                           $MESA_GLES \
                           --enable-dri \
                           --enable-dri3 \
                           --enable-glx \
                           --disable-osmesa \
                           --disable-gallium-osmesa \
                           --enable-egl --with-egl-platforms=x11,drm \
                           $XA_CONFIG \
                           --enable-gbm \
                           --disable-nine \
                           --disable-xvmc \
                           $MESA_VDPAU \
                           --disable-omx \
                           --disable-va \
                           --disable-opencl \
                           --enable-opencl-icd \
                           --disable-gallium-tests \
                           --enable-shared-glapi \
                           --enable-driglx-direct \
                           --enable-glx-tls \
                           $MESA_GALLIUM_LLVM \
                           --disable-silent-rules \
                           --with-gl-lib-name=GL \
                           --with-osmesa-lib-name=OSMesa \
                           --with-gallium-drivers=$GALLIUM_DRIVERS \
                           --with-dri-drivers=$DRI_DRIVERS \
                           --with-vulkan-drivers=no \
                           --with-sysroot=$SYSROOT_PREFIX"

# Temporary workaround:
# Listed libraries are static, while mesa expects shared ones. This breaks the
# dependency tracking. The following has some ideas on how to address that.
# https://github.com/LibreELEC/LibreELEC.tv/pull/2163
pre_configure_target() {
  export LIBS="-lxcb-dri3 -lxcb-dri2 -lxcb-xfixes -lxcb-present -lxcb-sync -lxshmfence -lz"
}

post_makeinstall_target() {
  # rename and relink to cooperate with nvidia drivers
    rm -rf $INSTALL/usr/lib/libGL.so
    rm -rf $INSTALL/usr/lib/libGL.so.1
    ln -sf libGL.so.1 $INSTALL/usr/lib/libGL.so
    ln -sf /var/lib/libGL.so $INSTALL/usr/lib/libGL.so.1
    mv $INSTALL/usr/lib/libGL.so.1.2.0 $INSTALL/usr/lib/libGL_mesa.so.1
  fi
}
