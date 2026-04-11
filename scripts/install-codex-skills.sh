#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=scripts/_install_state.sh
source "$REPO_DIR/scripts/_install_state.sh"
DEST_BASE="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
TARGET="$DEST_BASE/game-superpowers"
MARKER=".game-superpowers-install"

mkdir -p "$DEST_BASE"

# Migrate the legacy install shape where the package root was a single symlink to repo/skills.
if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$REPO_DIR/skills" ]; then
  rm "$TARGET"
fi

if [ -e "$TARGET" ] && [ ! -d "$TARGET" ]; then
  echo "skip: $TARGET exists and is not a directory"
  exit 1
fi

mkdir -p "$TARGET"
touch "$TARGET/$MARKER"
find "$TARGET" -mindepth 1 -maxdepth 1 ! -name "$MARKER" -exec rm -rf {} +

for skill in "$REPO_DIR/skills"/*; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  link="$TARGET/$name"
  ln -s "$skill" "$link"
done

for shared_dir in shared schemas; do
  link="$TARGET/$shared_dir"
  ln -s "$REPO_DIR/$shared_dir" "$link"
done

if [ "${GAME_SUPERPOWERS_SKIP_STATE:-0}" != "1" ]; then
  game_superpowers_register_host "$REPO_DIR" codex
fi

if [ "${GAME_SUPERPOWERS_SKIP_HOOK_SETUP:-0}" != "1" ]; then
  bash "$REPO_DIR/scripts/install-git-hooks.sh"
fi

printf 'Synced Game Superpowers into %s\n' "$TARGET"
