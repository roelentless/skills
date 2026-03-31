# Public Skills

Public agent skills for Claude Code, Cursor, OpenCode, OpenClaw and any agent or claw supporting the [Agent Skills](https://agentskills.io) open standard. Also compatible with [skills.sh](https://skills.sh).

These skills require **no tooling to manage or run**: an agent can fetch and execute any skill with a plain `curl` — no installer, CLI tool, or registry required.

No installation required. Ask your agent to execute any skill by pasting the prompt below.

## Skills

### configure-dependency-age

Adds a 7-day minimum release age to all supported package managers.

```
Execute this skill: https://raw.githubusercontent.com/roelentless/skills/main/skills/configure-dependency-age/SKILL.md
```

## Optional install

Clone to make skills permanently available as slash commands:

```sh
# Claude Code
git clone https://github.com/roelentless/skills ~/.claude/skills/roelentless

# Cursor, Copilot, Cline, and most others
git clone https://github.com/roelentless/skills ~/.agents/skills/roelentless

# Windsurf
git clone https://github.com/roelentless/skills ~/.codeium/windsurf/skills/roelentless
```

## License

MIT
