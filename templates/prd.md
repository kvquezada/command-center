---
template: prd@1
ticket: <KEY>
topic: <topic>
status: draft            # draft | in-review | done
confluence_id:           # filled on first publish
journeys: <YYYY-MM-DD>-<topic>-journeys.md
---

# 🎯 <Outcome as a statement, e.g. "Owners can see which discounts pay off">

> **Problem:** <one sentence: who hurts and how>
> **For:** <roles, using the repo's glossary names>
> **Solution:** <one sentence, what not how>
> **Ticket:** <KEY link> · **Epic:** <parent link> · **Journeys:** <journeys page link>
> **Status:** DRAFT · **Target:** <date or release> · **Owner:** <name> · **PMs:** <names>

## Problem and opportunity

<Who hurts, what it costs them today, and how we know (a number, a quote, a code fact). No solution yet.>

## Goals and non-goals

| Goals | Non-goals |
| --- | --- |
| <outcome> | <tempting thing we won't do, and why> |

## Success metrics

| Metric | Baseline | Target | How measured |
| --- | --- | --- | --- |
| | | | |

## Users and journeys

- **<Role>:** <what they do in this feature, one line>

Journeys are on their own page: <link>. Each requirement below names the journeys that exercise it.

## Assumptions and constraints

**Assumptions**
- <one testable statement> [validated by: <how/when>]
- ⚠️ **Riskiest:** <statement>

**Constraints**
- **Technical:** <limit> → <what it rules out>
- **Business/ops:** <limit> → <what it rules out>

## Requirements

IDs are permanent. Never renumber or reuse one. To drop a requirement, strike it through and set priority to Dropped. Cite one elsewhere as `<KEY>/R<n>`.

| ID | Requirement | Priority | Journeys | Notes |
| --- | --- | --- | --- | --- |
| R1 | As a <role>, I can <action> so that <outcome>. | Must | J1 | |
| R2 | | Should | | |

## Dependencies

| Dependency | Type | Owner | Status | Impact if late |
| --- | --- | --- | --- | --- |
| | Prerequisite | | Not started | |

## Out of scope / later

- <thing> (later: <ticket or "unplanned">)

## Open questions

PMs answer in comments. The answer moves here and the row closes. Cite one as `<KEY>/Q<n>`.

| ID | Question | Owner | Answer | Answered |
| --- | --- | --- | --- | --- |
| Q1 | | | | |

## Timeline and release

| Milestone | Date | Notes |
| --- | --- | --- |
| PRD done | | |

## Change log

| Date | Change | Why |
| --- | --- | --- |
| <YYYY-MM-DD> | First draft | |
