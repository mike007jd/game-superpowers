#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=scripts/_install_state.sh
source "$REPO_DIR/scripts/_install_state.sh"
DEST_BASE="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
TARGET="$DEST_BASE/game-superpowers"

if [ -L "$TARGET" ]; then
  rm "$TARGET"
  printf 'Removed %s\n' "$TARGET"
elif [ -d "$TARGET" ] && [ -e "$TARGET/.game-superpowers-install" ]; then
  rm -rf "$TARGET"
  printf 'Removed %s\n' "$TARGET"
else
  echo "nothing to remove: $TARGET"
fi

game_superpowers_unregister_host "$REPO_DIR" codex
bash "$REPO_DIR/scripts/install-git-hooks.sh"
