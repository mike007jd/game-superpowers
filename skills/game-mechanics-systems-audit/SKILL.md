---
name: game-mechanics-systems-audit
description: Audit core verbs, loop integrity, system coherence, progression links, and whether implemented features actually form a playable game.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Mechanics Systems Audit

## Goal
Audit whether the project’s systems compose into a coherent game rather than a pile of disconnected features.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/scorecard.json`, `docs/game-studio/audit/repair-roadmap.md`.

Use:
- `../../shared/checklists/mechanics-systems-audit-checklist.md`
- `../../shared/reference/game-dev-abstractions.md`
- `../../shared/reference/audit-confidence-and-evidence.md`

## Evaluate
- clarity of the primary verb
- reward loop and fail loop integrity
- progression, encounter, economy, or puzzle logic cohesion
- whether systems conflict or duplicate responsibility
- whether important features are present only as shells

## Output style
Prefer statements like:
- “the combat loop is under-closed because…”
- “progression exists structurally but not experientially because…”
- “feature count is high, but loop cohesion is low because…”

