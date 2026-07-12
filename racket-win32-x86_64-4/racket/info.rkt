#lang setup/infotab
;; SPDX-License-Identifier: (Apache-2.0 OR MIT)

(define install-platform "win32\\x86_64")

(define copy-foreign-libs
  '("longdouble.dll"
    "ossl-modules"
    "libcrypto-3-x64.dll"
    "libssl-3-x64.dll"
    "iconv-2.dll"
    "vcruntime140.dll"
    "vcruntime140_1.dll"))
