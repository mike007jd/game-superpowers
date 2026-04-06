---
name: game-playability-verifier
description: Verify the build against the chosen quality target. Check bootability, interaction, UX, requested feature completeness, and regressions before success is claimed.
license: MIT
compatibility: Claude Code and Codex. Best results with shell/build/run access plus file read/write access.
metadata:
  author: game-superpowers
  version: "1.2.0"
  domain: game-development
---

# Game Playability Verifier

## Goal
Verify the build against its **actual target**, not a generic low bar.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present verification results in conversation.
- **minimal** or **full**: write `docs/game-studio/quality-report.md`.

## Use
- `../../shared/templates/quality-report.md`
- `../../shared/checklists/first-playable-rubric.md`
- `../../shared/checklists/polished-prototype-rubric.md`
- `../../shared/checklists/playability-verifier-output-checklist.md`
- `../../shared/checklists/ui-ux-hard-rules.md`

## Quality-aware verification
- If the target is `first-playable`, use `../../shared/checklists/first-playable-rubric.md`.
- If the target is `polished-prototype`, also use `../../shared/checklists/polished-prototype-rubric.md`.
- If the target is `production-feature` or `live-patch`, verify the requested feature set plus regression risk in touched areas.

## Minimum checks
- boots
- reaches the correct actionable state
- requested verbs work
- requested critical features in scope are present
- HUD / affordances are readable
- playfield is not obviously sacrificed to UI clutter
- no blocking runtime errors
- the build quality matches the selected target

## Reporting rules
For each critical check, report:
- pass / fail / partial
- evidence source
- short note or repair direction

## Important
Do not declare success merely because something runs.
The verifier exists to catch “technically alive, product-wise weak” outcomes.
When runtime evidence is missing, say so explicitly.
In a multi-agent build flow, this skill is the default verifier stage after implementation review, not an optional final flourish.
