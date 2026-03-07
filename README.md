# Claude Skills

Personal collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills.

## Skills

| Skill | Description |
|-------|-------------|
| [address-pr-comments](address-pr-comments/SKILL.md) | Interactive workflow for addressing GitHub PR review comments one by one |
| [address-issues](address-issues/SKILL.md) | Process multiple items that need individual decisions sequentially |

## Syncing

After creating or updating skills in `~/.claude/skills/`, sync them to this repo:

```bash
bash /tmp/claude-skills/sync.sh
```

The script copies all `SKILL.md` files (skipping workspace directories), commits, and pushes.

## Installation

Copy a skill directory into `~/.claude/skills/`:

```bash
cp -r address-pr-comments ~/.claude/skills/
```
