---
name: game-scope-completeness-audit
description: Audit whether the project matches its intended scope and quality target, and identify fake-complete vs actually-complete features.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.0"
  domain: game-development
---

# Game Scope Completeness Audit

## Goal
Audit what the project is supposed to be, what it currently is, and where scope or completeness assumptions are misleading.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present findings in conversation.
- **minimal** or **full**: write to `docs/game-studio/audit/audit-summary.md`, `docs/game-studio/audit/scorecard.json`, `docs/game-studio/audit/repair-roadmap.md`.

Use:
- `../../shared/checklists/scope-completeness-audit-checklist.md`
- `../../shared/reference/scope-tiers.md`
- `../../shared/reference/quality-targets.md`

## Evaluate
- claimed target vs actual target (`first-playable`, `polished-prototype`, `production-feature`, `live-patch`)
- must-have features complete vs partial vs placeholder
- surface-level completeness hiding missing loop closure
- scope creep and low-value complexity
- where to cut, where to finish, and where to stop pretending something is done

