---
name: game-feedback-design
description: Design the game’s feedback grammar across visuals, audio, motion, danger signaling, reward signaling, and UI acknowledgment so the result feels alive rather than placeholder-level.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access helps when previewing.
metadata:
  author: game-superpowers
  version: "1.1.1"
  domain: game-development
---

# Game Feedback Design

## Goal
Make feedback part of the design, not something bolted on at the end.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present feedback design in conversation.
- **minimal** or **full**: write `docs/game-studio/feedback-design.md`.

Use:
- `../../shared/templates/feedback-design.md`
- `../../shared/checklists/feedback-design-checklist.md`
- `../../shared/checklists/game-feel-pillars.md`
- `../../shared/checklists/ui-ux-hard-rules.md`

## Cover
- input acknowledgment
- success / reward signals
- fail / deny signals
- danger telegraphing
- state transition feedback
- audio priorities
- micro-motion and juice that support clarity rather than noise
- which feedback belongs in the world layer vs the HUD layer

## Use when
- the build works but feels dead
- the target is `polished-prototype` or above
- combat, traversal, collection, menuing, or puzzle interactions need stronger feel

## Important
Feedback is part of the mechanic contract.
If the game does not communicate clearly or feel responsive, it is not “done enough.”
