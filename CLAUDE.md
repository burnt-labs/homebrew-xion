# homebrew-xion — CLAUDE.md

Homebrew tap for the `xiond` CLI. Provides `brew install burnt-labs/xion/xiond`.

## Repository Structure

```
Casks/
  xiond.rb            # Latest stable release (written by GoReleaser on release)
  xiond@MAJOR.rb      # Major-version pinned casks (e.g., xiond@31.rb)
  xiond@VERSION.rb    # Full-version pinned casks (e.g., xiond@31.0.2.rb)
Formula/
  xiond@VERSION.rb    # Releases before v29 (and 29.0.0 / rcs); frozen, no new files
tap_migrations.json   # Moves the retired xiond, xiond@29, xiond@29.0.1 formulae to the casks
generate.sh           # Legacy formula generation helper
lib/                  # Legacy formula helpers
```

Since v30 every stable release ships as a cask. Do not add `Formula/xiond.rb`
or any formula whose name matches a cask: Homebrew resolves the formula first,
so anyone who has it installed stops receiving upgrades. The `xiond`,
`xiond@29` and `xiond@29.0.1` formulae were retired for that reason;
`tap_migrations.json` lists them with the tap name (`"burnt-labs/xion"`), the
form Homebrew needs to recognise a same-tap formula-to-cask migration.

## GitHub Workflows

### `install.yml`

**Triggered by:** PRs to main, push to main, manual dispatch

- `install`: runs `brew install xiond@<version>` (formula or cask) for every
  pinned name, plus `brew install xiond`.
- `migrate-formula-to-cask`: installs the old `xiond` / `xiond@29` formula from
  the last tap commit that shipped it, updates the tap to the commit under test
  and checks that `brew update` replaced it with the cask.

### `tests.yml`

**Triggered by:** Manual dispatch

Runs `brew test-bot` for full formula testing.

### `publish.yml`

**Triggered by:** Pull request labeled (Homebrew bot integration)

### `claude-code-review.yml` / `claude.yml`

Claude AI PR review and code agent.

## Upstream Triggers

| Source | Method | Condition |
|--------|--------|-----------|
| `burnt-labs/xion` | GoReleaser (`homebrew_casks`) via `HOMEBREW_TAP_TOKEN` opens a `xiond-vX.Y.Z` PR | Stable release created (rc tags are skipped) |

## Downstream Triggers

None.

## Updating Manually

```bash
# Update a cask: edit Casks/xiond.rb, Casks/xiond@MAJOR.rb, Casks/xiond@VERSION.rb
# Checksums are in: https://github.com/burnt-labs/xion/releases/download/vX.Y.Z/xiond-X.Y.Z-checksums.txt
```

## Secrets Required

| Secret | Purpose |
|--------|---------|
| `GITHUB_TOKEN` | Workflow checkout |
