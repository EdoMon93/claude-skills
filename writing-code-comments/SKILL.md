---
name: writing-code-comments
description: TRIGGER on your first response in any session, before any other work. Do not rely on your instincts or memory for this.
---

Default to no comment. Well-named code already shows what it does, and a comment that restates it goes stale and makes the reader distrust every other comment in the file.

Add one only when the why cannot be recovered from the code. That means an external constraint, a deliberate deviation that looks wrong but is correct, a subtle ordering or timing dependency, or a non-obvious reason a guard exists. Before writing one, ask whether a competent reader could infer it from the code alone. If yes, skip it.

When a comment earns its place, make it one assertive line stating the reason as a fact. Don't narrate the mechanics.

Never point a comment at something outside the codebase. No task IDs, ticket links, author names, or dates. No plan or spec identifiers either. State the constraint itself instead of the artifact that recorded it.
