---
name: game-super-build
description: Use as the top-level orchestration skill for serious game work. It decides project state, locks concept and scope, chooses an AI-native build mode, sets the quality target, and routes the rest of the workflow. This is the main “skills of skills” entry point.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves verification.
metadata:
  author: game-superpowers
  version: "1.4.0"
  domain: game-development
---

# Game Super Build

Lead game-production workflow. Choose the right strategy for project state and quality target instead of just producing the smallest thing that runs.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): keep all findings, plans, and decisions in conversation. Do not create `docs/` files.
- **minimal**: write only `plan.md` and `quality-target.md` for cross-session continuity.
- **full**: create and maintain all files listed below.

Full output files (when strategy = full):
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

## Routing workflow
1. **Detect whether the user wants a build, an audit, or both.**
   - Existing repo inspection routes to `game-project-audit` first.
2. **Assess project state first.**
   - Use `game-project-state-assessment`.
3. **Lock the fantasy.**
   - Use `game-concept-brainstorm` when the request is vague, weakly differentiated, or archetype-ambiguous.
   - Default to it for one-prompt benchmark or showcase builds.
4. **Sharpen requirements.**
   - Use `game-requirements-brainstorm`.
   - Default to high-precision questioning for greenfield and showcase builds.
5. **Set scope tier.**
   - Use `game-scope-profile`.
6. **Choose mode and quality target.**
   - Use `game-build-strategy`.
7. **Choose or compare backend profiles.**
   - Use `game-backend-selector`.
   - If the product is explicitly a Douyin H5 Interactive delivery, including requests phrased as `抖音互动作品`, `抖音互动空间`, or `抖音互动H5`, route through `game-douyin-h5-interactive` before deeper browser implementation specialization.
   - If the chosen profile is web 2D or browser 3D, route to the matching specialist skill.
8. **Design the user experience before system sprawl.**
   - Use `game-ux-flow-designer`.
9. **Design feedback and feel explicitly.**
   - Use `game-feedback-design`.
10. **Define game-native systems.**
   - Use `game-mechanics-systems-design`.
11. **Lock code standards.**
   - Use `game-production-code`.
12. **Plan and implement.**
   - Use `game-implementation-plan`.
   - If the host supports subagents and the quality target is above a throwaway spike, prefer `game-subagent-build-loop`.
13. **Review, verify, and critique.**
   - Use `game-build-review`, `game-playability-verifier`, and `game-screenshot-critic`.
   - Benchmark and showcase builds require fresh runtime verification before success is claimed.
14. **Use compare or rolling modes only when justified.**

## Important
For browser games, stack-neutral does not mean implementation-vague.
Do not confuse fewer questions with better workflow. The right default is higher-precision requirement collection, then stronger execution.
