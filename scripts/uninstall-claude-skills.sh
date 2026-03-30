#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO_DIR/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
CLAUDE_ROOT="$(dirname "$DEST")"
count=0
for skill in "$SRC"/*; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  target="$DEST/$name"
  if [ -L "$target" ]; then
    rm "$target"
    count=$((count+1))
  fi
done
for shared_dir in shared schemas; do
  link="$CLAUDE_ROOT/$shared_dir"
  if [ -L "$link" ]; then
    rm "$link"
  fi
done
if [ -e "$CLAUDE_ROOT/.game-superpowers-install" ]; then
  rm -f "$CLAUDE_ROOT/.game-superpowers-install"
fi
printf 'Removed %s symlinked skills from %s\n' "$count" "$DEST"
