---
name: game-requirements-brainstorm
description: Use when the request is vague, contradictory, or too under-specified to build a strong game result. Turn the request into a concise production-ready requirement brief without getting stuck in endless ideation.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.2.0"
  domain: game-development
---

# Game Requirements Brainstorm

## Goal
Turn the request into a requirement set that is specific enough to build a strong result.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present requirements and quality target in conversation.
- **minimal** or **full**: write `docs/game-studio/requirements.md` and `docs/game-studio/quality-target.md`.

Use:
- `../../shared/templates/requirements-brief.md`
- `../../shared/templates/quality-target.md`

## Workflow
1. Extract what the user definitely wants.
2. Separate must-build features, must-not-cut qualities, optional features, and explicit non-goals.
3. Infer smart defaults when they are obvious.
4. Ask high-value clarifying questions whenever missing information would materially affect game form, feature correctness, wow-factor, UX / onboarding, audio / feedback, or verification standards.
5. Do not stop after one question if multiple unresolved details still meaningfully change the result.
6. Write acceptance tests in user language.
7. Decide whether the quality target should be `first-playable`, `polished-prototype`, `production-feature`, or `live-patch`.

## Important
For greenfield showcase work, do not reduce the ask to a bare minimum.
Default to high-precision questioning rather than question minimization.
