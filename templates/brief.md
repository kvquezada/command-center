Status: approved · <YYYY-MM-DD> · <who>

# <KEY>/T<n>: <task title from the plan>

<!-- template: brief@1
One brief is one sdlc run and one stacked PR. Build it only from an approved plan (Feature) or diagnosis (Bug fix),
copying, never rewriting. Keep it in work/<KEY>-<slug>/briefs/, outside every agent's grants.
Line 1 copies the plan's (or diagnosis's) "Approved by". sdlc reads it, and takes the Jira key from the title.
The H2 sections below are fixed: all of them, in this order, each once. An empty one says "None.".
sdlc cuts each agent's slice by these headings:
  builder:    Task, Design, Scope, ADRs, Rollout, Repro test
  verifier:   Task, Journeys, Repro test
  reviewer:   Task, Design, Scope, ADRs, Journeys, Rollout
  adversary:  Task, Scope, Journeys
  documenter: Task, Journeys
  code only:  the status line, Working answers and Links (the last two go in the PR body)
Bug fix: Task = Symptom + the confirmed cause + Fix plan. Design = the confirmed cause's evidence plus the causes
ruled out and what you saw. Scope = the Fix plan's files plus "leave the other ranked causes alone".
Journeys = the Repro steps as a Does / Sees table. Repro test = the diagnosis's, word for word. -->

## Task

<The plan task's paragraph.>

**Acceptance criteria**
- `<KEY>/J<n>.<step>`: <copied from the plan>

**Verification**
- <copied from the plan>

**Requirements**

| ID | Requirement | Priority |
| --- | --- | --- |
| <KEY>/R<n> | <the PRD row, word for word> | |

**Stack:** base `<branch>`. <tasks that branch from this PR>

## Design

### <spec "Proposed design" H3 named by the task, copied whole>

## Scope

**This task's files:** <from the plan>

**Other tasks, not this one:** <KEY>/T<n> (<what it owns>)

<The spec's "Scope and non-goals" table, copied whole.>

## ADRs

<Each ADR the task names, copied whole, or None.>

## Journeys

<Only the cited steps. Name any skipped step that belongs to another task.>

**<KEY>/J<n>: <goal>** · **Role:** <role> · **Starts:** <start>

| Step | Does | Sees |
| --- | --- | --- |
| J<n>.<step> | <word for word> | <word for word> |

## Rollout

<The spec's rollout steps the task names, copied whole.>

## Repro test

<Bug fix: the diagnosis's Repro test section body, word for word (Path:, Command:, Failure on base:, one fence),
or "None — <reason>". Feature: "None — a Feature task.">

## Working answers

<- **Q<n>** <question> Working answer: <value>. Rework if wrong: <cost>. — or None.>

## Links

- Ticket: <KEY>
- Plan or diagnosis: <local path> · Confluence: <link>
- Spec: <local path> · Confluence: <link>
- PRD: <local path>
- Journeys: <local path>
