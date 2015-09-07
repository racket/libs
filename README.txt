This repository contains pre-built libraries for Racket on various
platforms.

The repository directories are in the form of Racket packages, but the
packages are registered at "http://pkgs.racket-lang.org/" in ".zip"
form so that downloading libraries for a particular platform doesn't
require downloading all of them.

The "pack-and-upload.rkt" script re-packs libraries into ".zip" form
and updates the catalog, so that script needs to be run when the
libraries change. The script needs a source directory (this one) and a
work directory (which can be re-used for incremental work), and by
default the script updates the "http://pkgs.racket-lang.org/" catalog
and the "racket-packages" S3 bucket. The bucket uses a format that
ensures that old ".zip" files are kept for at least a week. Use the
`--dry-run` flag to check what will happen.

The "pack-all.rkt" script is used by "pack-and-upload.rkt".
