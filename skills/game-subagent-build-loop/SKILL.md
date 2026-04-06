---
name: game-subagent-build-loop
description: Use when the build should default to a builder plus reviewer plus verifier subagent loop instead of a single monolithic implementation pass.
license: MIT
compatibility: Claude Code and Codex. Best results with host-supported subagents, file read/write access, and runtime verification ability.
metadata:
  author: game-superpowers
  version: "1.0.0"
  domain: game-development
---

# Game Subagent Build Loop

## Goal
Turn a game build into a default multi-agent workflow: builder, reviewer, verifier.
The goal is stronger and more stable output from one user prompt, not thrift.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present subagent build loop plan in conversation.
- **minimal** or **full**: write `docs/game-studio/subagent-build-loop.md`.

## Default loop
For each meaningful build task or end-to-end slice:
1. Dispatch a **builder** subagent to implement the slice.
2. Dispatch a **reviewer** subagent using `game-build-review`.
3. Dispatch a **verifier** subagent using `game-playability-verifier`.
4. If review or verification fails, send the builder back with the concrete findings.
5. Repeat until the slice is acceptable or the blocker should be surfaced to the user.

## Parallel policy
Parallel builders are allowed only when ownership is disjoint.
Examples: core loop vs HUD, feedback vs content pass, gameplay slice vs menus.
Do not parallelize builders that fight over the same files or architectural choices.

## Quality policy
- benchmark and showcase builds should prefer this loop by default
- greenfield polished-prototype work should usually prefer this loop
- live-risky work may still use a tighter reviewer / verifier loop with smaller tasks

## Important
Do not claim completion after the builder finishes. Review and verification are expected to find problems.
