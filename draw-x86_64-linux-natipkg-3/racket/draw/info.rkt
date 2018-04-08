#lang setup/infotab

(define install-platform "x86_64-linux-natipkg")

(define copy-foreign-libs
  '("libz.so.1"
    "libuuid.so.1"
    "libjpeg.so.9"
    "libpng16.so.16"
    "libpixman-1.so.0"
    "libcairo.so.2"
    "libfreetype.so.6"
    "libfontconfig.so.1"
    "libexpat.so.1"
    "libpangoft2-1.0.so.0"
    "libpangocairo-1.0.so.0"
    "libpango-1.0.so.0"
    "libfribidi.so.0"
    "libharfbuzz.so.0"
    "libgobject-2.0.so.0"
    "libglib-2.0.so.0"
    "libgthread-2.0.so.0"
    "libgmodule-2.0.so.0"
    "libgio-2.0.so.0"
    "libffi.so.6"))
