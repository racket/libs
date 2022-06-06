#lang setup/infotab
;; SPDX-License-Identifier: (Apache-2.0 OR MIT)

(define collection 'multi)
(define deps '("base"))

(define pkg-desc "native libraries for \"draw\" package")

(define pkg-authors '(mflatt))

(define license
  '((Apache-2.0 OR MIT) ;; Racket code
    AND
    (MIT ;; libffi, most of pixman
     AND
     (LGPL-2.1-or-later ;; Glib, Pango, libintl
      AND
      (LGPL-2.0-or-later ;; some libintl files
       AND
       ((LGPL-2.1-only OR MPL-1.1) ;; Cairo
        AND
        (HPND-sell-variant ;; part of pixman
         AND
         (FTL ;; part of pixman (may have been replaced)
          AND
          (Libpng ;; libpng (obviously)
           AND
           IJG))))))))) ;; libjpeg
