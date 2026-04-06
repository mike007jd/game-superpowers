---
name: game-architecture-maintainability-audit
description: Audit architecture, state management, boundaries, coupling, and maintainability risks that will make future AI or human iteration harder.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Architecture Maintainability Audit

## Goal
Audit technical structure and changeability, especially where future iteration will become painful.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/scorecard.json`, `docs/game-studio/audit/risk-register.md`.

Use:
- `../../shared/checklists/architecture-maintainability-audit-checklist.md`
- `../../shared/reference/game-dev-abstractions.md`

## Evaluate
- state management clarity
- coupling between UI, gameplay, systems, and content
- module boundaries and change surfaces
- hidden complexity and implicit contracts
- where future AI edits are likely to rot the codebase

