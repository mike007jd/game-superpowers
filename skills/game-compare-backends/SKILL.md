---
name: game-compare-backends
description: Run a narrow compare between two or three backend profiles when architecture uncertainty is real. Use carefully, because it usually costs more tokens and time.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access and the ability to build/test prototypes.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Compare Backends

## Goal
Help choose between backend profiles when the choice is genuinely uncertain.

## Important warning
Compare mode usually costs more tokens and time than a single recommended route.
Say this explicitly before or while using it.

## Good use cases
- greenfield work where two routes appear plausibly viable
- UI-first vs world-first uncertainty
- 2D vs lightweight 3D preview uncertainty

## Bad use cases
- obvious stack choice
- live-product iteration
- post-architecture situations where the real blocker is not the backend

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present comparison results in conversation (compared options, criteria, result, why the winner won, token / cost note).
- **minimal** or **full**: update `docs/game-studio/backend-decision.md`.
