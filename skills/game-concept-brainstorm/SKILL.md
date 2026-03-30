---
name: game-concept-brainstorm
description: Turn a vague game idea into a sharp fantasy, design pillars, player verbs, and acceptance bar before implementation begins. This is the proper “brainstorm” stage, not endless ideation.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.2.0"
  domain: game-development
---

# Game Concept Brainstorm

## Goal
Increase build success by locking the game fantasy before architecture or implementation.

## Deliverables
- `docs/game-studio/concept-brainstorm.md`
- `docs/game-studio/requirements.md`

Use `../../shared/templates/concept-brainstorm.md`.

## Use when
- the request is exciting but blurry
- the user asks for “make it good” or “make it fun”
- the team needs to protect the core fantasy from being flattened during implementation

## Workflow
1. Restate the player fantasy in one sentence.
2. Lock the primary verb, the reward loop, and the first 30-second promise.
3. Lock the game shape before coding:
   - camera / view model
   - player movement grammar
   - obstacle / encounter grammar
   - fail-state and retry rhythm
   - visual anchor, not just a genre adjective
4. Define 3-4 design pillars.
5. Separate must-haves from experiments.
6. Prefer decisive defaults over endless questions.
7. For benchmark or one-prompt builds, spend more tokens here than feels comfortable if shape ambiguity remains. A stronger concept lock is cheaper than a flashy but wrong implementation.
8. Feed the result into `game-requirements-brainstorm`, `game-scope-profile`, and `game-ux-flow-designer`.

## Important
This is not for random ideation.
It is for increasing the chance that the first serious build actually feels like the intended game.

If the prompt uses an archetype word that can imply multiple valid game forms, do not silently choose one and move on.
Examples:
- `runner` can mean lane-switch runner, side-view platform runner, or top-down dodge runner
- `shooter` can mean twin-stick arena, side-view run-and-gun, gallery shooter, or bullet-heaven
- `breakout` can mean strict classic breakout, stage-based brick breaker, or bonus-heavy arcade variant

In these cases, write down the chosen interpretation explicitly so downstream implementation skills inherit a locked shape instead of improvising.
