---
name: game-live-patch
description: Use when the repo is shipped or live-risky. This skill narrows changes, documents blast radius and rollback, and prioritizes safety over broad cleanup.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build/test access improves verification.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Live Patch

## Goal
Make a safe, reversible, production-minded change in a shipped or operationally risky project.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/release-safety.md`, `docs/game-studio/quality-report.md`.

Use:
- `../../shared/templates/release-safety.md`
- `../../shared/checklists/live-patch-checklist.md`

## Rules
- prefer the smallest change that solves the real issue
- avoid broad refactors unless explicitly authorized
- document blast radius and rollback
- respect compatibility boundaries
- run targeted verification on touched paths and likely regressions

## Important
This skill exists so live work is not treated like greenfield YOLO work.
