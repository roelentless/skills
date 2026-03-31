# AGENTS.md

## Project

A collection of public agent skills following the [Agent Skills open standard](https://agentskills.io), also compatible with [skills.sh](https://skills.sh). Each skill lives in `skills/<name>/` and consists of a `SKILL.md` with YAML frontmatter and a `README.md` for human docs.

Skills require **no tooling to manage or run**: an agent can fetch and execute any skill with a plain `curl` — no installer, CLI tool, or registry required.

## Structure

```
skills/<name>/
  SKILL.md      # skill — name field must match directory name
  README.md     # human docs: what it does, supported tools, usage prompt
AGENTS.md
README.md       # collection index — one subsection per skill
LICENSE
test.sh         # Docker smoke tests for development
```

## Adding a skill

1. Create `skills/<name>/SKILL.md` — frontmatter requires `name` and `description`
2. Create `skills/<name>/README.md` — usage prompt, supported tools, caveats
3. Add a subsection to the root `README.md` with description and copyable agent prompt

## Testing

```sh
make test
```

Runs Docker smoke tests verifying each config is accepted by its package manager. Run this after changing any skill config values.

## Conventions

- Root `README.md` is collection-level only — one subsection per skill with description and copyable agent prompt, nothing else
- Skill `README.md` is skill-specific only — no collection-level install instructions
- Never push without explicit user confirmation
