---
name: game-douyin-h5-interactive
description: Use when building or structuring a Douyin H5 Interactive work, including requests phrased as 抖音互动作品, 抖音互动空间, 抖音互动H5, or 平台只接受H5. Best when the project must stay portrait-first H5 and needs a clear app shell, file structure, route choice, and adaptation rules before coding.
license: MIT
compatibility: Claude Code and Codex. Best results with file read/write access.
metadata:
  author: game-superpowers
  version: "1.0.0"
  domain: game-development
---

# Game Douyin H5 Interactive

## Goal
Turn a vague "Douyin H5 Interactive" request into a concrete browser delivery shape before implementation starts.

## Outputs

Respect the output strategy set by `using-game-superpowers`:
- **inline** (default): present the platform route, shell rules, file structure, and adaptation constraints in conversation.
- **minimal** or **full**: write or update `docs/game-studio/platform-implementation.md`.

Use `../../shared/templates/douyin-h5-shell.md` whenever a persisted shell decision record would help.

## Use when
- the platform is explicitly `Douyin H5 Interactive`, `抖音互动作品`, `抖音互动空间`, or `抖音互动H5`
- the deliverable must remain `H5-only`
- the work is portrait-first and mobile-first
- the user needs guidance on app shell, screen structure, canvas vs multi-screen route, or vertical adaptation before coding

## Common phrasings
- `做一个抖音互动作品`
- `做一个抖音互动空间`
- `做一个抖音互动H5`
- `平台只接受H5，要竖屏适配`
- `先定项目框架、文件结构和适配方式`
- `先别写玩法，先把H5壳和结构定下来`

Treat these as strong signals that the platform shell and portrait delivery shape should be locked before deeper implementation specialization.

## Use
- `../../shared/reference/douyin-h5-interactive.md`
- `../../shared/checklists/ui-ux-hard-rules.md`
- `../../shared/reference/browser-2d-specialist.md`

## Cover
- choose the product route first: `screen-first interactive`, `canvas-playable interactive`, or `world/canvas plus DOM HUD`
- lock the portrait shell before feature expansion
- define the design-space and viewport adaptation model before placing interaction targets
- define the minimum product-state surface: `loading`, `menu`, primary interactive state, and `result`, with `pause/help` and `error fallback` added when the product shape needs them
- define file ownership so screens, systems, and assets do not collapse into one file
- protect one-handed play, safe areas, and first-action clarity

## Route choice
- Use `screen-first interactive` when the work is quiz, branching interaction, light narrative, multi-page reveal, or text-heavy participation.
- Use `canvas-playable interactive` when the work depends on aiming, timing, physics, spatial play, or a continuous real-time loop.
- Use `world/canvas plus DOM HUD` when the primary interaction is spatial, but onboarding, HUD, result packaging, and overlays still need responsive DOM UI.

If the request still mixes multiple routes, do not silently improvise a hybrid. Lock one primary route first.
If the route still cannot be locked from the prompt, ask a clarifying question or route upward to `game-requirements-brainstorm` before implementation.

## Lock the portrait shell first
- Require `viewport-fit=cover` and portrait-first layout assumptions.
- Use a single `app-shell` that owns the visual ratio, safe-area padding, and overflow behavior.
- Use a fixed design ratio or fixed design-space before tuning details.
- Treat the screen shell and the interactive core as separate layers.
- Keep critical actions in comfortable portrait thumb zones unless the concept explicitly demands otherwise.

## Project structure

Use one of these shapes, depending on route:

### 1. Screen-first interactive
- `index.html`
- `css/styles.css`
- `js/app.js`
- `js/ui/`
- `js/data/`
- `js/config/`
- `images/` or `assets/`

### 2. Canvas-playable interactive
- `index.html`
- `css/styles.css`
- `js/main.js`
- `js/core/`
- `js/game/`
- `js/ui/`
- `js/input/`
- `js/audio/`
- `js/config.js`
- `assets/`

### 3. World/canvas plus DOM HUD
- `index.html`
- `css/styles.css`
- `js/game.js` or `js/main.js`
- `lib/` only for real shared runtime code, not for dumping unrelated helpers
- `js/rules/` or `js/core/` when gameplay logic needs its own boundary
- `images/` or `assets/`

## Important adaptation rules
- Define whether the product uses `ratio shell only` or `design-space plus viewport mapping`.
- If canvas is involved, remap input coordinates into design-space instead of assuming raw viewport coordinates are good enough.
- Keep HUD and overlays outside the playfield when text density, safe-area handling, or responsive layout matter.
- Lock result-state structure early enough that it does not become a bolted-on extra screen.

## Do not do these
- Do not start from a desktop layout and shrink it into portrait later.
- Do not leave route choice implicit when the request could mean either multi-screen interaction or real-time gameplay.
- Do not mix DOM state, gameplay state, and adaptation math in one oversized file.
- Do not treat safe-area padding as the full mobile adaptation problem.
- Do not overload the top and bottom bands with permanent UI just because portrait space feels available.

## Boundary with other skills
- Use this skill to lock the platform-specific H5 shape.
- Use `game-ux-flow-designer` to shape onboarding, menus, CTA hierarchy, and first-minute comprehension.
- Use `game-web-2d-specialist` after the browser route is chosen and the project needs concrete 2D implementation guidance.
- Use `game-feedback-design` after the shell and route are explicit.
