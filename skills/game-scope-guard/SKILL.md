---
name: game-scope-guard
description: Protect the project from runaway complexity without destroying the user’s real goal. Scope differently depending on whether the project is greenfield, refactor-friendly, or live-risky.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Scope Guard

## Goal
Keep scope under control while preserving the value of the request.

## Core rule
Do **not** equate “scope control” with “remove everything interesting.”

## By mode
- **yolo-super / guided-build**: protect the user’s core requested feature set. Cut edge cases, not the fantasy.
- **refactor-open**: protect the outcome, but allow larger architecture change when it prevents endless patching.
- **surgical-live**: minimize blast radius first; here scope control often means tighter change boundaries.

## Good cuts
- optional content multiplication
- edge-case polish outside the critical path
- tooling not needed for the current target
- deep progression systems when the target does not require them

## Bad cuts
- requested core mechanic
- requested style / feel / UX quality if that is central to the ask
- essential fail/retry and onboarding clarity
- architecture cleanup that is necessary to make the requested change stable

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): state scope decisions and rationale in conversation.
- **minimal** or **full**: record the rationale in `docs/game-studio/plan.md` or `docs/game-studio/build-strategy.md`.


## Pair with
Use `game-scope-profile` early to define the intended scope. This skill protects it later.
