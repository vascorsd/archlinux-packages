editor := env_var("EDITOR")
here := invocation_directory()

_default:
  just --list

edit:
  cd {{ here }} && \
    {{ editor }} PKGBUILD

generate-package *other-flags:
  cd {{ here }} && \
    makepkg --clean --cleanbuild {{ other-flags }}

generate-srcinfo:
  cd {{ here }} && \
    makepkg --printsrcinfo > .SRCINFO

re-generate-integrity:
  cd {{ here }} && \
    updpkgsums

add-to-repo:
  cd {{ here }} && \
    repoctl add -m *.pkg.tar.zst