# Runtime

These faults look fine in source and break in play. Check the ones that apply to the project's engine and platform.

## Time and simulation

- Scale movement, timers and animation by frame delta, or run gameplay on a fixed timestep. Otherwise speed changes with frame rate: a game tuned at 60 Hz runs twice as fast on a 120 Hz screen.
- Run physics and collision on a fixed step (for example 1/60 s) and render with interpolation. Clamp large deltas after a stall so objects do not tunnel through walls or teleport.
- Pause the simulation when the tab or app loses focus, unless the design says otherwise. Use the project's random seed or RNG wrapper wherever runs must be reproducible.

## Input

- Read input state every frame and handle edge transitions explicitly (pressed, held, released). Clear held keys on blur, pause and scene change so nothing stays stuck.
- Action games usually need a short input buffer and coyote time. Start near 100 ms each and tune by feel.
- Support the intended devices: keyboard plus pointer, touch with sufficiently large targets, gamepad where expected. Prevent page scroll, zoom and the context menu from stealing touch or keyboard input in web games.

## Audio

- Browsers block audio until a user gesture. Unlock or resume the audio context on the first click, tap or key press, and route sounds through one mixer that has master, music and SFX volumes.
- Preload short effects. Limit how many copies of the same sound can play at once.

## Screen

- Size the canvas for devicePixelRatio and handle resize and orientation changes. Keep the playfield and HUD inside the safe area.
- Choose one scaling policy (fit, fill or fixed with letterbox) and use it consistently for both input mapping and rendering.

## Performance

- Hold a steady frame rate on the target device before adding content. Pool frequently spawned objects, avoid per-frame allocations in hot loops, batch draws and keep texture sizes sensible.
- Profile before optimizing: measure frame time, draw calls and memory instead of guessing.

## Loading and saves

- Show progress or a responsive screen while loading. Load failures must surface an error, not a blank screen.
- Save versioned data at meaningful moments and validate it on load. Corrupt or outdated saves should fall back safely without crashing.
