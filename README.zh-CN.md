# Game Superpowers

[English](./README.md)

一个面向 Claude Code 和 Codex 的、**以 skills 为核心** 的开源游戏开发系统。

Game Superpowers 不是游戏引擎，也不是以插件为中心的产品。它是一套可复用的 **Agent Skills**，用于构建、审计、打磨和推进游戏项目。

这个项目的目标很简单：

> 在同一个模型、同一个 prompt 的前提下，让 agent 因为用了正确的游戏领域 skills，而产出更好的游戏结果。

## 为什么改成 skills-first

我们决定把这个项目正式收敛到 **skills** 层，而不是继续以插件为中心。

原因：
- Claude Code 和 Codex 都已经原生支持 skills
- skills 才是这套系统真正有价值的部分
- skills 更容易被 fork、审查、修改、组合
- 开源协作时，skills 比插件包装层更清晰
- 这个项目的核心是方法论和流程，不是 marketplace 分发壳

对于 Codex，官方把 skills 定义为工作流的 authoring format；对于 Claude Code，skills 可以存在于 personal、project 或 plugin scope。这个仓库选择把 **skills 层** 作为唯一的 source of truth。

## 仓库内容

- `skills/`：完整的 Game Superpowers skills 库
- `schemas/`：结构化输出 schema
- `shared/`：模板、参考资料、检查表、示例
- `.claude/skills/`：供 Claude Code 发现的兼容性 symlink 路径，实际指回 `skills/`
- `.agents/skills/`：供 Codex 发现的兼容性 symlink 路径，实际指回 `skills/`
- `scripts/`：安装脚本和校验脚本

请注意：
- `skills/` 是唯一的 source of truth
- `.claude/skills/` 和 `.agents/skills/` 不是第二份内容副本
- 如果你所在的平台、压缩包工具或文件浏览器对 symlink 支持不好，请优先查看 `skills/`

## 核心思路

Game Superpowers 分成两条主线：

### Build Track
适用于从零开始、做大功能、做 prototype、做 vertical slice、做 AI-native 快速开发。

### Audit Track
适用于已有项目、UI/UX 审计、反馈设计审计、架构审计、完整度审计、线上风险分析。

这套库的抽象是 **game-native** 的，而不是单纯 framework-native 的。它关注：
- fantasy
- scope
- UX flow
- HUD readability
- feedback design
- game feel
- mechanics clarity
- production readiness
- live risk

而不是只关注底层图形库或前端框架。

## 案例

这个仓库的目标不是只让第二轮修改更强，而是让第一次产出就明显更像一个可玩的游戏。

下面这个案例里，两次运行都使用了：

- OpenCode
- 同一个模型：`MiniMax-M2.7-highspeed`
- 同一个 FPS 任务

关键区别只是其中一次使用了 `/using-game-superpowers`。

### 同模型、同任务、首轮结果差距

<table>
  <tr>
    <td><strong>不用 Game Superpowers</strong></td>
    <td><strong>使用 Game Superpowers</strong></td>
  </tr>
  <tr>
    <td><img src="./docs/case-studies/assets/one-prompt-fps/result-without-game-superpowers.jpg" alt="不用 Game Superpowers 的结果" width="100%"></td>
    <td><img src="./docs/case-studies/assets/one-prompt-fps/result-with-game-superpowers-gameplay.jpg" alt="使用 Game Superpowers 的结果" width="100%"></td>
  </tr>
</table>

> 这两边展示的都是第一次 prompt 的结果，这也是这个仓库最关心的标准。

| 维度 | 不用 Game Superpowers | 使用 Game Superpowers |
| --- | --- | --- |
| 首轮结果 | 这次运行里无法稳定进入可玩状态 | 可以启动并游玩的 FPS 结果 |
| 语言一致性 | UI / 提示存在语言混用 | UI / 提示保持英文一致 |
| 交互质量 | 起始流程弱，反馈也不够清楚 | 起始流程更清晰，UI、反馈和声音更完整 |
| 整体表现 | 更像粗糙 blockout | 美术方向、界面和游戏感更完整 |

### 这个案例里包含什么

- prompt 截图
- 结果截图
- 可下载的单文件 HTML
- 明确标注的同模型对比条件

完整说明和可下载文件见 [`docs/case-studies/one-prompt-fps.md`](./docs/case-studies/one-prompt-fps.md)。

### 欢迎更多社区 Benchmark

如果你想真正测试这个仓库，不要只看文案，最好自己做同任务对比。

我们尤其欢迎这些方向的案例：

- 原始模型输出 vs Game Superpowers
- 不同模型下的同任务对比
- Game Superpowers vs 其他游戏向 agent 工作流

Benchmark 提交建议见 [`docs/community-benchmarks.md`](./docs/community-benchmarks.md)。

## 安装

完整安装说明见 [`INSTALL.md`](./INSTALL.md)。
贡献规则见 [`CONTRIBUTING.md`](./CONTRIBUTING.md)。
协作行为准则见 [`CODE_OF_CONDUCT.md`](./CODE_OF_CONDUCT.md)。

### Claude Code
推荐两种方式：
1. **project / add-dir 模式**：使用 `claude --add-dir /path/to/game-superpowers`
2. **personal install 模式**：用脚本把 skills 链接到 `~/.claude/skills/`

说明：
- 安装脚本创建的是 symlink，不是复制出的目录
- 如果你是通过 ZIP 下载仓库，或者当前环境对 symlink 支持不好，请把 `skills/` 当作真实库，并参考 `INSTALL.md` 里的 fallback 说明

### Codex
推荐两种方式：
1. **user install**：把本仓库 skills 链接到 `~/.agents/skills/`
2. **repo-scoped install**：把技能复制或链接到项目的 `.agents/skills/`

说明：
- Codex 安装脚本会在 `~/.agents/skills/` 下创建一个 `game-superpowers` 包根目录，并把本仓库的各个 skill 目录以及 `shared/`、`schemas/` 链接进去
- 如果这种 symlink 结构看起来让人困惑，请直接把 `skills/` 理解为真实技能库，把 `.agents/skills/` 理解为兼容路径

## 用法

### 总入口
- Claude：`/using-game-superpowers`
- Codex：`$using-game-superpowers`

### 示例
- “Use Game Superpowers to audit this existing game project’s UI/UX and feedback design.”
- “Use Game Superpowers to build a polished 2D web prototype with strong HUD and feedback.”
- “Use Game Superpowers to review whether this game is closer to first-playable or production-feature quality.”

## 为什么不是插件仓库

以后仍然可以有人基于这个仓库再打成插件，但这个仓库本身保持 **skills-first**：
- 更容易理解
- 更容易 fork
- 更容易看 diff
- 更适合本地开发和持续 dogfood
- 更适合组合进项目自己的 AI 工作流

## 开源重点

建议先看：
- `skills/using-game-superpowers/SKILL.md`
- `skills/game-super-build/SKILL.md`
- `skills/game-project-audit/SKILL.md`
- `skills/game-ux-flow-audit/SKILL.md`
- `skills/game-feedback-design/SKILL.md`

提交 PR 前，建议先运行：

```bash
python3 scripts/validate_skills.py
```

## License

MIT
