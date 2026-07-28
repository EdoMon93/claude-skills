# Claude Skills

Personal collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills.

## Skills

| Skill | Description |
|-------|-------------|
| [address-pr-comments](address-pr-comments/SKILL.md) | Interactive workflow for addressing GitHub PR review comments one by one |
| [address-issues](address-issues/SKILL.md) | Process multiple items that need individual decisions sequentially |
| [triage-sentry-issue](triage-sentry-issue/SKILL.md) | Read-only deep analysis of a Sentry issue — severity, root-cause hypothesis, dup/noise check; reports in chat, no code changes |
| [create-linear-issue](create-linear-issue/SKILL.md) | Create a Linear issue capturing the problem and impact, leaving the solution direction as a placeholder for the implementer |
| [assisted-code-review](assisted-code-review/SKILL.md) | Review a GitHub PR's code changes and provide structured feedback before merge |
| [generate-pr-announcement](generate-pr-announcement/SKILL.md) | Draft a short Slack-style message announcing that a PR is ready for review |
| [onboard-issue](onboard-issue/SKILL.md) | Get up to speed on an issue before implementing — explore code, prior reports and prod, then align on the issue and ask what's genuinely undecided |
| [grill-me](grill-me/SKILL.md) | Interview you relentlessly about a plan or design, resolving each decision-tree branch until shared understanding |
| [implement-by-gated-commits](implement-by-gated-commits/SKILL.md) | Implement in tight collaboration with the user, gating progress on per-step commits |

## Setup

This repo lives directly in `~/.claude/skills/`. To sync after creating or updating skills:

```bash
cd ~/.claude/skills && git add -A && git commit -m "Update skills" && git push
```

## Installation on a new machine

```bash
git clone git@github.com:EdoMon93/claude-skills.git ~/.claude/skills
```
