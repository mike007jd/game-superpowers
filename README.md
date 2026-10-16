# Game Superpowers

[简体中文](./README.zh-CN.md)

One compact skill for building and improving games: gameplay, presentation, game feel, and the player experience.

## Install

Use the npm-distributed [skills CLI](https://github.com/vercel-labs/skills):

```sh
npx skills add mike007jd/game-superpowers --skill game-superpowers -a codex claude-code -g
```

This installs for Codex and Claude Code across projects. Omit `-g` for a project installation; omit `-a codex claude-code` to choose agents interactively.

Update or remove this global installation:

```sh
npx skills update game-superpowers -g
npx skills remove game-superpowers -a codex claude-code -g
```

For project installations, use `-p` instead of `-g` when updating, and omit `-g` when removing.

## Use

The skill loads automatically when a request involves making, fixing or critiquing a game. To force it, invoke `$game-superpowers` in Codex or `/game-superpowers` in Claude Code, followed by your request:

```text
Use $game-superpowers to turn this idea into a playable game.
Use $game-superpowers to improve this game's core interaction and pacing.
Use $game-superpowers to make the HUD and first-play experience clearer.
```

## Why it is small

Inspired by [BubuGameSkill](https://github.com/mike007jd/BubuGameSkill): keep the game craft, leave room for the model's judgment, and load detail only when it helps the task. One entrypoint replaces the old skill collection. General development procedures, platform-specific workflows and fixed genre assumptions are removed.

- [SKILL.md](skills/game-superpowers/SKILL.md) — the entrypoint.
- [Gameplay](skills/game-superpowers/references/gameplay.md) — player actions, choices, systems, and content.
- [Presentation](skills/game-superpowers/references/presentation.md) — visuals, motion, sound, and feedback.
- [Player experience](skills/game-superpowers/references/player-experience.md) — controls, UI, onboarding, and flow.
- [Runtime](skills/game-superpowers/references/runtime.md) — timing, input, audio, screens, performance, and saves.

[evals/evals.json](evals/evals.json) holds test prompts for comparing agent output with and without the skill. It is not installed with the skill.

## Upgrading from the old collection

The `gsp-*` skills, `using-game-superpowers`, custom installers, and automatic sync hooks are no longer provided. Existing installations are not migrated automatically. Before updating an old checkout, use its original uninstall method and remove only its Game Superpowers sync-hook blocks; preserve unrelated hooks and skills. Then install the single skill above. The new CLI commands manage the new installation; they do not clean up legacy installations.

[MIT License](LICENSE)
