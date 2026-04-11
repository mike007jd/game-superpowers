#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=scripts/_install_state.sh
source "$REPO_DIR/scripts/_install_state.sh"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
CLAUDE_ROOT="$(dirname "$DEST")"
MANAGED_FILE="$CLAUDE_ROOT/.game-superpowers-managed-skills"
count=0
if [ -f "$MANAGED_FILE" ]; then
  while IFS= read -r name; do
    [ -n "$name" ] || continue
    target="$DEST/$name"
    if [ -L "$target" ] || [ -e "$target" ]; then
      rm -rf "$target"
      count=$((count+1))
    fi
  done < "$MANAGED_FILE"
  rm -f "$MANAGED_FILE"
fi
for shared_dir in shared schemas; do
  link="$CLAUDE_ROOT/$shared_dir"
  if [ -L "$link" ]; then
    rm "$link"
    count=$((count+1))
  fi
done
if [ -e "$CLAUDE_ROOT/.game-superpowers-install" ]; then
  rm -f "$CLAUDE_ROOT/.game-superpowers-install"
fi
game_superpowers_unregister_host "$REPO_DIR" claude
bash "$REPO_DIR/scripts/install-git-hooks.sh"
printf 'Removed %s Claude entries from %s\n' "$count" "$DEST"
