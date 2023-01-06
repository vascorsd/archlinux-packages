editor := env_var_or_default("EDITOR", "helix")

_default:
  just --list

edit:
  {{ editor }} {{ invocation_directory() }}/PKGBUILD

generate-package:
  cd {{ invocation_directory() }}; makepkg --clean --cleanbuild

generate-srcinfo:
  cd {{ invocation_directory() }}; makepkg --printsrcinfo > .SRCINFO

generate-integrity:
  cd {{ invocation_directory() }}; makepkg --geninteg

add-to-repo:
  cd {{ invocation_directory() }}; repoctl add -m *.pkg.tar.zst