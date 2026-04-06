---
name: game-mechanics-systems-design
description: Translate the concept, UX flow, and quality target into game-native systems such as core loop, state model, progression, encounter logic, save boundaries, and sound ownership. Use when the build needs more than a vague architecture sketch.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Mechanics Systems Design

## Goal
Turn the concept into a concrete systems design that game developers can reason about and extend.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present systems design in conversation.
- **minimal** or **full**: write `docs/game-studio/system-design.md`.

Use:
- `../../shared/templates/system-design.md`
- `../../shared/reference/game-dev-abstractions.md`

## Cover
- primary and secondary verbs
- core loop and loop exits
- state model
- encounter / obstacle / challenge model
- progression or meta progression
- save / persistence boundaries
- sound ownership and feedback ownership

## Important
Prefer game-native concepts such as `GameManager`, `StateMachine`, `EncounterDirector`, `HUDFlow`, and `SoundLayer`.
Do not let runtime-specific jargon replace actual game design clarity.
