---
name: slack-assistant
description: Use whenever a task touches Slack on the user's behalf. That covers finding a thread or message someone means, reading a channel/DM/thread, summarizing what was said, and drafting, replying, posting, scheduling or correcting a message.
---

# Slack assistant

Rules for reading and writing Slack for the user. Most of them come from mistakes, so follow them even when a shortcut looks safe.

## 1. Read the conversation, not the message

A link points at one message. The meaning lives in the conversation around it.

- **Read back** until the topic is clear. In a DM or channel, page back with `slack_read_channel` (newest first, so use `latest`/`oldest` to move through it). In a thread, read the whole thread with `slack_read_thread`.
- **Read forward to the newest message.** Replies after the linked message often answer or reframe it. A link to a thread reply has `thread_ts` in its query string, so read the parent thread too.
- **Open what the conversation references.** Forwarded messages, linked threads, and files show up as bare IDs (`F0...`). Read them with `slack_read_file` / `slack_read_thread`. A file name like `Plantillas_corregidas` often names the topic outright.
- **Find out what the people involved already know.** If they're discussing it between themselves ("el que hablamos el otro día?"), their words are the best clue to what they mean.

When asked for "the thread where X reported Y", match it to the topic of the conversation that asked, not to the most recent thread mentioning X. If more than one thread fits, show the user the candidates with a line each instead of picking one.

## 2. Check Slack yourself

Don't ask the user whether a message went out, what someone replied, or who reacted. Read it. Ask only if the Slack MCP is down (see section 6).

## 3. Posting needs the user's check

- Send or schedule only when the user explicitly authorizes that action. Showing a draft does not authorize sending it.
- "Respond to X" authorizes one reply in that conversation. "Draft a response to X" authorizes drafting only. A follow-up, a correction, or a second message is a new message.
- If the user approves exact wording, send that wording. If the final read makes a substantive change necessary, show the revised draft and get approval before sending.
- If the user authorizes composing and sending a reply, adjust it to the latest conversation within the scope of that request.
- Otherwise draft it in your reply, and also with `slack_send_message_draft` if that helps, after the final reread in section 4.
- Unattended and scheduled runs follow the same rule. Approving a template or wording doesn't approve a later message filled in with fresh numbers.
- Don't reach for any other outward channel (email, PR comments, Linear) to get around this.

## 4. Re-read right before creating a Slack draft or posting

People keep talking while you search and prepare a response. Finish the investigation and prepare the wording before creating a Slack draft, sending, or scheduling. The last call before any of those actions is a read of the conversation with `oldest` = the last ts you saw.

- If they've already settled what you were going to say, don't create the draft or post. Tell the user what happened instead.
- Otherwise, write for the conversation as it is now, not as it was when you were asked. Follow section 3 if that requires changing wording the user approved.
- A draft created with `slack_send_message_draft` cannot be edited or deleted through the integration. Create it only after the final reread and after the wording is ready. Use your reply to the user for drafts still being discussed.
- If more investigation, tool calls, or user discussion happens before the action, repeat the final reread.

Re-read the same way before you tell the user what happened in a conversation, especially after a mistake. Explaining a slip from memory tends to get it wrong again.

## 5. Writing the message

- **Build on what the user already said in the thread.** Credit or extend their points ("Como dice Edo, …"), keep their order and framing, and never present their suggestion as yours. If your view differs from theirs, raise it with the user first instead of posting it.
- **Match the conversation.** Same language and register as the people in it (casual Spanish with the team is normal). A one-liner gets a one-liner.
- **Put the ask last**, on its own line or as a short list, so a skimmer sees it. Skip this for messages with no real ask.
- **No hypothetical precautions.** Report the bug and the fix. Warn "don't do X" only with evidence that X happened or is about to.
- **Ask the right person.** Prod data, console calls, or third-party API reads go to the user as a ready-to-paste snippet. Ask ops/CS or merchants only for things that live solely on their side (settings only the account owner can see), and say why you need it.
- **Diagrams.** Slack doesn't render Mermaid. Send a PNG rendered from the source.
- The Slack integration appends its own "Enviado usando Claude" footer. Don't add a signature.

## 6. When the Slack MCP fails

If Slack (or any MCP the task depends on) errors, disconnects, or needs re-auth, stop. Tell the user which server failed, what failed, and what you couldn't do. Wait for them to acknowledge before going on. Don't quietly switch to another source or skip the evidence.

## 7. Reporting back

- After posting, give the user the link to the message you sent.
- When you found a thread, give its permalink, the date and channel, a short line on what it is, and where it stands now (the last message, anything unanswered).
- **Flag tool changes.** This skill was written against the Slack MCP tools available in October 2026. Add one line per finding with the edit to make to this skill when:
  - a tool named here is missing or renamed, takes different parameters, or behaves differently from what's described here (pagination, ordering, fields in the response);
  - you notice a Slack tool that would do one of these steps better (for example reading unreads or mentions, or fetching a single message by permalink).

  Finish the task first. Don't work around a change silently, and don't edit the skill yourself; the user maintains it.

## Tool notes

- Permalinks: `archives/<channel>/p1793217976835779` → `message_ts` `1793217976.835779` (a dot before the last six digits). `D...` channels are DMs.
- `slack_search_public_and_private`: exact phrases in quotes, people and channels as filters (`from:<@U...>`, `in:<#C...>`, `after:YYYY-MM-DD`). Use `response_format: detailed` when you need permalinks and `thread_ts`.
- Search matches words, not meaning. Search the words the author would have written, in their language (`plantilla`, `formato`, `negritas`), and try a few in parallel.
