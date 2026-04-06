# Game Implementation Plan Template

The plan must follow the chosen development mode.
Do **not** artificially break work into tiny human-style tickets when a larger AI-native chunk is cleaner and safer.

## Mode-based task sizing
- **yolo-super**: tasks can be 30–120 minutes of agent work and may touch many files when they deliver a coherent subsystem or end-to-end slice.
- **guided-build**: tasks should usually be 15–45 minutes and still leave the game runnable often.
- **refactor-open**: tasks should usually be 15–60 minutes, with explicit migration / replacement notes.
- **surgical-live**: tasks should usually be 5–20 minutes with narrow blast radius and strong rollback notes.

## Task format

### TASK-001 — Short name
- **Mode**
- **Goal**
- **Why now**
- **Primary builder**
- **Reviewer**
- **Verifier**
- **Files to touch**
- **Exact change**
- **Verification**
- **Rollback / fallback**
- **Done when**

## Planning rules
- Match the task size to the selected mode.
- Prefer end-to-end slices over placeholder scaffolding.
- In greenfield aggressive modes, build complete coherent chunks instead of endless TODO frames.
- In live modes, preserve stability and compatibility.
- If the chosen backend profile is still uncertain, resolve that before deep implementation.
- For benchmark, showcase, and polished-prototype work, assume every serious task will pass through builder, reviewer, and verifier unless the user explicitly opts out.
