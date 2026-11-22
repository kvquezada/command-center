---
template: spec@1
ticket: <KEY>
topic: <topic>
status: draft            # draft | in-review | approved
confluence_id:           # filled on first publish
prd: <YYYY-MM-DD>-<topic>-prd.md
journeys: <YYYY-MM-DD>-<topic>-journeys.md
adrs: []                 # NNNN-short-topic.md files this spec depends on
---

# 🧩 <What is being built, as a statement>

> **Building:** <one sentence> · **Why:** <one sentence, citing <KEY>/R<n>>
> **Approach:** <one sentence>
> **Ticket:** <KEY link> · **PRD:** <link> · **Journeys:** <link>
> **Author:** <name>, <YYYY-MM-DD> · **Reviewers:** <name>, <name> · **Approved by:** <blank until sign-off>

## Problem statement

<One paragraph: who is affected, what is broken or missing, how we know. No solution yet.>

## Scope and non-goals

| In scope | Non-goals |
| --- | --- |
| <item, citing <KEY>/R<n>> | <item> |

## Current state

<About three sentences on how it works today, with file paths. One diagram only if the system is not obvious. Link existing docs.>

## Proposed design

<Whiteboard order: data flow first, then the hard part, then edge cases. The shape `sketch` picked goes here. One `###` per area (data model, API, UI, jobs). Types and API shapes in fenced code blocks with the language set.>

### Data flow

### <Area>

### Edge cases

## Alternatives considered

<At least two. Each: the shape in a sentence, then a paragraph on why it lost. The shape `sketch` rejected is one of them. A full argument belongs in an ADR.>

### <Alternative A>

### <Alternative B>

## Trade-offs

<The costs of the chosen design: performance, operational complexity, lock-in. Never "none".>

## Rollout plan

1. <Feature flag name, or "no flag: <reason>">
2. <Migration steps; for data changes, the backfill and how a partial failure is detected>
3. <Rollback path>
4. <Observability added>

## Success metrics

| Metric | Baseline | Target at 30 days | Where it's read |
| --- | --- | --- | --- |

## Open questions

1. <Question> · **Owner:** <name> · **Status:** open

<The spec is ready for "Approved by" when every question is closed.>

## Change log

- <YYYY-MM-DD>: <what changed and why>
