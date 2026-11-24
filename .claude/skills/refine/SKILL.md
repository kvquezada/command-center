---
name: refine
description: "Refine one vague Jira ticket to Ready: /refine <KEY>."
disable-model-invocation: true
---

# Refine

You take one Jira ticket to Ready: Gherkin acceptance criteria a tester can run, a known technical approach, and an estimate the team voted on. The PM owns the what and the why. You and the user own the how and whether the ticket is buildable. The run ends at Ready, and someone else builds the ticket.

This skill follows the team's Backlog Refinement Playbook. These files are the agent's copy of it, and when the two differ, these files win and the playbook gets updated.

## Non-negotiables

- **Checkpoints.** A step marked ✋ ends your turn and waits for the user's answer. Between checkpoints, proceed (the **principle-never-block-on-the-human** skill).
- **Two Jira comments.** You write to Jira twice per ticket, both as comments: the refinement note at step 3 and the Ready story at step 7, each only after the user's word at that checkpoint. You never edit a comment once it is posted. The description, labels, assignee, status, fields, links and other tickets stay as you found them, and replies to the PM come from the user.
- **Not Ready.** A ticket with an open question or an open spike is Not Ready, and it gets no estimate.
- **Principles.** Each `principle-*` skill's description is its trigger. When a trigger hits, load that skill with the Skill tool and apply it. Each step below names the principles most likely to fire. Every reply that ends a step finishes with one line per principle that changed a decision: `Principles: <Name> → <decision it changed>`. Cite only principles loaded this session, and leave the line out when none changed anything.
- **Subagents.** The first line of every subagent brief is: `When a principle-* skill's trigger hits, load it with the Skill tool, and end your report with "Principles: <Name> → <decision it changed>" for each one that changed a decision.` Then give the goal and the task.
- **Context.** Jira and Confluence come from `twg`. Code comes from the repos in command-center's `REPOS.md`, read through Explore subagents, **how** or **why**. If `REPOS.md` is missing, stop and ask the user to run `bin/hq setup`.
- **Prose.** Every reply, note and Ready story goes through **unslop**.

## Files

Each ticket has one folder: `work/<sprint>/<KEY>-<slug>/` when the ticket has a sprint, and `work/<KEY>-<slug>/` when it has none. `work/` is gitignored.

