# command-center

The words the `/refine` skill uses for taking a vague Jira ticket to one the team can build.

## Language

**Refinement**:
Turning a ticket a PM wrote into a Ready ticket. The PM owns the what and the why; the dev owns the how.
_Avoid_: grooming, backlog grooming

**Definition of Ready**:
The team's checklist a ticket passes before it gets an estimate or enters a sprint.
_Avoid_: DoR gate, entry criteria

**Ready**:
A ticket that passes every Definition of Ready item, carries the team's estimate, and has a description the PM approved.
_Avoid_: refined, groomed, agent-ready

**Not Ready**:
A ticket with an open question or an open spike. It gets no estimate and stays out of the sprint.
_Avoid_: blocked, on hold

**Refinement note**:
The comment the dev posts on a ticket with their understanding, proposed acceptance criteria, technical approach, questions and what is out of scope.
_Avoid_: analysis, proposal, write-up

**Ready story**:
The shape of a Ready ticket's description: the story line, Gherkin acceptance criteria, technical notes, dependencies, test approach, out of scope and estimate.
_Avoid_: spec, brief, plan

**Spike**:
A timeboxed piece of research that answers one question blocking refinement. It produces a decision, a throwaway prototype or a recommendation, never shippable code.
_Avoid_: investigation, research ticket

**Source system**:
A system the change reads from or writes to whose code is not in `REPOS.md`, such as an upstream API, a webhook, a feed or a vendor.
_Avoid_: external system, third party, upstream

**Reference ticket**:
A past ticket the team uses as the example for one point value when estimating.
_Avoid_: anchor, benchmark

**Checkpoint**:
A step that waits for you before the agent goes on.
_Avoid_: gate, approval step
