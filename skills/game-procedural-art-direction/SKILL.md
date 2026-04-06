---
name: game-procedural-art-direction
description: Define and implement procedural art direction for the current build target. Use when visual identity, shader recipes, SVG systems, particles, or UI recipes are part of the requested value, not just optional polish.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Procedural Art Direction

## Goal
Make the build visually intentional through programmable systems.

## Use when
- the user explicitly wants procedural art
- the game needs a stronger visual identity to meet the quality target
- the result currently works but looks generic or underdesigned

## Rules
- Treat requested visual style as part of the product, not optional fluff.
- Prefer reusable visual recipes over one-off hacks.
- Protect readability while adding style.
- For polished prototypes, visual direction belongs in scope now, not “later someday.”

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present visual direction decisions in conversation.
- **minimal** or **full**: update `docs/game-studio/spec.md` or `docs/game-studio/ux-flow.md` if visual rules or UI behavior change materially.
