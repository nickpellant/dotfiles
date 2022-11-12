#!/usr/bin/env bash

{{ if eq .chezmoi.os "darwin" -}}
set -e

case `grep -F "pam_tid" /etc/pam.d/sudo >/dev/null; echo $?` in
  0)
    echo "TouchID is already enabled for sudo"
    exit 0
    ;;
  1)
    sudo sed -i '' '1a\
auth       sufficient     pam_tid.so
    ' /etc/pam.d/sudo

    echo "TouchID is now enabled for sudo"
    ;;
  *)
    echo "Error trying to read /etc/pam.d/sudo"
    ;;
esac
{{ end -}}
