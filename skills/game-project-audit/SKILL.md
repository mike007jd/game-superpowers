---
name: game-project-audit
description: Top-level audit skill for existing game projects. Use it to run a read-first, multi-dimensional audit covering UI/UX, feedback, mechanics, completeness, maintainability, and live risk before any repair work.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access; shell/build access improves evidence quality.
metadata:
  author: game-superpowers
  version: "1.1.1"
  domain: game-development
---

# Game Project Audit

## Goal
Audit an existing game project from multiple dimensions **before** making implementation changes.
Default to **read-only first**.

## Default modes
- `audit-only` — produce findings only
- `audit-and-plan` — produce findings and a repair roadmap
- `audit-and-patch` — audit first, then patch only approved high-value issues

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present all findings, scorecard, and repair directions in conversation. Do not create `docs/` files.
- **minimal**: write only `audit-summary.md` for cross-session reference.
- **full**: create and maintain all files listed below.

Full output files (when strategy = full):
- `docs/game-studio/audit/audit-summary.md`
- `docs/game-studio/audit/scorecard.json`
- `docs/game-studio/audit/ux-findings.md`
- `docs/game-studio/audit/repair-roadmap.md`
- `docs/game-studio/audit/risk-register.md`

Use:
- `../../shared/templates/audit-summary.md`
- `../../shared/templates/audit-scorecard.md`
- `../../shared/templates/ux-findings.md`
- `../../shared/templates/repair-roadmap.md`
- `../../shared/templates/risk-register.md`
- `../../shared/checklists/project-audit-master-checklist.md`
- `../../shared/checklists/ui-ux-hard-rules.md`
- `../../shared/reference/audit-modes.md`
- `../../shared/reference/audit-confidence-and-evidence.md`

## Audit workflow
1. Assess project state and release risk.
   - Use `game-project-state-assessment`.
2. Determine audit mode and focus dimensions.
3. Run the relevant sub-audits:
   - `game-ux-flow-audit`
   - `game-hud-readability-audit`
   - `game-feedback-audit`
   - `game-audio-feedback-audit`
   - `game-feel-audit`
   - `game-mechanics-systems-audit`
   - `game-scope-completeness-audit`
   - `game-production-readiness-audit`
   - `game-architecture-maintainability-audit`
   - `game-live-risk-audit` when the repo is shipped or high-risk
4. Consolidate findings with `game-audit-scorecard`.
5. If requested, create a prioritized fix plan with `game-repair-roadmap`.
6. Only patch after the audit report is written and the requested mode allows edits.

## Rules
- Never start by changing files when the request is clearly an audit.
- Distinguish between **confirmed issues** and **high-confidence inferred issues**.
- Always include evidence and confidence for important findings.
- Prefer game-native language over frontend jargon.
- Call out hard-rule violations when UI flow, HUD pressure, or input-focus conflicts are likely hurting the player experience.

## Stop condition
You are done when the project has a clear audit summary, a dimensional scorecard, a risk register, and a repair roadmap if requested.
