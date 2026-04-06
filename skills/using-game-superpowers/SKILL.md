---
name: using-game-superpowers
description: "Use when the task is about building, auditing, or improving a game project with this Game Superpowers skill collection. Acts as the collection bootstrap skill: classify the request, choose the right specialized game skills, and coordinate them instead of trying to solve the entire task ad hoc."
---
# Using Game Superpowers

Collection entrypoint. Classify the request, choose the next skills, and keep the workflow explicit.

## Classification

Track:
- **Build** — new project, prototype, feature, vertical slice
- **Audit** — diagnosis, read-only review, risk or UX review
- **Repair** — targeted fixes after diagnosis
- **Polish** — working game, better feel / UX / feedback / quality

Project state:
- `greenfield`
- `existing-prelaunch`
- `live-risky`

## Output strategy

Choose one based on context before invoking downstream skills:
- **inline** (default) — all findings, plans, and decisions stay in conversation. No `docs/` files written. Use for single-session work, small projects (< ~10 source files), or AI-driven auto-builds.
- **minimal** — persist only files needed for cross-session continuity (typically `plan.md`, `quality-target.md`). Use for multi-step builds that may span sessions.
- **full** — write all docs artifacts. Use only when the user explicitly asks, the project is team-based, or project complexity clearly justifies it.

When in doubt, default to **inline**. A clean project directory is worth more than unread reports.

Downstream skills that say "Required outputs: write docs/..." are overridden by this strategy. When inline or minimal, present those findings in conversation instead of writing files.

## Routing

### Build
- `game-concept-brainstorm` if fantasy / goals are unclear
- `game-concept-brainstorm` by default for one-prompt game generation, showcase builds, benchmark runs, or any request using archetype words such as `runner`, `platformer`, `survivor`, `shooter`, `breakout`, `fps`, `dungeon crawler`, or `arena`
- `game-scope-profile`
- `game-build-strategy`
- `game-super-build`

Then add whichever of these are needed:
- `game-douyin-h5-interactive` — when the platform is explicitly Douyin H5 Interactive or the user is clearly asking for a Douyin-style portrait H5 interactive delivery shape
- `game-ux-flow-designer`
- `game-feedback-design`
- `game-loop-bootstrap`
- `game-mechanics-systems-design`
- `game-build-review`
- `game-subagent-build-loop`
- `game-web-2d-specialist`
- `game-web-3d-specialist`
- `game-polished-prototype`
- `game-production-feature`

### Audit
- `game-project-state-assessment`
- `game-project-audit`

Then add relevant audit skills based on what the project actually has:
- `game-ux-flow-audit` — when: UI flow, menus, onboarding, or navigation exists
- `game-hud-readability-audit` — when: HUD, overlay UI, or in-game information display exists
- `game-feedback-audit` — when: interaction feedback, hit/collect/reward signals exist
- `game-audio-feedback-audit` — when: project has audio layer or sound effects
- `game-feel-audit` — when: real-time input, physics, or frame-driven game loop
- `game-mechanics-systems-audit` — when: game loop, progression, scoring, or state machine exists
- `game-scope-completeness-audit` — when: checking whether promised features are actually complete
- `game-production-readiness-audit` — when: project targets production release
- `game-architecture-maintainability-audit` — when: codebase is large enough for structural concerns (> ~20 files)
- `game-live-risk-audit` — when: project-state == live-risky
- `game-audit-scorecard`
- `game-repair-roadmap`

### Repair
- `game-repair-roadmap` (from audit findings or known issues)
- `game-scope-guard`
- `game-implementation-plan`
- `game-production-code` when quality target >= polished-prototype
- `game-playability-verifier`
- `game-live-patch` when project-state == live-risky

### Polish
- `game-hud-feedback-polish`
- `game-feedback-design`
- `game-screenshot-critic`
- `game-playability-verifier`
- `game-audio-feedback-audit`
- `game-feel-audit`

### Trigger examples
- Requests like `做一个 Douyin H5 Interactive 作品`, `抖音互动作品`, `抖音互动空间`, `抖音互动H5`, `竖屏 H5 互动页`, or `平台只接受 H5，要先定框架、文件结构和适配方式` should strongly bias toward `game-douyin-h5-interactive` during Build routing.
- If the same request also includes real-time browser gameplay, combine it with `game-web-2d-specialist` after the platform shell and route are locked.

## Rules
- Do not jump straight into implementation before classifying the task.
- Prefer specialized skills over ad hoc reasoning.
- Keep the quality target explicit: `first-playable`, `polished-prototype`, `production-feature`, or `live-patch`.
- For live or risky projects, prefer audit-first and surgical changes.
- Treat single-prompt game generation as a high-ambiguity build problem, not as a trivial implementation request.
- Before coding browser games, lock the spatial model, camera/view model, control grammar, obstacle grammar, and first-30-seconds promise.
- Default to high-precision questioning for greenfield and showcase game work.
- If the host supports subagents and the user wants the strongest result rather than the cheapest one, prefer a builder + reviewer + verifier loop instead of one long monolithic pass.
- If the host supports parallel subagents and the task splits cleanly, parallelize builders only across disjoint ownership zones.
- Require a fresh runtime verification pass before claiming a benchmark or showcase build is complete.
- When the task involves cross-project reference or benchmarking (e.g. "match project B's quality in area X"), use Audit track on the reference project first, extract the specific patterns, then apply them to the target project via Repair or Build.

## Output expectation

At the start, state:
- which track you selected
- current project state
- output strategy (inline / minimal / full)
- which 2–5 Game Superpowers skills you are using next
