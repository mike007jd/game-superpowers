# Game Superpowers

[English](./README.md)

一个精简的游戏开发 skill，聚焦玩法、表现、手感和玩家体验。

## 安装

使用 npm 分发的 [skills CLI](https://github.com/vercel-labs/skills)：

```sh
npx skills add mike007jd/game-superpowers --skill game-superpowers -a codex claude-code -g
```

为 Codex 和 Claude Code 安装到用户范围，所有项目均可使用。去掉 `-g` 就是项目级安装；去掉 `-a codex claude-code` 可交互选择 agent。

更新或卸载这份全局安装：

```sh
npx skills update game-superpowers -g
npx skills remove game-superpowers -a codex claude-code -g
```

项目级安装更新时把 `-g` 改为 `-p`，卸载时去掉 `-g`。

## 使用

涉及制作、修改或点评游戏的请求会自动加载这个 skill。也可以手动调用：Codex 中用 `$game-superpowers`，Claude Code 中用 `/game-superpowers`，后面直接写需求：

```text
用 $game-superpowers 把这个想法做成可玩的游戏。
用 $game-superpowers 改善这个游戏的核心交互和节奏。
用 $game-superpowers 改善 HUD 和首次游玩体验。
```

## 为什么精简

参考 [BubuGameSkill](https://github.com/mike007jd/BubuGameSkill) 的思路：保留游戏创作知识，让模型根据项目判断，细节按需读取。一个入口替代原来的技能集合，移除通用开发流程、平台专用流程和固定玩法类型预设。

- [SKILL.md](skills/game-superpowers/SKILL.md)：统一入口。
- [玩法](skills/game-superpowers/references/gameplay.md)：玩家行为、选择、系统和内容。
- [表现](skills/game-superpowers/references/presentation.md)：画面、动作、声音和反馈。
- [玩家体验](skills/game-superpowers/references/player-experience.md)：操作、UI、引导和流程。
- [运行时](skills/game-superpowers/references/runtime.md)：时间、输入、音频、屏幕、性能和存档。

[evals/evals.json](evals/evals.json) 是一组测试提示，用来对比装与不装 skill 时 agent 的输出，不会随 skill 一起安装。

## 从旧版升级

不再提供 `gsp-*`、`using-game-superpowers`、自制安装器和自动同步 hooks。旧安装不会自动迁移。更新旧仓库前，先用原安装方式卸载旧包或旧技能，仅移除 Game Superpowers 添加的同步 hook 区块，保留其他 hooks 和技能；随后用上面的命令安装单一 skill。新的 CLI 命令管理新安装，不会清理旧安装。

[MIT 许可证](LICENSE)
