---
name: configure-dependency-age
description: Configures a 7-day minimum release age on all supported package managers in the user's home directory. Protects against supply chain attacks by delaying installation of newly published packages until security researchers have had time to vet them.
---

# Configure Dependency Age

Write the following configs to the user's home directory. Merge into existing files — do not overwrite them. Always write npm. Write the others only if the package manager is installed.

## Always

`~/.npmrc`
```ini
min-release-age=7
```

## If installed

`uv --version`  
`~/.config/uv/uv.toml`
```toml
exclude-newer = "7 days"
```

`pnpm --version`  
`~/Library/Preferences/pnpm/rc` (macOS) · `~/.config/pnpm/rc` (Linux)
```ini
minimum-release-age=10080
```

`yarn --version` — skip if below v4  
`~/.yarnrc.yml`
```yaml
npmMinimalAgeGate: "7d"
```

`bun --version`  
`~/.bunfig.toml`
```toml
[install]
minimumReleaseAge = 604800
```

## Per-repository (Renovate, Dependabot, Deno)

1. Check memory and session context for known repositories
2. List discovered repos and suggest any additional folders that look like repos (contain `.git`, `package.json`, `renovate.json`, `deno.json`, or `.github/`)
3. Present the full list — ask the user to confirm, add, or remove entries
4. Inspect each confirmed repo: check for `renovate.json`, `.github/dependabot.yml`, and `deno.json`
5. Show a plan of what will change in each file — ask for confirmation before writing

For each confirmed repo:

If `renovate.json` exists, merge:
```json
{
  "minimumReleaseAge": "7 days",
  "internalChecksFilter": "strict"
}
```

If `.github/dependabot.yml` exists, add `cooldown` to each entry:
```yaml
    cooldown:
      default-days: 7
      semver-major-days: 30
      semver-minor-days: 14
      semver-patch-days: 3
```

If `deno.json` exists, merge:
```json
{
  "minimumDependencyAge": "P7D"
}
```
