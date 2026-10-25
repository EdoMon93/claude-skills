---
name: coordinate-workstreams
description: Coordinate authorized work across user-selected workstreams, assigning bounded tasks, managing handoffs and maintaining requested activity.
---

# Coordinate workstreams

Take scope, concurrency, eligible queue, completion authority and stopping conditions from the user. Carry forward existing authorization; clarify gaps. Impose no repo or thread counts. Installation, invocation or backlog discussion alone grants no implementation authority.

Use the issue tracker as the source of truth and follow repo delivery guidance. Deployment, live providers and external messages require their own authorization.

## Assign work

Refresh tracker and thread state before assignments to identify owners, PRs and dependencies and avoid duplicate workers. Deferred work qualifies when behavior is decided and its queue is authorized.

Assign bounded issues or related issues with agreed outcomes and completion requirements. Coordinate dependencies, shared files and heavy jobs within requested concurrency and available resources. Keep implementation with its owner through required checks, fresh review, fixes and authorized merge.

Workers own blockers within their scope. When user input is needed, they ask directly in their own thread and send the coordinator only a brief blocked status and thread link. Include this routing in assignments. The coordinator manages dependencies and resources and continues other authorized work; it does not relay worker questions.

On completion, refresh state and assign the next eligible work to maintain requested activity. Report specific blockers or an exhausted queue; do not invent work.

## Renew implementation threads

Renew long implementation threads at safe boundaries. Transfer remaining scope, decisions, dependencies, issue/PR links, check/review state, questions and next actions to a new thread and workspace. Preserve uncommitted changes; new workspaces may copy only committed state. Verify the successor has the required state and accepts ownership before settling the old thread. Keep review and merge ownership explicit.

## State and reporting

Keep compact durable state covering authorization, queue, activity targets, owners/thread IDs, dependencies, issue/PR status, progress, pending decisions and notification/check identifiers and cursors. Update it after material changes.

Give every worker and successor the reporting destination and wakeup rules. Notifications normally take 1–2 sentences: outcome, actionable blocker/decision or resource request/acquire/release, with issue/PR links for delivery. Keep test counts, SHAs, logs, implementation details and review history in source threads/tracker; read on demand. Successor handoffs still carry complete continuation state.

Suppress routine progress and acknowledgments in both directions. Notify only the coordinator or active consumer needing action; leave completed threads settled. Keep coordinator output brief, answering normally when asked.

## Use available orchestration

Discover and prefer native thread tools. Distinguish ordinary threads from delegated subagents. In T3, launch app-bound threads/worktrees through native orchestration, not shell-only worktrees. Retain launch IDs and inspect uncertain outcomes before retrying. State missing capabilities and limitations honestly.

Default to worker wakeups on actionable events; otherwise stay idle. Use waits, timeouts or recurring checks only for specific needs notifications cannot cover. Bind checks to the coordinator, deduplicate them, define stopping conditions and end them when resolved. Keep reminders short and read durable state on demand.
