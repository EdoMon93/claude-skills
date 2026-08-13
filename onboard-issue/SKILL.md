---
name: onboard-issue
description: Use when starting work on an issue and the user wants you up to speed before any code — "get onboarded", "explore the relevant code and report back", "any questions before we start". The issue can be a link, an ID, or freeform text. Produces understanding and questions, not an implementation.
argument-hint: "[issue url/id, or a freeform description of the work]"
---

# Onboard to an issue

Get up to speed on one piece of work, then report in chat and stop. Don't implement, even if the fix looks like a one-liner.

Read the issue first — plus its comments, parent, siblings, and any prior report of the same thing (old ticket, Sentry issue, stale branch). Its framing is input, not truth; if the code disagrees, that's a finding.

Then explore until you could defend a design choice, not just until you've found the file: the exact code that would change and in which repo, how it behaves today end to end, the precedent already solving this here, what tests and docs would move. Check prod and the third party's own docs where real numbers or real behavior would confirm what the issue asserts or fill in what it omits — that's often where scope changes.

Report freeform, one turn-ending message. What matters is agreeing on the issue itself: what it is, what it actually means, what it implies, who it hits and how hard. Say what you explored and what it changed about that picture — no need to recite the files. Flag anything alarming you tripped over, in scope or not.

Close with numbered questions — real decisions only, each with your lean. Never ask what the code, git history, docs, or prod would have told you, and never ask mid-exploration; what you learn next keeps dissolving the question. Plain text, never `AskUserQuestion` — the user's UI drops text sent alongside a dialog.

When the answers come back, fold them in, say briefly what they settled, and stop again. Answers are not permission to implement, however small the fix now looks; the user says if and how it gets built.
