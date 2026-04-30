---
name: generate-pr-announcement
description: Use when the user wants to draft an announcement that a PR is ready for review. Trigger on phrases like "announce my PR", "PR ready for review message", "draft a Slack message for this PR", or any time the user asks for a message/post telling reviewers a PR is ready.
---

# Generate PR Announcement

Draft a short Slack-style message announcing that a PR is ready for review.

## Steps

1. **Find the PR.** Run `gh pr view --json url,title,body,headRefName` on the current branch. If there's no PR for this branch, ask the user for a PR URL. Ask the user when in doubt.

2. **Find the Linear issue.** Look in the PR body and branch name for a Linear issue reference (e.g. `ENG-324`, or a `linear.app/...` URL). If none is found, ask the user whether a Linear issue exists; if it does, ask for the URL/ID; if not, skip it. When an issue is found, fetch it via `mcp__claude_ai_Linear__get_issue` so you have its **title** (used as the headline in step 6) and metadata (used in step 4).

3. **Classify the PR.** Pick a single short label that tells a skimmer at a glance what kind of change this is. Infer it from:
   - The conventional-commit prefix in the PR title (`fix:` → Bug fix, `feat:` → Feature, `refactor:` → Refactor, `chore:` → Chore, `docs:` → Docs, `test:` → Tests, `perf:` → Performance).
   - Failing that, the PR labels or the body.
   - If genuinely ambiguous (e.g. mixed change with no convention prefix), ask the user.

   Use this label as the leading tag in the announcement, in the form `[Bug fix]`, `[Feature]`, etc. Keep it to one or two words.

4. **Check for a bigger picture.** Decide whether this PR is one slice of a larger effort, and if so, capture it in one short line. Look in this order:
   - **Linear graph** (if a Linear issue is known): use the Linear MCP (`mcp__claude_ai_Linear__get_issue`) to fetch the issue and check its `parent`, `project`, and any sibling sub-issues. If the issue is one of several children of a parent, or one of several issues in an active project/initiative, that's the bigger picture.
   - **Session context**: if the current conversation has been about a multi-PR effort, an epic, a migration, or a larger refactor, use that — the user has already told you the framing.

   If neither applies, skip this entirely. Don't invent a bigger picture just to fill the slot.

   When it does apply, add one line stating both the umbrella *and* this PR's relevance to it — what role this PR plays, not just that a parent exists. E.g. `Part of the message-templates lifecycle rework (ENG-300) — this is the validation slice; provider-sync changes ship separately.`

5. **Write the summary.** Always state *what problem it solves* — the user-facing or system-level pain that goes away — followed (if needed) by a brief note on the change itself. Lead with the "why", not the "what". Keep it to one sentence when possible, two if the problem and the fix genuinely need to be separated.

6. **Output the message** in this shape, ready to paste into Slack:

   ```
   [<label>] PR ready for review: <headline>
   <PR URL>

   <summary — leads with the problem it solves>

   Part of: <bigger picture + this PR's role>   ← omit if there isn't one
   Linear: <Linear URL>                          ← omit if there's no Linear issue
   ```

   **Headline source:** prefer the Linear issue title when one is available — it's usually phrased in user/product terms and is more readable than a conventional-commit-style PR title. Fall back to the PR title only when there's no Linear issue. (Strip any leading `[ENG-NNN]` prefix from the Linear title to avoid duplicating the ID, since the Linear link already carries it.)

   **Plain text only.** Do not wrap anything in `*`, `**`, or `_` — output plain text. The user pastes this into Slack and inline markdown is not reliably rendered there.

7. **Show the message** to the user in a code block so it's easy to copy. Don't post it anywhere — the user will paste it themselves.

## Tone

Professional but friendly. Concise. No marketing-speak, no "excited to share", no decorative emojis. One sentence of summary is usually enough; two if the change genuinely needs it.

## Example

Input: PR titled "fix(message-templates): validate requested_category presence" on branch `edo/eng-324-message-template-schema`, body mentions ENG-324. Linear issue ENG-324 is titled "Message template schema & model semantics".

Output (uses the Linear title as the headline, not the PR title):

```
[Bug fix] PR ready for review: Message template schema & model semantics
https://github.com/cubbo/engage-backend/pull/1234

Templates could be saved with invalid categories, which then failed silently downstream when sent to Gupshup; this adds presence + inclusion validation for `requested_category` so bad values can't be persisted in the first place.

Linear: https://linear.app/cubbo/issue/ENG-324
```
