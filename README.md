# libs

This repository contains pre-built libraries for Racket on various
platforms.

The repository directories are in the form of Racket packages, but the
packages are registered at "http://pkgs.racket-lang.org/" in `.zip`
form so that downloading libraries for a particular platform doesn't
require downloading all of them.

The `pack-and-upload.rkt` script re-packs libraries into `.zip` form
and updates the catalog, so that script needs to be run when the
libraries change. The script needs a source directory (this one) and a
work directory (which can be re-used for incremental work), and by
default the script updates the "http://pkgs.racket-lang.org/" catalog
and the "racket-packages" S3 bucket. The bucket uses a format that
ensures that old `.zip` files are kept for at least a week. Use the
`--dry-run` flag to check what will happen.

The `pack-all.rkt` script is used by `pack-and-upload.rkt`.

### License

This repository distributes 3rd-party libraries, which are all free
software but distributed under a variety of licenses. See the LICENSE
or LICENSE.txt file in each sub-directory for more information.

The Racket code in this repository is distributed under the [MIT]
license, or the [Apache 2.0] license, at your option.

By making a contribution, you are agreeing that your contribution
is licensed under the [Apache 2.0] license and the [MIT] license.

[MIT]: https://github.com/racket/racket/blob/master/racket/src/LICENSE-MIT.txt
[Apache 2.0]: https://www.apache.org/licenses/LICENSE-2.0.txt
