# Claude Skills

Personal collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills.

## Skills

| Skill | Description |
|-------|-------------|
| [address-pr-comments](address-pr-comments/SKILL.md) | Interactive workflow for addressing GitHub PR review comments one by one |
| [address-issues](address-issues/SKILL.md) | Process multiple items that need individual decisions sequentially |

## Setup

This repo lives directly in `~/.claude/skills/`. To sync after creating or updating skills:

```bash
cd ~/.claude/skills && git add -A && git commit -m "Update skills" && git push
```

## Installation on a new machine

```bash
git clone git@github.com:EdoMon93/claude-skills.git ~/.claude/skills
```
