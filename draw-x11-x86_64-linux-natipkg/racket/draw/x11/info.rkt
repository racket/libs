#lang setup/infotab

(define install-platform "x86_64-linux-natipkg")

(define copy-foreign-libs
  '("libXrender.so.1"
    "libXext.so.6"
    "libX11.so.6"
    "libxcb.so.1"
    "libxcb-render.so.0"
    "libxcb-shm.so.0"
    "libXau.so.6"))
