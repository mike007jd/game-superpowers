#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO_DIR/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
CLAUDE_ROOT="$(dirname "$DEST")"
MARKER=".game-superpowers-install"

mkdir -p "$DEST"
count=0
for skill in "$SRC"/*; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  target="$DEST/$name"
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "skip: $target already exists"
    continue
  fi
  ln -s "$skill" "$target"
  count=$((count+1))
done

touch "$CLAUDE_ROOT/$MARKER"
for shared_dir in shared schemas; do
  link="$CLAUDE_ROOT/$shared_dir"
  if [ -e "$link" ] || [ -L "$link" ]; then
    rm -rf "$link"
  fi
  ln -s "$REPO_DIR/$shared_dir" "$link"
done

printf 'Installed %s skills into %s\n' "$count" "$DEST"
