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

generate-integrity:
  cd {{ here }} && \
    updpkgsums

add-to-local-repo:
  cd {{ here }} && \
    repoctl add -m *.pkg.tar.zst

send-to-cloud:
  rclone sync --progress --verbose --copy-links \
    ~/shares/repo:~vascorsd fm.files:arch-repo

clean:
  cd {{ here }} && \
    git clean -Xdf
