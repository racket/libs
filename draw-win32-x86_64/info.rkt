#lang setup/infotab
;; SPDX-License-Identifier: (Apache-2.0 OR MIT)

(define collection 'multi)
(define deps '("base"))

(define pkg-desc "native libraries for \"draw\" package")

(define pkg-authors '(mflatt))

(define license
  '((Apache-2.0 OR MIT) ;; Racket code
    AND
    (MIT ;; part of fontconfig
     AND
     (MIT-Modern-Variant ;; part of fontconfig
      AND
      (LGPL-2.1-or-later ;; Glib, Pango, libintl
       AND
       (LGPL-2.0-or-later ;; some libintl files
        AND
        ((LGPL-2.1-only OR MPL-1.1) ;; Cairo
         AND
         (HPND-sell-variant ;; fontconfig
          AND
          (Unicode-DFS-2016 ;; part of fontconfig
           AND
           (Libpng ;; libpng (obviously)
            AND
            IJG)))))))))) ;; libjpeg

;; additionally, fontconfig/src/fcmd5.h and
;; fontconfig/src/ftglue.{c,h} are placed in the public domain
;; using non-standardized language.
