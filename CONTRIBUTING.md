# Making Changes

This repository is the skills-first source of truth for Game Superpowers.

Keep changes small, explicit, and easy to review.

## Good changes

- add a new skill with a single, clear job
- improve routing between existing skills
- sharpen a skill description so invocation is more reliable
- improve shared schemas, templates, or reference material
- fix installation or validation docs

Prefer focused improvements over broad rewrites.

## Repository layout

- `skills/` contains the reusable source-of-truth skills
- `schemas/` contains structured output schemas shared across skills
- `shared/` contains templates, references, and checklists
- `.claude/skills/` and `.agents/skills/` are host-facing compatibility paths
- `scripts/` contains installation and validation helpers

## Skill rules

When changing or adding a skill:

1. Keep the skill focused on one job.
2. Keep the `name` frontmatter aligned with the folder name.
3. Keep the `description` specific enough for implicit invocation.
4. Prefer routing improvements over bloating a single skill.
5. Preserve the build-track / audit-track split.

If you need a top-level collection entrypoint, use `using-game-superpowers`.

## Skill structure

Each skill lives in:

```text
skills/<skill-name>/SKILL.md
```

The validator expects:

- a folder under `skills/`
- a `SKILL.md` file
- YAML frontmatter at the top
- `name` matching the folder name
- a non-empty `description`
- a non-empty body

Skill names should use lowercase kebab-case, for example:

```text
game-feedback-design
```

## Validation

Run:

```bash
python3 scripts/validate_skills.py
```

Fix validator errors before submitting.

## Editing guidance

- Keep wording concrete and operational.
- Avoid turning one skill into a grab bag of loosely related tasks.
- Prefer introducing a new skill when the responsibility is distinct.
- Keep docs and install instructions aligned with the current repository layout.
- Do not commit local machine files such as `.DS_Store`, editor swap files, logs, or `.env` files.

## Compatibility

- `skills/` is the only source of truth.
- `.claude/skills/` and `.agents/skills/` exist to make host discovery easier.
- Installation scripts in `scripts/` are the supported way to wire the collection into Claude Code or Codex.

When changing layout or install behavior, update `README.md` and `INSTALL.md` in the same pull request.

## Pull requests

A pull request should:

- explain the problem being solved
- keep scope tight
- mention any affected skills or docs
- confirm that `python3 scripts/validate_skills.py` passes locally

If your change affects install behavior or discovery behavior, include a short note about how you tested it.
