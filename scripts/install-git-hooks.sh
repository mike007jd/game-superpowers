#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=scripts/_install_state.sh
source "$REPO_DIR/scripts/_install_state.sh"

GIT_DIR="$(game_superpowers_git_dir "$REPO_DIR")"
if [ -z "$GIT_DIR" ]; then
  echo "skip: $REPO_DIR is not a git checkout, hooks were not installed"
  exit 0
fi

HOOKS_DIR="$GIT_DIR/hooks"
mkdir -p "$HOOKS_DIR"

BEGIN_MARKER="# >>> game-superpowers auto-sync >>>"
END_MARKER="# <<< game-superpowers auto-sync <<<"
SYNC_SCRIPT="$REPO_DIR/scripts/sync-all-skills.sh"
SYNC_SCRIPT_Q="$(printf '%q' "$SYNC_SCRIPT")"

strip_managed_block() {
  local path="${1:?path is required}"
  local tmp_file
  tmp_file="$(mktemp)"
  awk -v begin="$BEGIN_MARKER" -v end="$END_MARKER" '
    $0 == begin { skip = 1; next }
    $0 == end { skip = 0; next }
    !skip { print }
  ' "$path" > "$tmp_file"
  mv "$tmp_file" "$path"
}

ensure_managed_block() {
  local path="${1:?path is required}"

  if [ -f "$path" ]; then
    strip_managed_block "$path"
  else
    printf '#!/usr/bin/env bash\n' > "$path"
  fi

  if [ ! -s "$path" ]; then
    printf '#!/usr/bin/env bash\n' > "$path"
  fi

  if [ "$(tail -c 1 "$path" 2>/dev/null || true)" != "" ]; then
    printf '\n' >> "$path"
  fi

  cat >> "$path" <<EOF
$BEGIN_MARKER
if [ -x $SYNC_SCRIPT_Q ]; then
  $SYNC_SCRIPT_Q --quiet
fi
$END_MARKER
EOF
  chmod +x "$path"
}

remove_managed_block() {
  local path="${1:?path is required}"
  [ -f "$path" ] || return 0
  strip_managed_block "$path"
}

if game_superpowers_has_state "$REPO_DIR"; then
  ensure_managed_block "$HOOKS_DIR/post-merge"
  ensure_managed_block "$HOOKS_DIR/post-checkout"
  echo "Installed auto-sync git hooks in $HOOKS_DIR"
else
  remove_managed_block "$HOOKS_DIR/post-merge"
  remove_managed_block "$HOOKS_DIR/post-checkout"
  echo "Removed Game Superpowers auto-sync hook blocks from $HOOKS_DIR"
fi
