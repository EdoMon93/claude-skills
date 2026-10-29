# Claude Skills

Personal collection of skills shared by Claude Code and Codex.

## Skills

| Skill | Description |
|-------|-------------|
| [address-pr-comments](address-pr-comments/SKILL.md) | Interactive workflow for addressing GitHub PR review comments one by one |
| [address-issues](address-issues/SKILL.md) | Process multiple items that need individual decisions sequentially |
| [triage-sentry-issue](triage-sentry-issue/SKILL.md) | Read-only deep analysis of a Sentry issue — severity, root-cause hypothesis, dup/noise check; reports in chat, no code changes |
| [create-linear-issue](create-linear-issue/SKILL.md) | Create a Linear issue capturing the problem and impact, leaving the solution direction as a placeholder for the implementer |
| [assisted-code-review](assisted-code-review/SKILL.md) | Review a GitHub PR's code changes and provide structured feedback before merge |
| [slack-assistant](slack-assistant/SKILL.md) | Read Slack conversations and prepare or send messages with explicit authorization and a final context check |
| [generate-pr-announcement](generate-pr-announcement/SKILL.md) | Draft a short Slack-style message announcing that a PR is ready for review |
| [onboard-issue](onboard-issue/SKILL.md) | Get up to speed on an issue before implementing — explore code, prior reports and prod, then align on the issue and ask what's genuinely undecided |
| [issue-summary](issue-summary/SKILL.md) | Summarize the working repo's open issues and ongoing work using its own tracker and workflow |
| [monitor-progress](monitor-progress/SKILL.md) | Explicitly invoked progress review with decision verification, simplifications, and useful generalizations |
| [grill-me](grill-me/SKILL.md) | Interview you relentlessly about a plan or design, resolving each decision-tree branch until shared understanding |
| [implement-by-gated-commits](implement-by-gated-commits/SKILL.md) | Implement in tight collaboration with the user, gating progress on per-step commits |
| [unslop](unslop/SKILL.md) | Cut AI tells from any writing and add human voice. Vendored verbatim from [cursor/plugins](https://github.com/cursor/plugins/blob/main/pstack/skills/unslop/SKILL.md) |

## Setup on this box

The authoring clone is `/home/t3/claude-skills`. T3 worktrees under
`/home/t3/.t3/worktrees/claude-skills/` share its Git history. Make and review changes
there, then commit, merge into `main`, and push.

The installed clone is `/home/t3/.agents/skills`. Codex discovers skills there;
Claude Code uses the same files through the `/home/t3/.claude/skills` symlink.
Skills are available across projects without copying them into project repositories.

Pushing from the authoring clone does not refresh the installed clone. After merging
and pushing, update the installed copy:

```bash
git -C /home/t3/.agents/skills pull --ff-only
```

Preserve untracked local skills and synced content in the installed clone.

## Installation on a new machine

Run these commands as the user who runs the coding agents. They assume
`~/.agents/skills` and `~/.claude/skills` do not already exist. If either exists,
inspect it before changing the setup.

```bash
mkdir -p ~/.agents ~/.claude
git clone git@github.com:EdoMon93/claude-skills.git ~/.agents/skills
ln -s ../.agents/skills ~/.claude/skills
```

For authoring, create a separate clone and use it or its worktrees:

```bash
git clone git@github.com:EdoMon93/claude-skills.git ~/claude-skills
```
