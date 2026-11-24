## Refinement note

**My understanding:** <one or two lines restating the goal>

**Proposed AC**

```gherkin
Scenario: <happy path>
  Given <context>
  When <action>
  Then <outcome>

Scenario: <error or edge case>
  Given <context>
  When <action>
  Then <outcome>
```

**Technical approach:** <modules, endpoints and schema changes, the ADRs and contracts it relies on, and each decision as "Decision: <X>, because <Y>". For a Bug, the probable causes ranked, each with file:line evidence.>

**Assumptions:** <what you assumed, for the PM to confirm>

**Questions for PM:**
1. <question>

**Out of scope:** <...>

**Risks / dependencies:** <...>

**Rough size:** S / M / L (split if L)
