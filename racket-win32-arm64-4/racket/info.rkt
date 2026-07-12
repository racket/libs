#lang setup/infotab
;; SPDX-License-Identifier: (Apache-2.0 OR MIT)

(define install-platform "win32\\arm64")

(define copy-foreign-libs
  '("ossl-modules"
    "libcrypto-3-arm64.dll"
    "libssl-3-arm64.dll"
    "iconv-2.dll"
    "vcruntime140.dll"
    "vcruntime140_1.dll"))
