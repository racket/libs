#lang racket
(require file/untgz
         file/zip)

(define packages
  (list
   ;; Core Libraries
   '[racket 
     "racket"
     [win32/i386
      "iconv.dll"
      "libeay32.dll"
      "ssleay32.dll"
      "longdouble.dll"]
     [win32/x86_64
      "libiconv-2.dll"
      "libeay32.dll"
      "ssleay32.dll"
      "longdouble.dll"]]
   ;; Math Libraries
   '[math
     "math"
     [i386-macosx
      "libgmp.10.dylib"
      "libmpfr.4.dylib"]
     [x86_64-macosx
      "libgmp.10.dylib"
      "libmpfr.4.dylib"]
     [ppc-macosx
      "libgmp.10.dylib"
      "libmpfr.4.dylib"]
     [win32/i386
      "libgmp-10.dll"
      "libmpfr-4.dll"]
     [win32/x86_64
      "libgmp-10.dll"
      "libmpfr-4.dll"]]
   ;; Drawing Libraries
   [list
    'draw
    "racket/draw"
    '[i386-macosx
      "libcairo.2.dylib"
      "libffi.5.dylib"
      "libintl.8.dylib"
      "libgio-2.0.0.dylib"
      "libjpeg.62.dylib"
      "libglib-2.0.0.dylib"
      "libpango-1.0.0.dylib"
      "libgmodule-2.0.0.dylib"
      "libpangocairo-1.0.0.dylib"
      "libgobject-2.0.0.dylib"
      "libpixman-1.0.dylib"
      "libgthread-2.0.0.dylib"
      "libpng15.15.dylib"]
    '[x86_64-macosx
      "libcairo.2.dylib"
      "libffi.5.dylib"
      "libintl.8.dylib"
      "libgio-2.0.0.dylib"
      "libjpeg.62.dylib"
      "libglib-2.0.0.dylib"
      "libpango-1.0.0.dylib"
      "libgmodule-2.0.0.dylib"
      "libpangocairo-1.0.0.dylib"
      "libgobject-2.0.0.dylib"
      "libpixman-1.0.dylib"
      "libgthread-2.0.0.dylib"
      "libpng15.15.dylib"]
    '[ppc-macosx
      "libcairo.2.dylib"
      "libffi.5.dylib"
      "libintl.8.dylib"
      "libgio-2.0.0.dylib"
      "libjpeg.62.dylib"
      "libglib-2.0.0.dylib"
      "libpango-1.0.0.dylib"
      "libgmodule-2.0.0.dylib"
      "libpangocairo-1.0.0.dylib"
      "libgobject-2.0.0.dylib"
      "libpixman-1.0.dylib"
      "libgthread-2.0.0.dylib"
      "libpng15.15.dylib"]
    '[win32/i386
      "libjpeg-7.dll"
      "libcairo-2.dll"
      "libpango-1.0-0.dll"
      "libexpat-1.dll"
      "libpng14-14.dll"
      "zlib1.dll"
      "freetype6.dll"
      "libfontconfig-1.dll"
      "libglib-2.0-0.dll"
      "libgobject-2.0-0.dll"
      "libgmodule-2.0-0.dll"
      "libpangocairo-1.0-0.dll"
      "libpangowin32-1.0-0.dll"
      "libpangoft2-1.0-0.dll"]
    '[win32/x86_64
      "libjpeg-8.dll"
      "libcairo-2.dll"
      "libpango-1.0-0.dll"
      "libexpat-1.dll"
      "libpng14-14.dll"
      "zlib1.dll"
      "libfreetype-6.dll"
      "libintl-8.dll"
      "libfontconfig-1.dll"
      "libglib-2.0-0.dll"
      "libgobject-2.0-0.dll"
      "libgmodule-2.0-0.dll"
      "libgthread-2.0-0.dll"
      "libpangocairo-1.0-0.dll"
      "libpangowin32-1.0-0.dll"
      "libpangoft2-1.0-0.dll"]]
   ;; GUI Libraries
   [list
    'gui
    "racket/gui"
    '[i386-macosx
      ["PSMTabBarControl.tgz" "PSMTabBarControl.framework"]]
    '[x86_64-macosx
      ["PSMTabBarControl.tgz" "PSMTabBarControl.framework"]]
    '[ppc-macosx
      ["PSMTabBarControl.tgz" "PSMTabBarControl.framework"]]
    (append
     '[win32/i386]
     (if (environment-variables-ref (current-environment-variables)
                                    #"PLT_WIN_GTK")
         '("libatk-1.0-0.dll"
           "libgtk-win32-2.0-0.dll"
           "libgdk-win32-2.0-0.dll"
           ["libgdk_pixbuf-2.0-0.dll" 252150]
           "libgio-2.0-0.dll"
           "libwimp.dll"
           "gtkrc")
         '()))
    '[win32/x86_64]]
   ;; Database libraries
   '[db
     "db"
     [win32/i386
      "sqlite3.dll"]
     [win32/x86_64
      "sqlite3.dll"]]
   ;; COM libraries
   '[com
     "com"
     [win32/i386
      "myssink.dll"]
     [win32/x86_64
      "myssink.dll"]]))

(unless (directory-exists? "pkgs")
  (make-directory "pkgs"))

(for ([set (in-list packages)])
  (define name (symbol->string (car set)))
  (define collect (cadr set))
  (for ([libs (in-list (cddr set))])
    (define dir (symbol->string (car libs)))
    (define platform (regexp-replace* #rx"/" dir "-"))
    (define pkg-name (format "~a-~a" name platform))
    (define stage-dir (build-path "pkgs" pkg-name))
    (make-directory stage-dir)
    (define dest (build-path stage-dir collect))
    (make-directory* dest)
    (for ([file (in-list (cdr libs))])
      (if (string? file)
          (copy-file (build-path dir file) (build-path dest file))
          (untgz (build-path dir (car file)) #:dest dest)))
    (call-with-output-file*
     (build-path dest "info.rkt")
     (lambda (o)
       (fprintf o "#lang setup/infotab\n")
       (write `(define copy-foreign-libs ',(for/list ([f (in-list (cdr libs))])
                                             (if (pair? f)
                                                 (cadr f)
                                                 f)))
              o)
       (newline o)))
    (let ([orig (current-directory)])
      (parameterize ([current-directory stage-dir])
        (apply zip
               (build-path orig "pkgs" (path-add-suffix pkg-name #".zip"))
               (directory-list))))
    (delete-directory/files stage-dir)))
