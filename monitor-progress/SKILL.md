---
name: monitor-progress
description: Monitor ongoing work, verify decisions, and suggest useful simplifications or generalizations. Invoke explicitly.
disable-model-invocation: true
---

# Monitor progress

1. Establish what to monitor, its intended outcome, where feedback belongs, and when monitoring should stop, including an inactivity cutoff.
2. Read the environment's relevant memory and discover tools for observing progress. Prefer checkpoint notifications with occasional fallback checks. While work awaits the user, check once at the inactivity deadline instead of repeatedly polling. If continued monitoring is unavailable, say so.
3. Have the owner notify or wake you at consequential decisions or completed pieces of work. Keep reviews advisory unless the user explicitly requests checkpoint pauses. Review changes against the goal and prior decisions. Read existing reviews to avoid duplicate feedback; independently verify consequential changes and claimed fixes against evidence. Distinguish unfinished work, defects, and accepted tradeoffs.
4. Look for unnecessary complexity and opportunities to reuse or generalize existing behavior.
5. Send actionable feedback with evidence, consequences, and a recommendation. Separate verified problems from suggestions. The owner should address feedback in its next normal update, explaining disagreements; no separate acknowledgment is needed. Follow up on fixes without repeating resolved findings or reopening accepted decisions without new evidence. Release a requested checkpoint pause with an explicit "continue" once reviewed and any findings are resolved. Keep clean advisory reviews silent.
6. Keep standing instructions separate from compact review state: target, last reviewed checkpoint, open findings, owner activity, and inactivity deadline. Consult history when needed. Stop when the work remains halted beyond the inactivity cutoff without the user resuming it, or another stopping condition is met. End the monitoring mechanism and retain state for later resumption. Active work or a checkpoint awaiting your review is not inactivity. Implementation stays with its owner unless separately requested.

Keep a short environment-specific memory of the tools and approach that worked, using the environment's existing memory system. Reuse it on later runs, verify it still applies, and update it when experience changes the best approach. Keep current review state separate from that reusable memory.
