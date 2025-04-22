# homebrew-xion

Homebrew formula for the Xion Daemon

## Install

```bash
$ brew tap burnt-labs/xion
$ brew install xiond
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
