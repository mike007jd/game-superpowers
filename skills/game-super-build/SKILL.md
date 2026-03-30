---
name: game-super-build
description: Use as the top-level orchestration skill for serious game work. It decides project state, locks concept and scope, chooses an AI-native build mode, sets the quality target, and routes the rest of the workflow. This is the main “skills of skills” entry point.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves verification.
metadata:
  author: game-superpowers
  version: "1.2.0"
  domain: game-development
---

# Game Super Build

You are the lead game-production workflow.
Your job is **not** to produce the smallest thing that technically runs.
Your job is to choose the right strategy for the project state and create the strongest result that fits the request.

## Core principle
These are different situations and must not be treated the same:
- greenfield / from scratch
- existing but prelaunch
- shipped
- live / risky

It must also distinguish between:
- build requests
- audit requests
- audit-then-repair requests

## Required outputs
Create and maintain:
- `docs/game-studio/project-state.md`
- `docs/game-studio/concept-brainstorm.md`
- `docs/game-studio/requirements.md`
- `docs/game-studio/spec.md`
- `docs/game-studio/system-design.md`
- `docs/game-studio/scope-profile.md`
- `docs/game-studio/build-strategy.md`
- `docs/game-studio/backend-decision.md`
- `docs/game-studio/backend-implementation.md` (when a concrete specialist route is chosen)
- `docs/game-studio/ux-flow.md`
- `docs/game-studio/feedback-design.md`
- `docs/game-studio/architecture.md`
- `docs/game-studio/plan.md`
- `docs/game-studio/quality-target.md`
- `docs/game-studio/quality-report.md`
- `docs/game-studio/release-safety.md` (when shipped/live-risky)
- `docs/game-studio/rolling-supervisor.md` (when autonomous rolling mode is enabled)

Use these shared assets when relevant:
- `../../shared/templates/project-state-assessment.md`
- `../../shared/templates/concept-brainstorm.md`
- `../../shared/templates/requirements-brief.md`
- `../../shared/templates/game-build-brief.md`
- `../../shared/templates/system-design.md`
- `../../shared/templates/scope-profile.md`
- `../../shared/templates/feedback-design.md`
- `../../shared/templates/build-strategy.md`
- `../../shared/templates/backend-decision.md`
- `../../shared/templates/quality-target.md`
- `../../shared/templates/quality-report.md`
- `../../shared/templates/release-safety.md`
- `../../shared/templates/rolling-supervisor-plan.md`

## Routing workflow
1. **Detect whether the user wants a build, an audit, or both.**
   - If the primary request is to inspect an existing repo, route to `game-project-audit` before proposing implementation changes.
2. **Assess project state first.**
   - Use `game-project-state-assessment`.
   - Inspect the repo before assuming anything.
3. **Lock the fantasy.**
   - Use `game-concept-brainstorm` when the request is vague, dreamy, weakly differentiated, or archetype-ambiguous.
   - Also use it by default for one-prompt benchmark or showcase builds even when the user sounds specific, because output-shape ambiguity is still common.
4. **Sharpen requirements.**
   - Use `game-requirements-brainstorm` when priorities are unclear or contradictory.
5. **Set scope tier.**
   - Use `game-scope-profile`.
6. **Choose mode and quality target.**
   - Use `game-build-strategy`.
7. **Choose or compare backend profiles.**
   - Use `game-backend-selector`.
   - If the chosen profile is web 2D or browser 3D, route to the matching specialist skill so the implementation path becomes concrete.
8. **Design the user experience before system sprawl.**
   - Use `game-ux-flow-designer`.
9. **Design feedback and feel explicitly.**
   - Use `game-feedback-design`.
10. **Define game-native systems.**
   - Use `game-mechanics-systems-design`.
11. **Lock code standards.**
   - Use `game-production-code`.
12. **Plan and implement.**
   - Use `game-implementation-plan` and the selected execution mode.
13. **Verify and critique.**
   - Use `game-playability-verifier` and `game-screenshot-critic`.
   - For benchmark or showcase builds, require fresh runtime verification before claiming success.
14. **Use compare or rolling modes only when justified.**
   - If the host supports subagents and the user wants stronger first-pass quality, prefer worker split and cross-checks over one giant uninterrupted implementation run.

## Important
For browser games, stack-neutral does not mean implementation-vague.
Once the route is chosen, make the architecture and UI rules concrete.
