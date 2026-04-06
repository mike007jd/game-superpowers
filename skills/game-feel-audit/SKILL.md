---
name: game-feel-audit
description: Audit game feel and responsiveness based on control paths, timing assumptions, animation hooks, camera reactions, and feedback cues.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Feel Audit

## Goal
Audit whether the game seems responsive, readable, and satisfying rather than merely functional.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/scorecard.json`, `docs/game-studio/audit/ux-findings.md`.

Use:
- `../../shared/checklists/game-feel-audit-checklist.md`
- `../../shared/checklists/game-feel-pillars.md`
- `../../shared/reference/audit-confidence-and-evidence.md`

## Evaluate
- apparent input-to-response latency in the implementation
- camera behavior around motion and impact
- timing support for attacks, movement, traversal, or collection
- feel debt caused by missing polish hooks
- emotionally dead interactions that need stronger juice or pacing

## Important
Without runtime evidence, do not overstate certainty. Identify whether findings are confirmed or probable.

