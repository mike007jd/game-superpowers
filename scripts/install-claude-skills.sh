#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=scripts/_install_state.sh
source "$REPO_DIR/scripts/_install_state.sh"
SRC="$REPO_DIR/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
CLAUDE_ROOT="$(dirname "$DEST")"
MARKER=".game-superpowers-install"
MANAGED_FILE="$CLAUDE_ROOT/.game-superpowers-managed-skills"

mkdir -p "$DEST"
if [ -f "$MANAGED_FILE" ]; then
  while IFS= read -r name; do
    [ -n "$name" ] || continue
    rm -rf "$DEST/$name"
  done < "$MANAGED_FILE"
fi

count=0
skipped=0
managed_now="$(mktemp)"
for skill in "$SRC"/*; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  target="$DEST/$name"
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "skip: $target exists and is not managed by this repo"
    skipped=$((skipped+1))
    continue
  fi
  ln -s "$skill" "$target"
  printf '%s\n' "$name" >> "$managed_now"
  count=$((count+1))
done
mv "$managed_now" "$MANAGED_FILE"

touch "$CLAUDE_ROOT/$MARKER"
for shared_dir in shared schemas; do
  link="$CLAUDE_ROOT/$shared_dir"
  if [ -e "$link" ] || [ -L "$link" ]; then
    rm -rf "$link"
  fi
  ln -s "$REPO_DIR/$shared_dir" "$link"
done

if [ "${GAME_SUPERPOWERS_SKIP_STATE:-0}" != "1" ]; then
  game_superpowers_register_host "$REPO_DIR" claude
fi

if [ "${GAME_SUPERPOWERS_SKIP_HOOK_SETUP:-0}" != "1" ]; then
  bash "$REPO_DIR/scripts/install-git-hooks.sh"
fi

printf 'Synced %s Claude skills into %s' "$count" "$DEST"
if [ "$skipped" -gt 0 ]; then
  printf ' (%s skipped due to conflicts)' "$skipped"
fi
printf '\n'
