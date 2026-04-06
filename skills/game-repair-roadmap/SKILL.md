---
name: game-repair-roadmap
description: Convert audit findings into a prioritized repair roadmap with quick wins, high-impact fixes, risky items, and explicit do-not-touch zones.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Repair Roadmap

## Goal
Turn audit findings into an execution order that respects project state, risk, and quality target.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present the prioritized roadmap and risk items in conversation.
- **minimal** or **full**: write `docs/game-studio/audit/repair-roadmap.md` and `docs/game-studio/audit/risk-register.md`.

Use:
- `../../shared/templates/repair-roadmap.md`
- `../../shared/templates/risk-register.md`

## Organize fixes into
- quick wins
- high-impact fixes
- risky fixes
- optional polish
- should defer
- should not touch

## Prioritization rules
- shipped or live-risky repos prioritize safety and rollback confidence
- prelaunch repos can accept wider structural work when it unlocks strong gains
- avoid listing dozens of equal-priority tasks; sequence them
- always state which fixes are blocked by missing runtime evidence

