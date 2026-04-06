---
name: game-backend-selector
description: Choose or compare backend profiles based on required capabilities, project state, and quality target. Stay stack-neutral at the top level while still giving sharp recommendations and tradeoffs.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.1.1"
  domain: game-development
---

# Game Backend Selector

## Goal
Select the backend profile that best serves the requested outcome.
Use `../../shared/reference/backend-profiles.md`.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present backend decisions in conversation.
- **minimal** or **full**: write `docs/game-studio/backend-decision.md`.

## Rules
- Prefer capabilities over brand or fandom.
- If the project already has a workable backend, bias toward it unless it is the blocker.
- Optimize for the chosen quality target, not just the fastest toy result.
- Respect project state: live iteration and greenfield do not deserve the same backend decision policy.

## Compare mode
Use compare mode only when:
- the backend choice is genuinely uncertain,
- or the user explicitly requests comparison.

When compare mode is used:
- warn that it will usually cost more tokens and time,
- keep the comparison narrow,
- define the winner criteria before exploring.

## Specialist follow-through
After choosing a backend profile, route to a concrete specialist when needed:
- `game-web-2d-specialist` for `web-2d-ui-first` or `web-2d-world-first`
- `game-web-3d-specialist` for `web-3d-preview`

Top-level planning remains stack-neutral.
Implementation guidance should still become concrete once a backend family is chosen.
