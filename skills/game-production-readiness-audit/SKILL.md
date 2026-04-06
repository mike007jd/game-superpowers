---
name: game-production-readiness-audit
description: Audit whether the project meets production-grade expectations for structure, maintainability, standards, and safe continued iteration.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Production Readiness Audit

## Goal
Audit whether the codebase is ready for sustained development rather than only demo survival.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/scorecard.json`, `docs/game-studio/audit/repair-roadmap.md`.

Use:
- `../../shared/checklists/production-readiness-audit-checklist.md`
- `../../shared/checklists/production-code-checklist.md`

## Evaluate
- code organization and ownership boundaries
- clarity of state and event flow
- dead prototypes vs durable systems
- naming and consistency
- whether future AI-driven changes will be easy or destabilizing

