# Douyin H5 Interactive Reference

Use this reference when the product must ship as a portrait-first H5 interactive work for Douyin-style distribution, including requests described as `Douyin H5 Interactive`, `抖音互动作品`, `抖音互动空间`, or `抖音互动H5`.

## What to lock before coding
- The product stays `H5-only`.
- The primary orientation is portrait.
- The route is explicit: `screen-first interactive`, `canvas-playable interactive`, or `world/canvas plus DOM HUD`.
- The design-space model is explicit before detailed layout work begins.

If the route is still unclear, stop and ask for clarification before choosing a structure.

## Shared shell pattern
- Use `meta viewport` with `viewport-fit=cover`.
- Use one `app-shell` as the ratio-bound root container.
- Use `screen-stack` or an equivalent state container even when the product has only one main playable state.
- Respect safe areas with explicit top and bottom tokens.
- Keep the page height on `100dvh` rather than old viewport units.
- Bind the content width to a portrait design ratio instead of letting landscape desktop width define the whole composition.

## Recommended shell CSS traits
- `height: 100dvh`
- `max-width: calc(100dvh * (designWidth / designHeight))`
- `margin: 0 auto`
- `overflow: hidden`
- `safe-area` tokens using `env(safe-area-inset-top)` and `env(safe-area-inset-bottom)`

These values are not style fluff. They define the operating space for the whole product.

## Route guide

### Screen-first interactive
Use when the experience is mainly page flow, question flow, branching choices, reveal cadence, or light interaction between screens.

Strong defaults:
- `index.html`
- `css/styles.css`
- `js/app.js`
- `js/ui/`
- `js/data/`
- `js/config/`

Expect:
- `welcome / mode / intro / interactive / reveal / result`
- modal or overlay ownership
- error fallback state
- explicit screen ownership and transition ownership

### Canvas-playable interactive
Use when the core loop is timing, aiming, dodging, merging, tapping, dragging, or continuous spatial play.

Strong defaults:
- `js/main.js`
- `js/core/`
- `js/game/`
- `js/ui/`
- `js/input/`
- `js/audio/`
- `js/config.js`

Expect:
- a fixed design-space
- canvas resize bound to the shell container
- input coordinate remapping through viewport scale and offset
- DOM HUD only where text and responsive layout are easier outside the render surface

### World/canvas plus DOM HUD
Use when the product has a strong spatial stage, but still needs packaged menus, toasts, overlays, thinking states, or result cards in DOM.

Strong defaults:
- canvas for the stage
- DOM HUD for menu, pause, result, feedback, and safe-area sensitive controls
- shared runtime utilities separated from game-specific rules

## Design-space and adaptation rules
- Decide whether you are using a fixed design ratio only, or a full fixed design-space with viewport mapping.
- For canvas-heavy products, prefer fixed design-space plus viewport mapping.
- Store `scale`, `offsetX`, `offsetY`, and world dimensions in one place.
- Map input into design-space before gameplay logic reads it.
- Resize from the shell container first, not from random nested nodes.

## UI budget in portrait
- Top band: status, one small utility action, or navigation. Not everything at once.
- Bottom band: primary next-step actions.
- Middle third: protect for the main visual promise or playfield.
- Use overlays for explanation, pause, and result rather than permanently shrinking the core experience.

## Minimum state flow
- `loading` when assets or setup are non-trivial
- `menu` or `welcome`
- the primary interactive state
- `pause` or `help` when session length justifies it
- `result`
- `error fallback`

Even a light interactive page should have an intentional failure and recovery path.

## Common failure modes
- treating portrait adaptation as only a CSS media-query problem
- choosing no route and drifting into a fragile hybrid
- building the core loop before the shell and state flow are locked
- overfilling the HUD because portrait seems tall enough
- letting the game core depend directly on DOM structure
- delaying result-page design until the end
