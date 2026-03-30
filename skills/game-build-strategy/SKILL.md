---
name: game-build-strategy
description: Decide the AI-native development mode, quality target, task granularity, and refactor policy based on project state and user intent. This skill prevents both over-cautious iteration and reckless live-product rewrites.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.2.0"
  domain: game-development
---

# Game Build Strategy

## Goal
Choose the right build strategy for the project.
Write `docs/game-studio/build-strategy.md` and `docs/game-studio/quality-target.md`.

Use:
- `../../shared/reference/development-modes.md`
- `../../shared/reference/quality-targets.md`
- `../../shared/templates/build-strategy.md`
- `../../shared/templates/quality-target.md`

## Development modes
- `yolo-super`
- `guided-build`
- `refactor-open`
- `surgical-live`

## Quality targets
- `first-playable`
- `polished-prototype`
- `production-feature`
- `live-patch`

## Selection rules
- **greenfield + narrow mechanic spike** -> `yolo-super` + `first-playable`
- **greenfield + serious showcase build** -> usually `yolo-super` or `guided-build` + `polished-prototype`
- **existing product-facing feature work** -> usually `guided-build` or `refactor-open` + `production-feature`
- **shipped or live-risky** -> `surgical-live` + `live-patch`

## Planning policy
Match task size to the mode:
- aggressive modes can use large coherent implementation chunks
- production-feature work can use medium coherent chunks
- live work should use smaller changes with tighter verification

Also choose the exploration budget explicitly:
- `minimal` when the task is narrow and already shape-locked
- `standard` for normal product work
- `high` for single-prompt showcase generation, benchmark runs, or any task where first-result quality matters more than token thrift

For `high` exploration budget work:
- spend more tokens up front on concept lock, UX shape, and visual anchor decisions
- prefer `polished-prototype` over `first-playable` unless the user explicitly wants only a spike
- add runtime verification and screenshot critique before claiming completion
- if the host supports subagents, split implementation and verification into separate workers and cross-check the result

## Guardrail
Do not let “safe” planning ruin the result on low-risk greenfield work.
Do not let “fast” planning justify broad rewrites on live products.

For benchmark or showcase builds, do not optimize for token thrift if that weakens the result.
It is acceptable to spend more tokens on sharper concept lock, stronger implementation review, and explicit verification when the user is comparing output quality.
