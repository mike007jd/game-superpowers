---
name: game-feedback-audit
description: "Audit interaction feedback quality: input acknowledgment, hit/collect/reward/failure signaling, danger telegraphing, and state-transition clarity."
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Feedback Audit

## Goal
Audit whether the game clearly responds to the player and communicates consequences.

## Deliverables
Update:
- `docs/game-studio/audit/audit-summary.md`
- `docs/game-studio/audit/ux-findings.md`
- `docs/game-studio/audit/scorecard.json`

Use:
- `../../shared/checklists/feedback-audit-checklist.md`
- `../../shared/checklists/game-feel-pillars.md`
- `../../shared/reference/audit-confidence-and-evidence.md`

## Evaluate
- input acknowledgment
- hit / damage / collect / upgrade / deny signals
- reward and success feedback
- fail and error feedback
- danger telegraphing
- state transition clarity
- whether feedback supports understanding or is merely decorative

## Important
A feature that technically works but gives weak or missing feedback should be marked as partially complete, not fully complete.
