---
template: diagnosis@1
ticket: <KEY>
topic: <topic>
status: draft            # draft | approved
repo: <name from repos.yaml>
---

# 🐞 <Symptom as a statement>

**Approved by:** <blank until you name the cause that holds>

## Symptom

- **Expected:** <what should happen, and where that was specified or last worked>
- **Actual:** <what happens>
- **Where:** <surface, route, command or screen>

## Probable causes

<Ranked, most likely first. Keep the ranking when re-ranking; record what your repro ruled out.>

| # | Cause | Evidence (file:line) | Confirms it | Rules it out |
| --- | --- | --- | --- | --- |
| C1 | <cause> | <path:line> | <observation> | <observation> |
| C2 | <cause> | <path:line> | <observation> | <observation> |

## Repro steps

1. <What you run or click>
2. <What you should see if C1 holds, and if C2 holds>

**Your result:** <filled in after you reproduce: which cause held>

## Repro test

<A failing test for the top cause, in the brief's Repro test block shape, written only when a cheap local test target exists. Otherwise: "None, manual repro only: <reason>".>

## Fix plan

<The smallest change for the cause that holds: files, the change, and what stays untouched.>

## Change log

- <YYYY-MM-DD>: <what changed and why>