- `<sprint>` is the sprint's name in uppercase with spaces as hyphens (`ABC Sprint 4` becomes `ABC-SPRINT-4`). With several sprints, use the open one, or the latest if none is open.
- `<slug>` is three to five words from the summary.
- `ticket.md` holds a snapshot of the ticket. Its front matter holds `key`, `type`, `sprint`, `step`, `jira_updated` (the ticket's `updated` time at the last run), `note_comment_id`, `ready_comment_id` and `points`.
- `note.md` is the refinement note, from `templates/refinement-note.md`.
- `ready.md` is the Ready story, the result of the run. A Story, Task or Feature uses `templates/ready-story.md`. A Bug uses `templates/bug.md`, followed by `templates/ready-story.md` from `## Acceptance criteria` on.

`step` is one of `triage`, `investigate`, `draft`, `clarify`, `resolve`, `split`, `estimate`, `ready`. Set it as each step starts. After each of your own Jira writes, and at the end of every run, set `jira_updated` to the ticket's current `updated` time, so a resume flags only other people's changes.

`config.yaml` is optional. Its `estimation.reference` replaces the generic reference scale.

## Start or resume

1. Read the ticket with `twg jira workitem get <KEY> --full`, which includes comments and links. An Epic stops here. List its children and ask for one.
2. Look for `work/**/<KEY>-*/ticket.md`.
   - **None:** create the folder and `ticket.md`, set `step: triage`, and start at step 1.
   - **Found:** say where things stand in one line ("ABC-123 · step 4 clarify · 2 of 3 questions answered").
     - If the ticket's sprint changed, move the folder to match and say so.
     - If Jira's `updated` time moved past `jira_updated`, show what changed (description edits and comments since the last run) and ask whether to fold it in. ✋
     - Continue at `step`.
3. **Redo.** When the user asks in plain words to redo a step ("redo the estimate", "investigate again"), set `step` back to it and run it. A posted note stays as posted, and a changed understanding goes into `ready.md`. A redo after Ready posts the new Ready story as a new comment.

## Steps

### 1. Triage

Check the ticket against `references/definition-of-ready.md`. Print each item as pass or gap, with one line of evidence from the ticket.

If every item passes except the estimate, start `ready.md` from its template with the ticket's content and go to step 7. Otherwise go to step 2.

### 2. Investigate

Send Explore subagents into each repo the ticket touches. Give each one the absolute path of `references/questions.md` as its checklist. Each subagent reads:

- the repo's "Read first" files from `REPOS.md`
- the repo's `docs/adr` when it has one. When it has none, the report says so in one line.
- a tech spec, when the ticket or its Epic links one
- the code: files, modules, endpoints, tables and integrations the change touches

**Source systems.** A ticket depends on a source system when the change reads from or writes to a system whose code isn't in `REPOS.md`: an upstream API, a webhook, a feed or a vendor. For each one, search Confluence for its API contract with `twg confluence search query --cql 'type=page AND text ~ "<system>"' --limit 25 --excerpt`, and read each likely hit with `twg confluence content get <id> --detail full --format md`. Cite the page and the endpoints the change relies on. When nothing turns up, the missing contract becomes a question for the PM.

**Unknowns.** Sort each unknown into one of three kinds:

- **What or why:** a question for the PM.
- **Code can answer it:** run a spike in the session. Use the **prototype** skill in a throwaway worktree or scratch copy, keep it to the one question, and delete it after. Nothing is committed or pushed. Record what you ran and what you saw.
- **A person or another team must answer it:** a proposed spike in the note's Risks / dependencies, in the shape of `templates/spike.md`. The user creates the ticket if they want one.

**Decisions.** Write each technical decision as `Decision: <X>, because <Y>`. A decision that is hard to reverse, surprising without context, and the result of a real trade-off meets the ADR bar. Write it as `Decision (ADR needed): <X>, because <Y>`, and draft the full ADR from `templates/adr.md` with `Status: proposed`.

Done when every question in `references/questions.md` has an answer, an assumption, a PM question or a spike, and every touched file, module, endpoint, table and integration is listed.

Principles: Guard the Context Window, Foundational Thinking, Model the Domain, Boundary Discipline for source-system contracts. For spikes: Exhaust the Design Space, Prove It Works, Attack the Premise.

### 3. Draft the note

Write `note.md` from `templates/refinement-note.md`. For a Bug, the Technical approach lists the probable causes ranked, each with file:line evidence and what the spike showed. Start `ready.md` from its template with what the note proposes, and put each drafted ADR in its `## ADRs` section.

Show the note. ✋ On "post", run `twg jira workitem comment create --issue-id <KEY> --body-format markdown --body "$(cat note.md)"`. Store the comment id as `note_comment_id`, set `step: clarify`, and end the run. The user reruns `/refine <KEY>` once the PM has answered.

Principles: Laziness Protocol and Subtract Before You Add for the approach, Experience First for scope trade-offs, Redesign from First Principles when a requirement fights the existing design.

### 4. Clarify

Read the comments posted since the note with `twg jira workitem comment query --issue-id <KEY> --first 50 --order-by=-created -o json`, and stop at `note_comment_id`. Skip the comment at `ready_comment_id`, which is your own. Resolve account ids to names with `twg user get`. For each question, record the answer and who gave it, fold it into `ready.md`, and close it. Notes the user gives from a call count as answers, attributed as "(you, <where>)".

List what is still open. ✋ While any question is open. Done when every question is closed.

### 5. Resolve unknowns

Every decision is in Technical notes, and every ADR-bar decision has its ADR in `## ADRs`. Done when every spike is closed. While a spike that needs a person is open, the ticket stays Not Ready. Say what is open and end the run.

### 6. Split if too big

Split when the ticket fails the Definition of Ready's "fits in one sprint" item, runs past about 3 days, or the estimate would be 13. Propose vertical slices, each one UI → API → DB, using SPIDR (Spike, Path, Interface, Data, Rules), happy against error paths, or one story per acceptance criterion. Give each slice a title and its acceptance criteria. The original ticket keeps slice 1. A ticket that needs no split goes to step 7.

✋ The user creates the tickets for the other slices and gives you their keys. Narrow `ready.md` to slice 1 and name the new keys under Out of scope. Each new ticket gets its own `/refine`.

Principles: Sequence Verifiable Units, Separate Before Serializing Shared State.

### 7. Estimate and mark Ready

Check `ready.md` against `references/definition-of-ready.md`. Every item but the estimate must pass.

Follow `references/estimation.md` and show the proposal in its output block. ✋ The user gives the team's vote. The team's number wins. When it is two or more steps from yours, say so, and offer to add the ticket to `estimation.reference` in `config.yaml` at the voted value. Write the voted number on the Estimate line and into `points`.

Show `ready.md`. ✋ The user confirms the PM approved it, which also approves posting it. Post it with `twg jira workitem comment create --issue-id <KEY> --body-format markdown --body "$(cat ready.md)"`, store the comment id as `ready_comment_id`, set `step: ready`, and end with "<KEY> is Ready, <points> pts. The Ready story is posted as a comment. Next: build it." When `## ADRs` holds an ADR, add that whoever builds the ticket copies it into the code repo's `docs/adr`, and creates that folder if the repo has none.

<!-- Source: the team's Backlog Refinement Playbook. -->
