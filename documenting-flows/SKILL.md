---
name: documenting-flows
description: >-
  Use when asked to diagram or document how something flows ("make a diagram of how X works", "draw
  the flow", "document this flow"), and when writing a PR description or a new docs/ guide for a
  change that crosses several files, jobs, models or external services.
---

# Documenting flows

A diagram answers one question for one reader. Decide the question before drawing.

## Where

- **PR description**, when the change alters a flow.
- **New `docs/` guide**: consider a diagram for every multi-step flow it explains.
- **Existing `docs/` guide**: only when the user asks.

Diagrams are Mermaid blocks, which GitHub renders. No exported images in the repo.

## What to show

- **A fix:** the scenario that triggers the bug, drawn twice, before and after, with the same parties
  in the same order. The difference between the two pictures is the fix.
- **A change to an existing flow:** before and after, the same way.
- **A new feature or guide:** how it works now. No history.

Cover every path the change touches, from what starts it to the outcome someone cares about
("auto-charge is off though the wallet was topped up"), not an internal state. Leave out paths the
change doesn't touch. If the reader needs the surrounding system to follow the change, explain it in
a separate diagram first.

Done when someone who hasn't read the code can tell what used to happen, what happens now, and why
the change makes the difference.

## Which type

Pick the type per diagram. When you split a flow by stage, each stage gets the type that fits it,
such as a sequence diagram for an OAuth handshake and a flowchart for what happens after.

- [`flowchart LR`](https://mermaid.js.org/syntax/flowchart.html) when the point is branching: who
  starts it, what runs, what each outcome does.
- [`sequenceDiagram`](https://mermaid.js.org/syntax/sequenceDiagram.html) when timing or the order
  of a back-and-forth is the point, such as a race between two jobs.
- [`stateDiagram-v2`](https://mermaid.js.org/syntax/stateDiagram.html) when a model moves through
  named states.

## Style

- Say what happens, and name the route, class or job that does it where that helps find the code.
  Leave out arguments, keys and method signatures.
- Draw the main paths. Guards, error responses, rollbacks and mechanisms (cookies, expiry,
  idempotency keys) go in the prose under the diagram, unless the change is about one of them.
- Give each outcome its own branch. An arrow looping back reads as the step happening again.
- No size limit. Split by stage when one diagram would tell more than one story, such as a first
  install and a returning shop.
- When you split a flow into several diagrams, end each split path on a connector and start the
  next diagram from a connector with the same name, so the reader can match them up:
  `(["New shop setup →"])` at the end, `(["→ New shop setup"])` at the start. In a sequence
  diagram, use a `Note over …: → New shop setup` instead.
- When a path continues into a flow the change leaves alone, end it on a ghost box named after
  that flow, so the reader knows it goes on rather than stops there. If the flow is drawn
  elsewhere, say where ("Control handover flow (docs/meta-conversation-routing.md)"). Draw it
  dashed and grey, with a dashed arrow (`-.->`) into it:
  `classDef omitted stroke-dasharray: 5 5,stroke:#888,color:#888,fill:none`. No fill, so it works in
  light and dark themes.
  Never ghost a part of the change itself; draw it or cover it in the prose.

## Before sharing

Trace every box and arrow to the code that does it, including the policy that allows it.

Render it and look at the PNG before sharing. Mermaid fails quietly, such as a `#` cutting a label
short, and raw Mermaid reads as code anyway:

```bash
curl -so diagram.png "https://mermaid.ink/img/$(base64 -w0 diagram.mmd | tr '+/' '-_' | tr -d '=')?type=png&bgColor=white"
```

Use the same PNG for messaging providers, which may not support Mermaid.
