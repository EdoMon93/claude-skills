---
name: implement-by-gated-commits
description: Use when you are implementing in tight collaboration with the user.
---

# Implement by gated commits

If the current branch and workspace are where you'd expect to be doing this work, proceed. If not, ask before continuing.

If brainstorming or grilling already happened in this session, don't re-do it. If you're unsure whether the user has decided, ask. Use TDD inside each unit: failing test first, then implementation.

Let commit boundaries emerge from the work rather than partitioning upfront. When you reach a self-contained unit:

- Run the tests covering what you changed.
- Tell the user in one or two sentences what this commit does. They'll review the diff in their IDE; don't paste it in chat.
- Propose a commit message in plain prose and wait for approval.

Take free-text feedback. Adjust code, message, or scope as instructed. Don't amend earlier commits unless explicitly told to.

When you've finished the requested work, offer to push the branch and/or open a PR.
