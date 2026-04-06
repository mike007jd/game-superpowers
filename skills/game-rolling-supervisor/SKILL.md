---
name: game-rolling-supervisor
description: Enable a guarded external rolling build/verify/repair loop for high-autonomy game development. Use when the task is too large for one clean session and broad changes are allowed.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access, shell/build access, and an external supervisor process.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Rolling Supervisor

## Goal
Push a game project through repeated autonomous passes without letting one long context rot into uselessness.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present rolling supervisor plan in conversation.
- **minimal** or **full**: write `docs/game-studio/rolling-supervisor.md` and `docs/game-studio/rolling/state.json`.

Use:
- `../../shared/templates/rolling-supervisor-plan.md`
- `../../shared/reference/rolling-supervisor-architecture.md`
- `../../schemas/rolling-state.schema.json`
- `../../schemas/session-result.schema.json`

## When to use
- the user wants high-autonomy end-to-end generation
- the target is bigger than a single clean session
- the repo can tolerate multiple build/verify/repair cycles
- broad changes are allowed or the build is greenfield

## Rules
- prefer **short-lived worker sessions** over one giant session
- every worker must emit a compact structured handoff
- verification gates decide whether to continue
- use worktree isolation for parallel branches when practical
- do not create infinite hook or stop loops
- if the project is live or risky, only enable with explicit authorization

## Worker graph
Typical graph:
1. concept/requirements brainstorm
2. scope profile
3. architecture/plan
4. build
5. verify
6. feedback design/polish
7. verify again
8. repair if needed

## Important
The supervisor belongs outside the plugin runtime.
The plugin defines the contracts; an external Python supervisor executes them.
