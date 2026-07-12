#lang setup/infotab
;; SPDX-License-Identifier: (Apache-2.0 OR MIT)

(define install-platform "win32\\arm64")

(define copy-foreign-libs
  '("brotlicommon.dll"
    "brotlidec.dll"
    "bz2.dll"
    "cairo-2.dll"
    "ffi-8.dll"
    "fontconfig-1.dll"
    "freetype.dll"
    "fribidi-0.dll"
    "gio-2.0-0.dll"
    "glib-2.0-0.dll"
    "gmodule-2.0-0.dll"
    "gobject-2.0-0.dll"
    "harfbuzz.dll"
    "intl-8.dll"
    "jpeg8.dll"
    "libexpat.dll"
    "libpng16.dll"
    "pango-1.0-0.dll"
    "pangocairo-1.0-0.dll"
    "pangoft2-1.0-0.dll"
    "pangowin32-1.0-0.dll"
    "pcre2-8.dll"
    "pixman-1-0.dll"
    "zlib1.dll"))
