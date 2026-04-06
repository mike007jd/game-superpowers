---
name: game-first-playable
description: Use only when the chosen quality target is intentionally first-playable or spike-quality. This skill focuses on the thinnest credible vertical slice, not on feature-complete prototype quality.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; verifier skills also benefit from shell/build access.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game First Playable

You are the workflow for turning a prompt into a **real first playable**.
This is a specialized mode, not the universal target for all game work.

## Primary goal
Convert the user's idea into:
1. a concrete first-playable spec,
2. a narrow scope,
3. a backend recommendation or comparison,
4. a working vertical slice,
5. a verification report.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/spec.md`, `docs/game-studio/backend-decision.md`, `docs/game-studio/ux-flow.md`, `docs/game-studio/architecture.md`, `docs/game-studio/plan.md`, `docs/game-studio/quality-report.md`.

Use the shared template at `../../shared/templates/first-playable-spec.md`.

## Workflow
1. Compile the prompt into a minimal spec.
2. Scope aggressively using `game-scope-guard`.
3. Choose the backend profile with `game-backend-selector`.
4. Design the first 30 seconds with `game-ux-flow-designer`.
5. Bootstrap the loop with `game-loop-bootstrap`.
6. Implement the thinnest vertical slice that proves the main fantasy.
7. Verify with `game-playability-verifier`.
8. Repair readability and feedback gaps with `game-screenshot-critic` and `game-hud-feedback-polish`.

## Important
Use this only when a minimal first-playable is truly the right target.
If the user wants a stronger prototype or a production-grade feature, route elsewhere.
