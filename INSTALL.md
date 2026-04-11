# Installing Game Superpowers (Skills-Only)

This repository is distributed as a **skills collection**.

It does **not** require plugin packaging to be useful.

## Official compatibility model

### Claude Code
Claude Code supports skills in:
- `~/.claude/skills/<skill-name>/SKILL.md` for personal skills
- `.claude/skills/<skill-name>/SKILL.md` for project skills
- directories added with `--add-dir` if they contain `.claude/skills/...`

### Codex
Codex supports skills in:
- `~/.agents/skills/` for user skills
- `.agents/skills/` inside repositories for repo-scoped skills
- symlinked skill folders in those locations

## Repository layout used here

This repo keeps the source-of-truth skills in:
- `skills/`

And provides compatibility paths:
- `.claude/skills/` → symlinks into `skills/`
- `.agents/skills/` → symlinks into `skills/`

Important:
- `skills/` is the real library
- `.claude/skills/` and `.agents/skills/` exist to help host discovery
- they are symlink-based compatibility paths, not separate copies
- if your platform, archive tool, or Git client does not preserve symlinks cleanly, work from `skills/` directly

## Claude Code options

### Option A — one-repo session via `--add-dir`

This is the cleanest official path if you want to use the whole collection without flattening it into your home directory.

```bash
claude --add-dir /path/to/game-superpowers-skills-only
```

Because this repository contains `.claude/skills/`, Claude Code will load those skills automatically from the additional directory.

This means:
- Claude discovers the compatibility path
- those entries point back to `skills/`
- `.claude/shared` and `.claude/schemas` also point back to the repository roots that skills reference
- you should edit `skills/`, not `.claude/skills/`

### Option B — personal install

```bash
bash scripts/install-claude-skills.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-claude-skills.ps1
```

This symlinks each skill into `~/.claude/skills/` and also links:

- `~/.claude/shared` -> this repo's `shared/`
- `~/.claude/schemas` -> this repo's `schemas/`

It does not copy the skill folders.

The installer also registers this clone for auto-sync and installs repo-local `post-merge` and `post-checkout` hooks. After that:

- edits to existing skills are visible immediately because the install is symlink-based
- added, renamed, or removed skills refresh automatically after `git pull` and branch switches

If your shell or filesystem does not support symlinks well, copy selected folders from `skills/` into `~/.claude/skills/` manually instead.

To uninstall:

```bash
bash scripts/uninstall-claude-skills.sh
```

## Codex options

### Option A — user install

```bash
bash scripts/install-codex-skills.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skills.ps1
```

This creates a package root directory:

```text
~/.agents/skills/game-superpowers/
```

Inside that package root, the installer creates symlinks for:

- each skill folder from `skills/`
- `shared/`
- `schemas/`

This is important because many Game Superpowers skills reference shared templates, references, and schemas.

The installer also registers this clone for auto-sync and installs repo-local `post-merge` and `post-checkout` hooks, so future `git pull` and branch switches refresh the package root automatically.

If you installed an older version of this repo before this fix, rerun the installer so the legacy single-symlink layout is migrated automatically.

If your environment does not support symlinks cleanly, copy selected skill folders from `skills/` into your target `.agents/skills/` directory instead.

## Manual sync

If you want to refresh both hosts on demand, run:

```bash
bash scripts/sync-all-skills.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File scripts/sync-all-skills.ps1
```

With flags:

```bash
bash scripts/sync-all-skills.sh --claude
bash scripts/sync-all-skills.sh --codex
```

### Option B — repo-scoped install

If you only want these skills inside one project, copy or symlink selected skills into that project’s `.agents/skills/`.

For repo-scoped installs, prefer copying if you want maximum portability for collaborators using ZIP downloads, Windows setups without symlink support, or restrictive filesystems.

## Verifying installation

### Claude
Start a new session and try:

```text
/using-game-superpowers
```

Or ask:

```text
Use Game Superpowers to audit this game project.
```

### Codex
Restart Codex if needed, then try:

```text
$using-game-superpowers
```

Or ask:

```text
Use Game Superpowers to build a polished prototype.
```

## Notes

- Claude project/add-dir mode is the most official-friendly way to use the full collection without a plugin.
- Codex user install works well with symlinked skill folders.
- Claude personal install also links `shared/` and `schemas/` at the `~/.claude/` root because many skills reference them via relative paths.
- The shell installers install repo-local git hooks so later merges and checkouts keep personal installs in sync.
- If `.claude/skills/` or `.agents/skills/` looks strange in a file browser, that is expected: they are compatibility symlink paths that point back to `skills/`.
- If a skill does not appear immediately, restart the host.
