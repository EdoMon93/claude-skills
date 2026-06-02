# Claude Skills

Personal collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills.

## Skills

| Skill | Description |
|-------|-------------|
| [address-pr-comments](address-pr-comments/SKILL.md) | Interactive workflow for addressing GitHub PR review comments one by one |
| [address-issues](address-issues/SKILL.md) | Process multiple items that need individual decisions sequentially |
| [triage-sentry-issue](triage-sentry-issue/SKILL.md) | Read-only deep analysis of a Sentry issue — severity, root-cause hypothesis, dup/noise check; reports in chat, no code changes |

## Setup

This repo lives directly in `~/.claude/skills/`. To sync after creating or updating skills:

```bash
cd ~/.claude/skills && git add -A && git commit -m "Update skills" && git push
```

## Installation on a new machine

```bash
git clone git@github.com:EdoMon93/claude-skills.git ~/.claude/skills
```
