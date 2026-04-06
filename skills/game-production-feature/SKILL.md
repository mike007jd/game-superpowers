---
name: game-production-feature
description: Use when the requested outcome should land as a maintainable product-grade feature rather than a prototype. This skill protects completeness, integration quality, and verification discipline.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build/test access improves results.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Production Feature

## Goal
Build or modify a feature so it can live in a serious codebase, not just impress in a quick demo.

## Quality bar
A valid production feature usually includes:
- the requested feature scope,
- clean integration with existing systems,
- production-grade code structure,
- compatibility / migration notes when relevant,
- strong user-facing flow and feedback,
- verification strong enough for continued development.

Use:
- `../../shared/checklists/production-feature-checklist.md`
- `../../shared/checklists/production-code-checklist.md`

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present quality target updates in conversation.
- **minimal** or **full**: write or update `docs/game-studio/quality-target.md`.

## Workflow
1. Protect the requested feature set.
2. Respect project state and refactor policy.
3. Update quality target (see Outputs).
4. Implement the feature to completion, not as a fake shell.
5. Verify the feature and touched regressions before calling it done.
