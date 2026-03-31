# configure-dependency-age

Adds a 7-day minimum release age to all supported package managers, written to your home directory so every project is covered automatically.

**Why 7 days?** Supply chain attacks rely on malicious packages being pulled in before anyone notices. Security firms (Socket, Snyk, OSS-Fuzz) typically flag issues within a week. A 7-day minimum costs almost nothing for stable projects — the vast majority of packages you install were published weeks or months ago.

## Usage

Point your agent at this skill directly — no install needed:

```
Run this skill: https://raw.githubusercontent.com/roelentless/skills/main/skills/configure-dependency-age/SKILL.md
```

Or if you cloned the repo: `/configure-dependency-age`

## Supported

| Manager | Min version | Config file |
|---|---|---|
| npm | v11.10 | `~/.npmrc` |
| pnpm | v10.16 | `~/Library/Preferences/pnpm/rc` (macOS) · `~/.config/pnpm/rc` (Linux) |
| Yarn | v4.10 | `~/.yarnrc.yml` |
| Bun | v1.3 | `~/.bunfig.toml` |
| uv | any | `~/.config/uv/uv.toml` |

npm is always configured. All others are configured only if installed.

Deno, Renovate, and Dependabot are configured per repository — the skill will discover repos and ask for confirmation before writing.

## Not supported natively

pip, Poetry, Cargo, gem, Composer, Go, Maven, Gradle, NuGet, Homebrew, conda, Yarn v1.
