---
name: game-scope-profile
description: Set the game scope tier, completeness bar, and allowed refactor range so the agent neither underbuilds nor gets lost in endless overbuilding.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Scope Profile

## Goal
Translate project state and quality target into a concrete scope tier.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present scope profile in conversation.
- **minimal** or **full**: write `docs/game-studio/scope-profile.md`.

Use:
- `../../shared/templates/scope-profile.md`
- `../../shared/reference/scope-tiers.md`

## Workflow
1. Read `project-state.md`, `requirements.md`, and `quality-target.md`.
2. Classify scope as `micro`, `small`, `medium`, or `ambitious`.
3. State what is non-negotiable for this tier.
4. Explicitly list what may be deferred.
5. Decide whether the build should use:
   - small surgical tasks
   - medium coherent chunks
   - large AI-native coherent chunks
6. Decide whether a rolling supervisor is recommended.

## Relationship to scope guard
- `game-scope-profile` defines the intended scope.
- `game-scope-guard` protects that scope during execution.
