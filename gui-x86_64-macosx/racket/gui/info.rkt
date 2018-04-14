#lang setup/infotab

(define install-platform "x86_64-macosx")

(define copy-foreign-libs
  '("MMTabBarView.framework"
    "PSMTabBarControl.framework"
    "libatk-1.0.0.dylib"))

(define compile-omit-paths
  '("MMTabBarView.framework" "PSMTabBarControl.framework"))
