#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=scripts/_install_state.sh
source "$REPO_DIR/scripts/_install_state.sh"

quiet=0
sync_claude=0
sync_codex=0

while [ $# -gt 0 ]; do
  case "$1" in
    --quiet)
      quiet=1
      ;;
    --claude)
      sync_claude=1
      ;;
    --codex)
      sync_codex=1
      ;;
    --all)
      sync_claude=1
      sync_codex=1
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
  shift
done

if [ "$sync_claude" -eq 0 ] && [ "$sync_codex" -eq 0 ]; then
  if game_superpowers_host_registered "$REPO_DIR" claude; then
    sync_claude=1
  fi
  if game_superpowers_host_registered "$REPO_DIR" codex; then
    sync_codex=1
  fi
fi

if [ "$sync_claude" -eq 0 ] && [ "$sync_codex" -eq 0 ]; then
  if [ "$quiet" -eq 0 ]; then
    echo "No installed hosts recorded for this clone. Nothing to sync."
  fi
  exit 0
fi

if [ "$sync_claude" -eq 1 ]; then
  GAME_SUPERPOWERS_SKIP_STATE=1 \
  GAME_SUPERPOWERS_SKIP_HOOK_SETUP=1 \
  bash "$REPO_DIR/scripts/install-claude-skills.sh"
fi

if [ "$sync_codex" -eq 1 ]; then
  GAME_SUPERPOWERS_SKIP_STATE=1 \
  GAME_SUPERPOWERS_SKIP_HOOK_SETUP=1 \
  bash "$REPO_DIR/scripts/install-codex-skills.sh"
fi

