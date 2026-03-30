# Game Superpowers v1.2.0 — Skills-Only Release

This release formalizes the project as a **skills-first** open-source system for Claude Code and Codex.

## What changed

- Reframed the repository around **skills** instead of plugins
- Added `using-game-superpowers` as the collection bootstrap skill
- Rewrote installation docs for native Claude and Codex skills flows
- Added scripts for Claude and Codex skills installation / uninstall
- Added contribution and collaboration docs for open-source use
- Reorganized open-source documentation around build track + audit track

## What is in the repository

- `skills/` as the source-of-truth Game Superpowers library
- `schemas/` for structured outputs and shared contracts
- `shared/` for templates, checklists, and reference material
- `.claude/skills/` and `.agents/skills/` as host discovery compatibility paths
- `scripts/` for installation, validation, and ClawHub packaging helpers

## Compatibility

This release is designed around one shared skill system with host-specific distributions:

- Claude Code
- Codex
- OpenClaw / ClawHub packaging work in progress

The repository keeps the skill content unified and uses packaging or discovery layers per host rather than maintaining three separate implementations.

## Why this matters

The value of Game Superpowers lives in:
- game-specific workflow logic
- UI/UX and feedback-aware routing
- project-state-aware build and audit flows
- reusable skills that remain easy to fork and remix

Shipping the repository as a skills collection makes it easier to:
- use locally
- contribute to
- customize for a team or project
- keep cross-host compatible

## Highlights

- skills-first distribution
- build track and audit track
- collection bootstrap skill
- Claude-friendly `--add-dir` flow
- Codex-friendly symlink flow
- ClawHub-ready publish bundle generation under `publish/clawhub/`

## Open-source baseline

This release also establishes the public repository baseline:

- `README.md` and `README.zh-CN.md`
- `INSTALL.md`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `LICENSE`
- validation via `python3 scripts/validate_skills.py`

## Notes

Downstream plugin packaging remains possible, but it is no longer the source of truth for this project.

---

# Game Superpowers v1.2.0 — Skills-Only Release（中文）

这个版本正式把项目收敛为一个面向 Claude Code 和 Codex 的、**以 skills 为核心** 的开源系统。

## 这次改了什么

- 项目叙事从“插件分发”改成“skills collection”
- 新增 `using-game-superpowers` 作为整套技能库的总入口
- 安装文档改成 Claude / Codex 的原生 skills 方案
- 新增 Claude / Codex 的安装与卸载脚本
- 补齐了开源协作所需的贡献规范和行为准则
- 开源文档重新围绕 build track + audit track 整理

## 仓库里现在有什么

- `skills/` 作为唯一 source of truth 的 Game Superpowers 技能库
- `schemas/` 用于结构化输出和共享约束
- `shared/` 用于模板、检查表和参考资料
- `.claude/skills/` 与 `.agents/skills/` 作为宿主发现兼容路径
- `scripts/` 用于安装、校验和 ClawHub 打包

## 兼容与分发

这次 release 的定位是“一套统一技能系统，多宿主分发适配”，当前围绕以下宿主展开：

- Claude Code
- Codex
- OpenClaw / ClawHub 打包流程正在补齐

也就是说，核心 skill 不做三套分叉，而是保持统一内容，通过不同宿主的发现或发布层来适配。

## 为什么重要

Game Superpowers 的真正价值在于：

- 游戏领域工作流逻辑
- UI/UX 和反馈感知的路由方式
- 基于项目状态的 build / audit 流程
- 容易 fork、容易改、容易组合的 skills

用 skills collection 的方式发布，意味着它会更容易：

- 本地使用
- 开源协作
- 团队定制
- 跨宿主兼容

## 亮点

- skills-first 分发
- build track 和 audit track
- collection bootstrap skill
- Claude 的 `--add-dir` 使用方式
- Codex 的 symlink 安装方式
- `publish/clawhub/` 下的 ClawHub 发布包生成能力

## 开源基础件

这次 release 也把公开仓库的基础件补齐了：

- `README.md` 和 `README.zh-CN.md`
- `INSTALL.md`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `LICENSE`
- `python3 scripts/validate_skills.py` 本地校验流程

## 说明

以后仍然可以有人基于这个仓库再打成插件，但插件不再是这个项目的 source of truth。
