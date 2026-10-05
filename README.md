# homebrew-xion

Homebrew formula for the Xion Daemon

## Install

```bash
$ brew tap burnt-labs/xion
$ brew install xiond
```

Since v30, `xiond` ships as a cask. `brew install xiond` installs the latest
stable release; `xiond@<major>` and `xiond@<version>` pin a release line or an
exact release. Releases before v29 remain available as formulae
(`brew install xiond@28.1.0`).

## Upgrading from the `xiond` formula

The `xiond` formula stopped at 29.0.1, and `xiond@29` / `xiond@29.0.1` are now
casks too. The tap migrates these formulae to the casks on the next
`brew update` (which `brew upgrade` runs first): Homebrew unlinks the formula,
installs the cask and asks you to remove the old keg:

```bash
$ brew uninstall --formula --force xiond
```

If Homebrew prints the commands instead of running them (the cask is not
trusted yet, or you have never installed a cask), migrate by hand. Remove the
formula first, otherwise the cask cannot link `xiond` and the old binary stays
on your `PATH`:

```bash
$ brew uninstall --formula --force xiond
$ brew trust --cask burnt-labs/xion/xiond
$ brew install --cask burnt-labs/xion/xiond
```

## Troubleshooting

If you have previously used this tap for a version prior to 12.0.0 uninstall any previous versions install via brew and then untap.  After this proceed to install as described above.

```bash
$ brew uninstall xiond
$ brew untap burnt-labs/xion
```

## Linting

```bash
$ brew style burnt-labs/xion --fix
```
