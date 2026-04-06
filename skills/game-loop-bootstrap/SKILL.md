---
name: game-loop-bootstrap
description: "Establish the game-native architecture: managers, state flow, player control, camera, UI ownership, and other core systems needed for a maintainable build."
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Loop Bootstrap

## Goal
Create a maintainable gameplay architecture that matches the chosen target quality.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present architecture decisions in conversation.
- **minimal** or **full**: write or update `docs/game-studio/architecture.md`.

## Prefer abstractions like
- `GameManager`
- `InputProfile`
- `StateMachine`
- `PlayerController`
- `CameraRig`
- `HUDFlow`
- `SoundLayer`
- `EncounterDirector`

## Rules
- Separate simulation state and UI state clearly enough to reason about them.
- Avoid hiding critical gameplay state inside presentation objects.
- Choose the simplest architecture that still supports the requested result.
- In aggressive greenfield modes, do not fear building a complete coherent shell if it prevents later churn.
- In live modes, preserve compatibility unless a deliberate migration plan exists.
