---
name: game-superpowers
description: Design, build, fix and critique games in any engine or framework (Unity, Godot, Unreal, Phaser, three.js, PixiJS, plain Canvas/WebGL). Use when the user wants to make a game or prototype, add or tune mechanics, levels, difficulty or progression, fix game feel (floaty jumps, weak hits, laggy controls, camera shake), improve game visuals, animation, VFX, sound or HUD, or review a game, screenshot or playtest. Also covers 小游戏、游戏原型、玩法、手感、关卡、打击感、游戏 UI.
---

# Game Superpowers

Start from the current game and the requested change. If the project already has a direction and engine, keep them. When starting fresh, pick the engine and style that best serve the core interaction. For an open brief, decide what the player does, why it matters and how it should feel. Ask only about missing decisions that would materially change the game.

Build around action → feedback → consequence → next decision. For a new game, make that loop playable first, then expand to the requested scope. For a targeted change, work directly on the affected experience. A concept, prototype, full game and critique have different deliverables; follow the user's request.

Read the references that match the work. For a new game, read all four.

- [Gameplay](references/gameplay.md): mechanics, choices, pacing, progression and difficulty.
- [Presentation](references/presentation.md): game feel, camera, art, animation, VFX and sound.
- [Player experience](references/player-experience.md): teaching, HUD, controls and transitions.
- [Runtime](references/runtime.md): timing, input, audio, screens, performance and saves; the bugs that make a game break or feel wrong.

To improve a game, find the largest gap in the ordinary player's experience, fix its cause, then check the result. Keep assets, scene bindings and player triggers connected: an asset that is never loaded or a feature reachable only through a debug route is not done.

Run what you build. Whenever the environment can launch the game (dev server, headless browser, engine CLI), start it after meaningful changes and confirm that it loads without errors, the first screen renders and the core action responds. Use screenshots or scripted input when available. Heavy test suites, release builds and formal reports wait for the user's request. If you could not run something, say so.

For critique, describe the observed problem, its effect on the player and a concrete improvement. Keep observation separate from inference: source reveals rules, screenshots reveal composition, motion reveals timing, listening reveals the mix, and player feedback reveals understanding and enjoyment.

Match the user's scope and quality bar. Deliver the requested artifact, then briefly state what changed, what you verified and what remains unobserved.
