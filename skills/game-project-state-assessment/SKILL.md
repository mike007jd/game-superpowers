---
name: game-project-state-assessment
description: Use before major game work begins. Inspect the repo and request to classify the project as greenfield, prelaunch iteration, shipped product, or live-risky work. This determines whether aggressive AI-native development is appropriate.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell access helps inspect builds and repo state.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Project State Assessment

## Goal
Determine what kind of project this is **before** choosing scope, architecture, or task sizing.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present project state assessment in conversation.
- **minimal** or **full**: write `docs/game-studio/project-state.md` using `../../shared/templates/project-state-assessment.md`.

Use:
- `../../schemas/project-state.schema.json`

## What to inspect
Look for evidence such as:
- existing source tree size and maturity
- deployment configs
- CI / CD pipelines
- release notes / changelogs
- analytics / telemetry
- app store or distribution metadata
- save data, migrations, versioning, or liveops systems
- production environment files or operational runbooks
- existing user-facing docs or screenshots

## Classification rules
- **greenfield**: empty repo, tiny scaffold, or explicit from-scratch instruction
- **existing prototype / prelaunch**: meaningful code exists, but little evidence of live-product operational risk
- **shipped product**: release / deployment / store / production signals exist
- **live-risky**: shipped product plus clear signals of live users, data compatibility, or operational constraints

## Unknowns
If critical status cannot be inferred, ask only a few decisive questions.
Do not ask long interviews.
