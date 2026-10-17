---
name: monitor-progress
description: Monitor ongoing work, verify decisions, and suggest useful simplifications or generalizations. Invoke explicitly.
disable-model-invocation: true
---

# Monitor progress

1. Establish what to monitor, its intended outcome, where feedback belongs, and when monitoring should stop.
2. Read the environment's relevant memory. Discover and use tools that let you observe progress and return for later updates. If continued monitoring is unavailable, say so.
3. Have the owner notify or wake you at consequential decisions or completed pieces of work, and pause dependent work until reviewed. Review changes against the goal and prior decisions. Verify consequential claims against evidence. Distinguish unfinished work, defects, and accepted tradeoffs.
4. Look for unnecessary complexity and opportunities to reuse or generalize existing behavior.
5. Send actionable feedback with evidence, consequences, and a recommendation. Separate verified problems from suggestions. The owner should address feedback in its next normal update, explaining disagreements; no separate acknowledgment is needed. Follow up on fixes without repeating resolved findings or reopening accepted decisions without new evidence. Release a paused checkpoint with an explicit "continue" when there are no findings; otherwise keep clean reviews silent.
6. Save enough review state to resume without duplication. Continue until the agreed stopping condition, then end the monitoring mechanism. Implementation stays with its owner unless separately requested.

Keep a short environment-specific memory of the tools and approach that worked, using the environment's existing memory system. Reuse it on later runs, verify it still applies, and update it when experience changes the best approach. Keep current review state separate from that reusable memory.
