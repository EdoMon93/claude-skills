---
name: triage-sentry-issue
description: Use when given a Sentry issue (URL, short ID like ENG-1A2, or "this error") and the user wants to understand or assess it rather than fix it — triage, analyze, diagnose, assess severity, find the root cause, judge whether it's real or noise, or decide whether it's worth fixing. Trigger on "triage this sentry issue", "what's going on with this sentry error", "analyze/diagnose this sentry issue", "is this sentry error real or noise", "should we fix this", "how bad is this sentry issue". Do NOT use when the user wants the error fixed end-to-end with a branch and PR — use sentry-to-fix for that.
argument-hint: "[sentry-url-or-issue-id]"
---

# Triage Sentry Issue

Deeply analyze one Sentry issue and report back in chat. Read-only — the deliverable is understanding, not a fix.

**Announce:** "Using triage-sentry-issue — read-only, I'll report back in chat."

Need a Sentry issue reference to start. If it's missing, ask before doing anything.

## Gather the signal

The objective is the evidence below, not any particular tool — use whatever Sentry / log / Linear / git tooling is available, and if a source isn't reachable, note it and move on. These are independent, so gather in parallel:

- **Full Sentry picture** — go past the title: error type and message, level, total events and recent trend (spiking / steady / trailing off), users/stores affected, environments, first/last seen, the release it started on, and the latest stack trace + breadcrumbs.
- **The code** — read the stack-traced frames that point at our own code, then check git history/blame on those lines. If a recent change lines up with the first-seen date or release, you've likely found the regression — name the commit.
- **Production logs** — if the project ships logs anywhere (e.g. BetterStack — easy to overlook when scanning for "logging" tools), correlate around the error's timeframe, keyed by any IDs in the Sentry tags/breadcrumbs (store, integration, request, order). The logs tell the story the exception alone can't.
- **Existing work** — search Linear, open PRs/branches, and sibling Sentry issues so you don't re-triage something already known or in flight.
- **Prod data (ask the user)** — if a record's actual state would confirm or kill a hypothesis (e.g. is this order really missing a phone? was the integration disabled?), don't query prod yourself — hand the user a specific read-only SQL query and ask them to run it and paste the result.

## Report (in chat)

```markdown
## Triage: <error type> — <one-line what's breaking>
<Sentry issue URL>

**Severity:** <P1 Urgent / P2 High / P3 Normal / P4 Low> — <one-line justification>
**Recommendation:** <Fix now / Monitor / Won't-fix / Not our bug / Needs more data> — <why>

### Impact
- Events: <total>, <N in 24h / 7d>, trend: <spiking / steady / trailing off>
- Affected: <N users/stores>, environments: <...>, since <first seen>, on release <...>

### Root-cause hypothesis  (confidence: <high / medium / low>)
<The actual cause, not the symptom — the precondition that triggers it.>
- Evidence: <stack frame, blamed commit, log line, tag distribution>
- Would confirm/refute: <the one check that would settle it>

### Dup & noise check
- Duplicate of: <existing Sentry issue / Linear ticket / open PR, or "none found">
- Noise?: <transient/flaky? external-service failure? expected under some condition? — or "looks like a real bug">
```

Set `confidence: low` honestly when the data is thin, and make "would confirm/refute" a concrete next check rather than false certainty.

## Guardrails

- Strictly read-only: never edit code, write files, touch Linear or Sentry state, or create branches/PRs. If the user wants it fixed, point them to sentry-to-fix.
- No proposed fix or code — deciding *how* to fix is out of scope here.
- Don't invent numbers; if a query returns nothing, say the data's unavailable.
- Severity weights blast radius and critical paths (payments, orders, auth, message delivery) over raw event count: a 10k-event log-spam warning can be P4; a 3-event fatal in checkout is P1.
