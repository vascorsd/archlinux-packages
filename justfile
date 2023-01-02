
_default:
  just --list

edit:
  helix {{ invocation_directory() }}/PKGBUILD

generate-srcinfo:
  cd {{ invocation_directory() }}; makepkg --printsrcinfo > .SRCINFO

generate-integrity:
  cd {{ invocation_directory() }}; makepkg --geninteg

add-to-repo:
  cd {{ invocation_directory() }}; repoctl add -m *.pkg.tar.zst