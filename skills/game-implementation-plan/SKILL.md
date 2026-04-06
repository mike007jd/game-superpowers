---
name: game-implementation-plan
description: Turn the approved brief into a sequence of verifiable tasks that matches the selected development mode. This skill prevents both endless micro-edits and reckless unbounded rewrites.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.2.0"
  domain: game-development
---

# Game Implementation Plan

Turn the approved build brief into an execution plan.
Use `../../shared/templates/task-plan.md`.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present implementation plan in conversation.
- **minimal** or **full**: write `docs/game-studio/plan.md`.

## Key rule
Do not use one default task size for all situations.
Use the chosen development mode.

## Planning bias
- In **yolo-super**, larger end-to-end tasks are allowed and often preferred.
- In **guided-build**, keep the plan comprehensible but still fast.
- In **refactor-open**, plan migrations and replacements explicitly.
- In **surgical-live**, keep tasks tight and rollbackable.

## Execution bias
Unless the user explicitly wants a cheap or minimal pass, assume the plan should support:
- a **builder** stage
- a **reviewer** stage
- a **verifier** stage

For benchmark, showcase, or polished-prototype work, plan with this loop in mind instead of assuming one pass from build to done.

## Important
Do not produce fake progress tasks like “set up scaffolding” unless that scaffold immediately enables real implementation.
Prefer tasks that end in a stronger running build.
