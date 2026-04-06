# Douyin H5 Shell Template

Use this template to lock the platform shell before implementation.

## Product route
- **Primary route**: `screen-first interactive` | `canvas-playable interactive` | `world/canvas plus DOM HUD`
- **Why this route wins**:
- **What was explicitly rejected**:

## Platform constraints
- **Delivery target**: `Douyin H5 Interactive` | `抖音互动空间` | `抖音互动H5`
- **H5-only**: yes / no
- **Primary orientation**: portrait
- **Primary input**: touch
- **One-hand priority**: yes / no
- **Fallback for landscape**: ignore | soft warning | rotate prompt | constrained fallback layout

## Shell decisions
- **Viewport rule**: `viewport-fit=cover`
- **Root shell**: `app-shell`
- **State container**: `screen-stack` | equivalent
- **Height rule**: `100dvh`
- **Width rule**: `max-width: calc(100dvh * (designWidth / designHeight))`
- **Safe-area tokens**:
  - top:
  - bottom:

## Design-space model
- **Design width**:
- **Design height**:
- **Adaptation model**: `ratio shell only` | `design-space plus viewport mapping`
- **If viewport mapping is used, lock these values**:
  - `scale`
  - `offsetX`
  - `offsetY`
  - world width / height ownership

## Minimum state surface
- `loading`:
- `menu` or `welcome`:
- primary interactive state:
- `result`:
- optional `pause/help`:
- optional `error fallback`:

## File structure

### Shared root
- `index.html`
- `css/styles.css`
- `assets/` or `images/`

### If screen-first interactive
- `js/app.js`
- `js/ui/`
- `js/data/`
- `js/config/`

### If canvas-playable interactive
- `js/main.js`
- `js/core/`
- `js/game/`
- `js/ui/`
- `js/input/`
- `js/audio/`
- `js/config.js`

### If world/canvas plus DOM HUD
- `js/game.js` or `js/main.js`
- `js/core/` or `js/rules/`
- `lib/` only for reusable runtime utilities

## Ownership boundaries
- **Shell/layout owner**:
- **Screen state owner**:
- **Gameplay state owner**:
- **Adaptation math owner**:
- **HUD/overlay owner**:
- **Asset preload owner**:

## Portrait budget
- **Top band reserved for**:
- **Bottom band reserved for**:
- **Middle third protected for**:
- **What must stay out of permanent HUD**:

## Result-state requirements
- **What the result must communicate**:
- **What action the user can take next**:
- **Whether result art or summary packaging is required**:

## Risks to kill early
- route ambiguity:
- shell vs gameplay coupling:
- safe-area and thumb-zone pressure:
- canvas input remap mistakes:
- oversized first screen or first bundle:
