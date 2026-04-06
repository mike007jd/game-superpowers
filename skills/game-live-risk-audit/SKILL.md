---
name: game-live-risk-audit
description: "Audit risk in shipped or high-risk projects: rollback danger, compatibility hazards, state corruption, operational blast radius, and should-not-touch areas."
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Live Risk Audit

## Goal
Audit shipped or high-risk projects before changes are proposed or applied.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/risk-register.md`, `docs/game-studio/audit/scorecard.json`.

Use:
- `../../shared/checklists/live-risk-audit-checklist.md`
- `../../shared/reference/project-state-and-risk.md`

## Evaluate
- save or state compatibility risk
- blast radius of likely edits
- rollback difficulty
- hidden production dependencies
- unsafe assumptions in seemingly small changes
- what should not be touched without a release plan

## Important
When risk is high, recommendations should bias toward small, reversible, well-isolated fixes.
