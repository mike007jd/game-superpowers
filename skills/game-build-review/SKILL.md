---
name: game-build-review
description: Review an in-progress or freshly built game implementation against the locked concept, brief, and plan before runtime verification or completion is claimed.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access plus repo context and recent implementation evidence.
metadata:
  author: game-superpowers
  version: "1.0.0"
  domain: game-development
---

# Game Build Review

## Goal
Default review stage between implementation and runtime verification. Catch shape drift, weak scope decisions, and fake-complete output before verifier time is spent.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present review findings in conversation.
- **minimal** or **full**: write `docs/game-studio/build-review.md`.

## Review focus
- does the current build still match the locked game form
- does the implementation match the approved brief and current task plan
- are the requested core verbs and loops actually present
- is the result fake-complete, placeholder-heavy, or missing obvious quality-critical work
- did the builder introduce unnecessary complexity or unrelated scope
- are the next fixes better handled before runtime verification

## Reporting rules
For each issue, report:
- severity: critical / important / minor
- evidence source
- short repair direction

## Important
This is not the runtime verifier.
Review the implementation against the concept, brief, and plan so the verifier receives a build worth testing.
