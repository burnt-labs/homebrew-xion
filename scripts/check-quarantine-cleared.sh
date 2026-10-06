#!/usr/bin/env bash
# Checks, on macOS, that a cask's postflight hook removed the quarantine
# attribute from the installed xiond while Homebrew's quarantine was in effect.
#
#   scripts/check-quarantine-cleared.sh CASK
set -euo pipefail

cask="$1"
attr=com.apple.quarantine

if [[ "$(uname -s)" != Darwin ]]; then
  echo "not macOS: nothing to check"
  exit 0
fi

# Homebrew quarantines the download and carries the attribute to everything it
# stages from it. Without it this check would pass whether or not the hook ran.
download="$(brew --cache --cask "$cask")"
if ! xattr -p "$attr" "$download" >/dev/null; then
  echo "::error::$download is not quarantined, so the hook is not being tested"
  exit 1
fi
echo "download quarantined: $download"

bin="$(readlink -f "$(command -v xiond)")"
case "$bin" in
  */Caskroom/*) ;;
  *)
    echo "::error::xiond resolves to $bin, not into the Caskroom"
    exit 1
    ;;
esac
if xattr -p "$attr" "$bin" >/dev/null 2>&1; then
  echo "::error::$bin still has $attr: the postflight hook did not clear it"
  xattr -l "$bin"
  exit 1
fi
echo "installed binary not quarantined: $bin"

# The hook's command must also succeed when there is nothing to remove, or a
# reinstall of an already cleared binary would fail.
/usr/bin/xattr -dr "$attr" "$bin"
