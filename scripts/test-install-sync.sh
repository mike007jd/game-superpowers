#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

assert_symlink_target() {
  local path="${1:?path is required}"
  local expected="${2:?expected is required}"
  [ -L "$path" ] || {
    echo "expected symlink: $path" >&2
    exit 1
  }

  local actual
  actual="$(readlink "$path")"
  [ "$actual" = "$expected" ] || {
    echo "unexpected symlink target for $path: $actual" >&2
    exit 1
  }
}

assert_contains() {
  local path="${1:?path is required}"
  local needle="${2:?needle is required}"
  grep -Fq "$needle" "$path" || {
    echo "expected $path to contain: $needle" >&2
    exit 1
  }
}

assert_not_contains() {
  local path="${1:?path is required}"
  local needle="${2:?needle is required}"
  if [ -f "$path" ] && grep -Fq "$needle" "$path"; then
    echo "did not expect $path to contain: $needle" >&2
    exit 1
  fi
}

export HOME="$TMP_DIR/home"
mkdir -p "$HOME"
export GAME_SUPERPOWERS_GIT_DIR="$TMP_DIR/git"
mkdir -p "$GAME_SUPERPOWERS_GIT_DIR/hooks"

bash "$REPO_DIR/scripts/install-claude-skills.sh" >/dev/null
assert_symlink_target \
  "$HOME/.claude/skills/using-game-superpowers" \
  "$REPO_DIR/skills/using-game-superpowers"
assert_contains "$GAME_SUPERPOWERS_GIT_DIR/hooks/post-merge" "sync-all-skills.sh --quiet"
assert_contains "$GAME_SUPERPOWERS_GIT_DIR/hooks/post-checkout" "sync-all-skills.sh --quiet"
assert_contains "$GAME_SUPERPOWERS_GIT_DIR/game-superpowers-installed-hosts" "claude"

printf 'obsolete\n' > "$HOME/.claude/.game-superpowers-managed-skills"
ln -s "$REPO_DIR/skills/using-game-superpowers" "$HOME/.claude/skills/obsolete"
bash "$REPO_DIR/scripts/install-claude-skills.sh" >/dev/null
[ ! -e "$HOME/.claude/skills/obsolete" ] || {
  echo "expected stale Claude entry to be removed" >&2
  exit 1
}

bash "$REPO_DIR/scripts/install-codex-skills.sh" >/dev/null
assert_symlink_target \
  "$HOME/.agents/skills/game-superpowers/using-game-superpowers" \
  "$REPO_DIR/skills/using-game-superpowers"
assert_contains "$GAME_SUPERPOWERS_GIT_DIR/game-superpowers-installed-hosts" "codex"

ln -s "$REPO_DIR/skills/using-game-superpowers" "$HOME/.agents/skills/game-superpowers/obsolete"
bash "$REPO_DIR/scripts/install-codex-skills.sh" >/dev/null
[ ! -e "$HOME/.agents/skills/game-superpowers/obsolete" ] || {
  echo "expected stale Codex entry to be removed" >&2
  exit 1
}

bash "$REPO_DIR/scripts/uninstall-claude-skills.sh" >/dev/null
assert_contains "$GAME_SUPERPOWERS_GIT_DIR/game-superpowers-installed-hosts" "codex"
assert_contains "$GAME_SUPERPOWERS_GIT_DIR/hooks/post-merge" "sync-all-skills.sh --quiet"

bash "$REPO_DIR/scripts/uninstall-codex-skills.sh" >/dev/null
[ ! -f "$GAME_SUPERPOWERS_GIT_DIR/game-superpowers-installed-hosts" ] || {
  echo "expected installed host state to be removed" >&2
  exit 1
}
assert_not_contains "$GAME_SUPERPOWERS_GIT_DIR/hooks/post-merge" "sync-all-skills.sh --quiet"
assert_not_contains "$GAME_SUPERPOWERS_GIT_DIR/hooks/post-checkout" "sync-all-skills.sh --quiet"

echo "install-sync tests passed"
