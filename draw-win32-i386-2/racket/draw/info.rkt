#lang setup/infotab
;; SPDX-License-Identifier: (Apache-2.0 OR MIT)

(define install-platform "win32\\i386")

(define copy-foreign-libs
  '("libpangowin32-1.0-0.dll"
    "zlib1.dll"
    "libjpeg-9.dll"
    "libpng16-16.dll"
    "libpixman-1-0.dll"
    "libcairo-2.dll"
    "libfreetype-6.dll"
    "libfontconfig-1.dll"
    "libexpat-1.dll"
    "libpangoft2-1.0-0.dll"
    "libpangocairo-1.0-0.dll"
    "libpango-1.0-0.dll"
    "libharfbuzz-0.dll"
    "libintl-8.dll"
    "libgobject-2.0-0.dll"
    "libglib-2.0-0.dll"
    "libgthread-2.0-0.dll"
    "libgmodule-2.0-0.dll"
    "libgio-2.0-0.dll"
    "libffi-6.dll"))
