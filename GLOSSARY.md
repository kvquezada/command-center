# command-center

The words the `/ticket` workflow uses for the path from a Jira ticket to a PR.

## Language

**Router**:
The `/ticket` skill. It reads one ticket, picks its Playbook and restates the ticket.
_Avoid_: dispatcher, front door, triage

**Playbook**:
The ordered steps for one kind of ticket: Bug fix or Feature.
_Avoid_: route, workflow, flow

**Checkpoint**:
A Playbook step that waits for you before the agent goes on.
_Avoid_: gate (the factory uses that for code-checked acceptance), approval step

**Diagnosis**:
The local document for a bug: ranked probable causes, repro steps, a repro test where one is cheap, and the fix plan. You approve it.
_Avoid_: bug report, root-cause note, investigation

**Refine pass**:
One round of reading PM comments on the published PRD, editing the Markdown and republishing it.
_Avoid_: review round, iteration

**Run brief**:
The `brief.md` built from one approved plan task. Each `sdlc` agent reads only its own slice of it, and one brief is one run and one PR.
_Avoid_: spec (the whole design), plan (all the tasks), prompt
