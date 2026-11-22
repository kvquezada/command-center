---
template: journeys@1
ticket: <KEY>
topic: <topic>
status: draft            # draft | in-review | done
confluence_id:
prd: <YYYY-MM-DD>-<topic>-prd.md
---

# 🧭 <Topic>: user journeys

> **What this is:** the paths people take through <feature>, step by step, with what they should see.
> **Used by:** the verifier checks each step's "Sees"; the documenter writes user docs from them.
> **PRD:** <link> · **Ticket:** <KEY link> · **Status:** DRAFT

## Journey index

IDs are permanent. Never renumber or reuse a journey or step. Add new steps at the end, or as `J1.2a` between two. Cite a journey as `<KEY>/J<n>` and a step as `<KEY>/J<n>.<step>`.

| ID | Journey | Role | Kind | Requirements |
| --- | --- | --- | --- | --- |
| J1 | <goal in the user's words> | <role> | Happy path | R1 |
| J2 | | | Edge case | |
| J3 | | | Denied | |

## J1: <goal in the user's words>

**Role:** <role> · **Starts:** <where they are and what's true> · **Covers:** R1

| Step | Does | Sees |
| --- | --- | --- |
| J1.1 | <one action> | <observable result: screen, value, message> |
| J1.2 | | |

**Ends when:** <the observable end state>

## J2: <goal>

**Role:** · **Starts:** · **Covers:**

| Step | Does | Sees |
| --- | --- | --- |
| J2.1 | | |

**Ends when:**

## Change log

| Date | Change | Why |
| --- | --- | --- |
| <YYYY-MM-DD> | First draft | |
