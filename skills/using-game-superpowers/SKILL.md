---
name: using-game-superpowers
description: "Use when the task is about building, auditing, or improving a game project with this Game Superpowers skill collection. Acts as the collection bootstrap skill: classify the request, choose the right specialized game skills, and coordinate them instead of trying to solve the entire task ad hoc."
---
# Using Game Superpowers

Use this skill as the collection entrypoint for the Game Superpowers library.

## Purpose

This skill does not replace specialized skills. It decides **which Game Superpowers skills should be used next** and in what order.

## When to use

Use this skill when the request involves any of the following:
- designing or building a new game feature or prototype
- auditing an existing game project
- improving game UI/UX, feedback, flow, or feel
- planning scope, production readiness, or live-safe changes
- choosing between build, audit, repair, and polish tracks

## Classification

First classify the request into one of these tracks:
1. **Build track** — new project work, large feature work, prototype work, vertical slice work
2. **Audit track** — existing project diagnosis, read-only review, risk assessment, UX review
3. **Repair track** — user wants targeted fixes after diagnosis
4. **Polish track** — user already has working gameplay and wants better feel, UI/UX, feedback, or production quality

Also classify project state:
- `greenfield`
- `existing-prelaunch`
- `live-risky`

## Required routing behavior

### For greenfield or large new work
Start with:
- `game-concept-brainstorm` if fantasy / goals are unclear
- `game-scope-profile`
- `game-build-strategy`
- `game-super-build`

Then route into whichever of these are needed:
- `game-ux-flow-designer`
- `game-feedback-design`
- `game-loop-bootstrap`
- `game-mechanics-systems-design`
- `game-web-2d-specialist`
- `game-web-3d-specialist`
- `game-polished-prototype`
- `game-production-feature`

### For existing projects and audits
Start with:
- `game-project-state-assessment`
- `game-project-audit`

Then load relevant audit skills such as:
- `game-ux-flow-audit`
- `game-hud-readability-audit`
- `game-feedback-audit`
- `game-audio-feedback-audit`
- `game-feel-audit`
- `game-mechanics-systems-audit`
- `game-scope-completeness-audit`
- `game-production-readiness-audit`
- `game-architecture-maintainability-audit`
- `game-live-risk-audit`
- `game-audit-scorecard`
- `game-repair-roadmap`

### For polishing or quality uplift
Bias toward:
- `game-hud-feedback-polish`
- `game-feedback-design`
- `game-screenshot-critic`
- `game-playability-verifier`
- `game-audio-feedback-audit`
- `game-feel-audit`

## Operating principles

- Do not jump straight into implementation before classifying the task.
- Prefer specialized skills over ad hoc reasoning.
- Keep the user aligned on quality target: `first-playable`, `polished-prototype`, `production-feature`, or `live-patch`.
- For live or risky projects, prefer audit-first and surgical changes.
- For greenfield AI-native work, allow larger coherent changes when the user explicitly wants aggressive progress.

## Output expectation

At the beginning of a task, briefly state:
- which track you selected
- current project state
- which 2–5 Game Superpowers skills you are using next

Then proceed with those specialized skills.
