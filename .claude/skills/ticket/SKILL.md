---
name: ticket
description: "Work one Jira ticket from restatement to PR: /ticket <KEY> [bug|feature]."
disable-model-invocation: true
---

# Ticket

You take one KAN ticket to a verified PR through one playbook: Bug fix or Feature. Work happens in the repos listed in command-center's `repos.yaml`. Ticket documents live in `work/<KEY>-<slug>/`, which is gitignored. `GLOSSARY.md` defines Router, Playbook, Checkpoint, Diagnosis, Refine pass and Run brief.

## Non-negotiables

- **Checkpoints.** A step marked ✋ ends your turn and waits for the user's answer. Between checkpoints, proceed (the **principle-never-block-on-the-human** skill).
- **Principles.** Each `principle-*` skill's description is its trigger. When a trigger hits, load that skill with the Skill tool and apply it. Every reply that ends a step finishes with one line per principle that changed a decision: `Principles: <Name> → <decision it changed>`. Cite only principles loaded this session, and leave the line out when none changed anything.
- **Subagents.** The first line of every subagent brief is `Read <root>/.claude/skills/ticket/worker.md before anything else.` Then give the goal and the task.
- **Context.** Jira and Confluence come from `twg`. Code comes from the repos in `repos.yaml`, read through `how`, `why` or an Explore subagent.
- **Prose.** Every reply and document goes through **unslop**. Specs, ADRs, PR bodies and commit messages also follow **technical-writing**.
- **Irreversible actions** (force-push, deleting data, any message to a person) wait for the user. Plan and Diagnosis approval authorize the commits, pushes and PRs they list, and nothing outside them.

## Steps

1. **Read the ticket.** `twg jira workitem get <KEY>`, with comments and links. An Epic stops here: say so and ask for a child ticket.
2. **Create or resume `work/<KEY>-<slug>/ticket.md`.**
   - New: the body is a snapshot of the ticket, and the front matter holds `playbook`, `step` and the Jira `updated` time. Pick `<slug>` from the summary, three to five words.
   - Resume: say where things stand in one line ("ABC-54 · Feature, step 3 refine, pass 2") and continue at `step` without restating. If the ticket's `updated` time moved, show what changed and wait. ✋
   - Template versions: for each document that isn't `done`, compare its `template:` with the latest row in `templates/CHANGELOG.md`. If a newer version exists, offer the migration that row describes. ✋ A migration keeps every ID, updates `template:` and adds a Change log row. A new document always uses the latest template.
3. **Pick the playbook.** An argument (`bug` or `feature`) decides it. Otherwise:
   - **Bug fix** when current behavior differs from behavior that worked before or was specified.
   - **Feature** for anything else, including behavior that was never specified.
4. **Restate** with **in-your-own-words**: the goal, the smallest change that meets it, and the playbook with a one-line reason. ✋ The user can override the playbook here.
5. **Run the playbook** from `playbooks/bug-fix.md` or `playbooks/feature.md`. Update `step` in `ticket.md` as each step completes.

A Bug fix whose diagnosis finds the expected behavior was never specified proposes Feature at its checkpoint. On the user's OK, set `playbook: feature` and enter Feature at its step 2, keeping what exists. A Feature never re-routes.

## Shared steps

- Publishing to Confluence: `playbooks/publish.md`.
- Building a task: `playbooks/build.md`.
- Opening the PR: `playbooks/open-pr.md`.

<!-- Adapted from pstack's poteto-mode (`cursor/plugins@792440e`), MIT License, Copyright (c) 2026 Lauren Tan. Design: maps/ticket-playbooks/tickets/06-router-and-playbook-steps.md. -->
