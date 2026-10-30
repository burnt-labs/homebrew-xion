# homebrew-xion

Homebrew casks for the Xion Daemon

## Install

```bash
$ brew tap burnt-labs/xion
$ brew install xiond
```

`brew install xiond` installs the latest stable release. `xiond@<major>` and
`xiond@<version>` pin a release line or an exact release, back to v4
(`brew install xiond@28.1.0`, `brew install xiond@14`). Every one is a cask, and
each installs the same `xiond` binary, so only one can be installed at a time:
`brew uninstall --cask` the current one before installing another.

## Why casks

`xiond` is shipped as prebuilt binaries, and casks are Homebrew's mechanism
for prebuilt binaries; formulae are meant to build from source. GoReleaser,
which publishes this tap from [burnt-labs/xion](https://github.com/burnt-labs/xion),
deprecated its `brews` (formula) publisher in favour of `homebrew_casks` in
[v2.10](https://goreleaser.com/blog/goreleaser-v2.10/), fully deprecated it in
[v2.16](https://goreleaser.com/blog/goreleaser-v2.16/) and plans to remove it in
v3. xion switched in [burnt-labs/xion#568](https://github.com/burnt-labs/xion/pull/568),
so every release since v30 is a cask. The older releases were converted to
casks with the same names and versions, and the tap has no formulae.

## macOS quarantine

`xiond` is not notarized by Apple, so macOS would refuse to run a copy
downloaded from the internet (the process is killed on launch). Every cask in
this tap removes the `com.apple.quarantine` attribute from the `xiond` it
installs, in a `postflight` hook, so no manual `xattr` step is needed after
`brew install` or `brew upgrade`.

This means Gatekeeper does not check `xiond` when it is installed from this
tap. Notarizing the release binaries is the real fix; until then, install only
from `burnt-labs/xion`, which pins each release's sha256.

## Upgrading from a formula

Older versions of this tap installed `xiond`, `xiond@<major>` and
`xiond@<version>` as formulae. The tap migrates each one to the cask of the
same name on the next `brew update` (which `brew upgrade` runs first): Homebrew
unlinks the formula, installs the cask and asks you to remove the old keg.
`NAME` below is the formula you had installed, for example `xiond` or
`xiond@28.1.0`.

```bash
$ brew uninstall --formula --force NAME
```

If Homebrew prints the commands instead of running them (the cask is not
trusted yet, or you have never installed a cask), migrate by hand. Remove the
formula first, otherwise the cask cannot link `xiond` and the old binary stays
on your `PATH`:

```bash
$ brew uninstall --formula --force NAME
$ brew trust --cask burnt-labs/xion/NAME
$ brew install --cask burnt-labs/xion/NAME
```

If you had several `xiond` formulae installed, only the first is replaced by
its cask; the others fail with `It seems there is already a Binary`. Remove
them with `brew uninstall --formula --force`.

`xiond@25.1.0-rc1`, `xiond@26.1.0-rc1`, `xiond@26.1.0-rc2`,
`xiond@27.0.0-rc1` and `xiond@28.0.1` have no cask: their releases no longer
exist on GitHub. An installed copy keeps working; remove it with
`brew uninstall --formula --force NAME` and install another version.

## Troubleshooting

If you have previously used this tap for a version prior to 12.0.0 uninstall any previous versions install via brew and then untap.  After this proceed to install as described above.

```bash
$ brew uninstall xiond
$ brew untap burnt-labs/xion
```

## Checksums

```bash
$ scripts/check-cask-checksums.py
```

checks every cask's `sha256` against the checksums file published with its
xion release. CI runs it on every pull request.

## Linting

```bash
$ brew style burnt-labs/xion --fix
```
