# homebrew-xion — CLAUDE.md

Homebrew tap for the `xiond` CLI. Provides `brew install burnt-labs/xion/xiond`.

## Repository Structure

```
Formula/
  xiond.rb          # Latest stable formula (updated automatically on release)
  xiond@MAJOR.rb    # Major-version pinned formulas (e.g., xiond@25.rb)
  xiond@VERSION.rb  # Full-version pinned formulas (e.g., xiond@25.0.2.rb)
generate.sh         # Formula generation helper
lib/                # Shared formula helpers
```

## GitHub Workflows

### `update-release.yaml` (primary update mechanism)

**Triggered by:**
- `repository_dispatch` event type: `homebrew-release-trigger`
- `workflow_dispatch` — manual with inputs: `tag_name`, `release_name`

**What it does:**
1. Downloads release assets from `burnt-labs/xion`
2. Extracts sha256 checksums for each platform
3. Updates `Formula/xiond.rb`, `Formula/xiond@MAJOR.rb`, `Formula/xiond@VERSION.rb`
4. Creates or updates a PR

> **Note:** GoReleaser in `burnt-labs/xion` also updates `Formula/xiond.rb` directly via `HOMEBREW_TAP_TOKEN` when a release is published. The `update-release.yaml` workflow provides an alternative/fallback trigger.

### `install.yml`

**Triggered by:** PRs to main, push to main, manual dispatch

Runs `brew install` to verify formula validity.

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
| `burnt-labs/xion` | GoReleaser via `HOMEBREW_TAP_TOKEN` | Stable release published |
| `burnt-labs/xion` | `repository_dispatch: homebrew-release-trigger` | Stable release published |

## Downstream Triggers

None.

## Updating Manually

```bash
# Update formula version
# Edit Formula/xiond.rb — change version, URLs, and sha256 hashes
# Checksums are in: https://github.com/burnt-labs/xion/releases/download/vX.Y.Z/xiond-X.Y.Z-checksums.txt
```

## Secrets Required

| Secret | Purpose |
|--------|---------|
| `BURNT_PAT_GITHUB_ACTIONS_TOKEN` | Push formula updates |
| `GITHUB_TOKEN` | PR creation |
