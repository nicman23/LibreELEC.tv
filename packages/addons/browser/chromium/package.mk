# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="chromium"
PKG_VERSION="1.0"
PKG_REV="100"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="browser"
PKG_SHORTDESC="Add-on removed"
PKG_LONGDESC="Add-on removed"
PKG_TOOLCHAIN="manual"

PKG_ADDON_BROKEN="Chromium is no longer maintained and has been superseded by Chrome."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Chromium"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_ADDON_PROVIDES="executable"

pre_make_target() {
  strip_lto

  sed -i -e 's/@WIDEVINE_VERSION@/Pinkie Pie/' third_party/widevine/cdm/stub/widevine_cdm_version.h
}

make_target() {
  export LDFLAGS="$LDFLAGS -ludev"
  export LD=$CXX

  # Use Python 2
  find . -name '*.py' -exec sed -i -r "s|/usr/bin/python$|$TOOLCHAIN/bin/python|g" {} +

  # Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
  # Note: These are for OpenELEC use ONLY. For your own distribution, please
  # get your own set of keys.

  _google_api_key=AIzaSyAQ6L9vt9cnN4nM0weaa6Y38K4eyPvtKgI
  _google_default_client_id=740889307901-4bkm4e0udppnp1lradko85qsbnmkfq3b.apps.googleusercontent.com
  _google_default_client_secret=9TJlhL661hvShQub4cWhANXa

  local _flags=(
    'is_clang=false'
    'clang_use_chrome_plugins=false'
    'symbol_level=0'
    'is_debug=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'linux_use_bundled_binutils=false'
    'use_allocator="none"'
    'use_cups=false'
    'use_gconf=false'
    'use_gnome_keyring=false'
    'use_gold=false'
    'use_gtk3=false'
    'use_kerberos=false'
    'use_pulseaudio=false'
    'use_sysroot=true'
    "target_sysroot=\"${SYSROOT_PREFIX}\""
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_nacl_nonsfi=false'
    "google_api_key=\"${_google_api_key}\""
    "google_default_client_id=\"${_google_default_client_id}\""
    "google_default_client_secret=\"${_google_default_client_secret}\""
  )

  # Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
  local _system_libs=(
    harfbuzz-ng
    libjpeg
    libpng
    libxslt
    yasm
  )

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_system_libs}; do
    find -type f -path "*third_party/$_lib/*" \
      \! -path "*third_party/$_lib/chromium/*" \
      \! -path "*third_party/$_lib/google/*" \
      \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py --system-libraries "${_system_libs}"
  ./third_party/libaddressinput/chromium/tools/update-strings.py

  ./tools/gn/bootstrap/bootstrap.py --gn-gen-args "${_flags[*]}"
  ./out/Release/gn gen out/Release --args="${_flags[*]}" --script-executable=$TOOLCHAIN/bin/python

  ninja -C out/Release chrome chrome_sandbox widevinecdmadapter
}

makeinstall_target() {
  :
}

addon() {
  :
}
