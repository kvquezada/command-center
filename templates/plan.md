---
template: plan@3
ticket: <KEY>
topic: <topic>
status: draft            # draft | approved
confluence_id:           # filled on first publish
spec: <YYYY-MM-DD>-<topic>-spec.md
prd: <YYYY-MM-DD>-<topic>-prd.md
journeys: <YYYY-MM-DD>-<topic>-journeys.md
---

# 🗺️ <KEY>: <Topic>, in <n> stacked PRs

> **What:** <the tasks in one sentence, and how they stack>
> **Spec:** <link> · **PRD:** <link> · **Journeys:** <link> · **Ticket:** <KEY link>
> **Status:** DRAFT · **Approved by:**

## Throughput checkpoint

| Check | Answer |
| --- | --- |
| Blocking first steps | <the task everything else waits on, and why> |
| Independent workstreams | <tasks that can run in parallel once their dependencies merge> |
| Shared mutable state | <files, schemas or keys more than one task writes, and which task owns each> |
| Smallest safe decomposition | <why this many tasks, and why not fewer> |

## Tasks

IDs are permanent. Never renumber or reuse one. Cite a task as `<KEY>/T<n>`.

A task gets a brief only when this plan's "Approved by" is filled in and every question in its Questions cell has a PM answer or a working answer. A working answer is one you give at this checkpoint, for a question that is cheap to get wrong. It goes under the task as `- **Q<n>** <question> Working answer: <value>. Rework if wrong: <cost>.`

| ID | Task | Depends on | Shape | Questions | Brief |
| --- | --- | --- | --- | --- | --- |
| T1 | <outcome a user can see> | none | one | none | ready |
| T2 | | T1 | arena | Q1 (working answer) | ready |

## T1: <outcome a user can see>

<One paragraph: what this task delivers end to end, and what it leaves for later tasks.>

**Acceptance criteria**
- `<KEY>/J<n>.<step>`: <the step's Sees, as this task must make it true>
- `<KEY>/R<n>`: <only for a requirement no journey step covers>

**Verification**
- <unit or integration spec that covers it>
- App: <the target's verify skill> drives <the journey steps>.

**Design:** <names of the spec's "Proposed design" H3 subsections, copied whole into the brief>
**ADRs:** <ADR file names, or none>
**Rollout:** <the spec's rollout step numbers>
**Shape:** <one | arena. <the shapes that all meet the criteria, and how to pick between them>>
**Files likely touched:** <paths>
**Size:** <S | M | L>

**Working answers**
- <none, or one line per question as above>

## Checkpoints

- After <T>: <the journeys that pass on the running app>.

## Change log

| Date | Change | Why |
| --- | --- | --- |
| <YYYY-MM-DD> | First draft | |
