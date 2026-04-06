---
name: game-ux-flow-audit
description: Audit first-30-seconds flow, onboarding, fail/retry loops, navigation clarity, and player understanding in an existing game project.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game UX Flow Audit

## Goal
Audit the player journey and moment-to-moment experience flow, especially the first 30 seconds.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/ux-findings.md`, `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/scorecard.json`.

Use:
- `../../shared/checklists/ux-flow-audit-checklist.md`
- `../../shared/reference/first-30-seconds.md`
- `../../shared/reference/audit-confidence-and-evidence.md`

## Evaluate
- first actionable screen clarity
- onboarding length and interruption cost
- main verb discoverability
- fail / retry / pause / resume flow
- menu-to-play transitions
- whether the UI or setup blocks the core loop

## Evidence discipline
Tag each important finding with:
- confidence: `high`, `medium`, or `low`
- evidence: `code`, `config`, `asset`, `screenshot`, or `inferred`

## Output style
Write findings in game-language, such as:
- what the player understands too late
- what the player is asked to do too early
- where friction kills momentum

