#!/usr/bin/env bash

game_superpowers_repo_dir() {
  cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd
}

game_superpowers_git_dir() {
  local repo_dir="${1:?repo_dir is required}"
  local git_dir
  if [ -n "${GAME_SUPERPOWERS_GIT_DIR:-}" ]; then
    printf '%s\n' "$GAME_SUPERPOWERS_GIT_DIR"
    return 0
  fi

  git_dir="$(git -C "$repo_dir" rev-parse --git-dir 2>/dev/null || true)"
  if [ -z "$git_dir" ]; then
    return 0
  fi

  case "$git_dir" in
    /*)
      printf '%s\n' "$git_dir"
      ;;
    *)
      printf '%s/%s\n' "$repo_dir" "$git_dir"
      ;;
  esac
}

game_superpowers_state_file() {
  local repo_dir="${1:?repo_dir is required}"
  local git_dir
  git_dir="$(game_superpowers_git_dir "$repo_dir")"
  if [ -z "$git_dir" ]; then
    return 1
  fi

  printf '%s/game-superpowers-installed-hosts\n' "$git_dir"
}

game_superpowers_has_state() {
  local repo_dir="${1:?repo_dir is required}"
  local state_file
  state_file="$(game_superpowers_state_file "$repo_dir" 2>/dev/null)" || return 1
  [ -s "$state_file" ]
}

game_superpowers_host_registered() {
  local repo_dir="${1:?repo_dir is required}"
  local host="${2:?host is required}"
  local state_file
  state_file="$(game_superpowers_state_file "$repo_dir" 2>/dev/null)" || return 1
  [ -f "$state_file" ] && grep -Fxq "$host" "$state_file"
}

game_superpowers_register_host() {
  local repo_dir="${1:?repo_dir is required}"
  local host="${2:?host is required}"
  local state_file tmp_file
  state_file="$(game_superpowers_state_file "$repo_dir")" || return 0
  mkdir -p "$(dirname "$state_file")"
  tmp_file="$(mktemp)"
  if [ -f "$state_file" ]; then
    cat "$state_file" > "$tmp_file"
  fi
  printf '%s\n' "$host" >> "$tmp_file"
  sort -u "$tmp_file" > "$state_file"
  rm -f "$tmp_file"
}

game_superpowers_unregister_host() {
  local repo_dir="${1:?repo_dir is required}"
  local host="${2:?host is required}"
  local state_file tmp_file
  state_file="$(game_superpowers_state_file "$repo_dir" 2>/dev/null)" || return 0
  [ -f "$state_file" ] || return 0

  tmp_file="$(mktemp)"
  grep -Fxv "$host" "$state_file" > "$tmp_file" || true
  if [ -s "$tmp_file" ]; then
    mv "$tmp_file" "$state_file"
  else
    rm -f "$tmp_file" "$state_file"
  fi
}
