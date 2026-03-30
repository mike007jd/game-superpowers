---
name: game-audio-feedback-audit
description: "Audit the project's audio layer as UX feedback: UI sounds, success/failure signals, danger cues, layering, and semantic sound priorities."
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Audio Feedback Audit

## Goal
Audit audio as part of the feedback grammar rather than as a late cosmetic layer.

## Deliverables
Update:
- `docs/game-studio/audit/audit-summary.md`
- `docs/game-studio/audit/ux-findings.md`
- `docs/game-studio/audit/scorecard.json`

Use:
- `../../shared/checklists/audio-feedback-audit-checklist.md`
- `../../shared/reference/audit-confidence-and-evidence.md`

## Evaluate
- menu and button confirmation sounds
- reward, pickup, and completion sounds
- fail, deny, and danger cues
- layering conflicts and priority confusion
- whether audio clarifies state or merely adds noise

## When evidence is weak
If assets or hooks exist but runtime behavior is unclear, classify findings as inferred and explain what remains unverified.
