# homebrew-xion — CLAUDE.md

Homebrew tap for the `xiond` CLI. Provides `brew install burnt-labs/xion/xiond`.

## Repository Structure

```
Casks/
  xiond.rb            # Latest stable release (written by GoReleaser on release)
  xiond@MAJOR.rb      # Major-version pinned casks (e.g., xiond@31.rb)
  xiond@VERSION.rb    # Full-version pinned casks (e.g., xiond@31.0.2.rb)
tap_migrations.json   # Moves every retired formula to the cask of the same name
scripts/
  check-cask-checksums.py  # Checks each cask's sha256 against its release
```

The tap is casks only: there is no `Formula/` directory, and none may be
added. Homebrew resolves a formula before a cask of the same name, so a formula
next to a cask stops its users from receiving upgrades.

Releases from v30 are written by GoReleaser. The older releases (v4 to v29.0.1,
including rcs) were converted from the formulae that used to live in
`Formula/`; they are frozen. Most v12 to v14 releases shipped bare binaries
(`xiond-darwin-arm64`, ...) rather than archives, so their casks use
`binary "xiond-#{os}-#{arch}", target: "xiond"`. Five formulae had no release
left on GitHub (v25.1.0-rc1, v26.1.0-rc1, v26.1.0-rc2, v27.0.0-rc1, v28.0.1)
and have no cask.

`tap_migrations.json` lists every retired formula that has a cask, with the
tap name (`"burnt-labs/xion"`) as the value: that is the form Homebrew needs to
recognise a same-tap formula-to-cask migration. A fully qualified value such as
`"burnt-labs/xion/xiond"` is silently ignored.

## Why casks

`xiond` ships as prebuilt binaries. Casks are Homebrew's mechanism for those;
formulae are meant to build from source. GoReleaser deprecated `brews` in
favour of `homebrew_casks` in v2.10
(https://goreleaser.com/blog/goreleaser-v2.10/), fully deprecated it in v2.16
(https://goreleaser.com/blog/goreleaser-v2.16/) and plans to remove it in v3.
xion switched its release config from `brews:` to `homebrew_casks:` in
https://github.com/burnt-labs/xion/pull/568.

## GitHub Workflows

### `install.yml`

**Triggered by:** PRs to main, push to main, manual dispatch

- `checksums`: runs `scripts/check-cask-checksums.py`.
- `casks` / `install`: `brew install --cask` for every file in `Casks/` on
  macOS and Ubuntu, then checks `xiond version` matches the cask version.
- `migrate-formula-to-cask`: installs a sample of retired formulae (`xiond`,
  `xiond@29`, `xiond@29.0.1`, the oldest, a bare-binary release, an rc and
  29.0.0) from the last tap commit that shipped them, updates the tap to the
  commit under test and checks that `brew update` replaced each with its cask.

### `tests.yml`

**Triggered by:** Manual dispatch

Runs `brew test-bot --only-tap-syntax`.

### `claude-code-review.yml` / `claude.yml`

Claude AI PR review and code agent.

## Upstream Triggers

| Source | Method | Condition |
|--------|--------|-----------|
| `burnt-labs/xion` | GoReleaser Pro (`homebrew_casks` with `alternative_names` `xiond@{{ .Version }}` and `xiond@{{ .Major }}`) via `HOMEBREW_TAP_TOKEN` opens a `xiond-vX.Y.Z` PR with the three casks | Stable release created (rc tags are skipped) |

## Downstream Triggers

None.

## Updating Manually

```bash
# Update a cask: edit Casks/xiond.rb, Casks/xiond@MAJOR.rb, Casks/xiond@VERSION.rb
# Checksums are in: https://github.com/burnt-labs/xion/releases/download/vX.Y.Z/xiond-X.Y.Z-checksums.txt
scripts/check-cask-checksums.py Casks/xiond@X.Y.Z.rb
```

## Secrets Required

| Secret | Purpose |
|--------|---------|
| `GITHUB_TOKEN` | Workflow checkout |
