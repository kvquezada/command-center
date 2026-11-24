# <KEY>: <title>

As a <role>, I want <capability>, so that <outcome>.

## Acceptance criteria

```gherkin
Scenario: <happy path>
  Given <context>
  When <action>
  Then <outcome>

Scenario: <edge or error case>
  Given <context>
  When <action>
  Then <outcome>
```

## Technical notes

- API: <endpoint, request and response shape>
- Data: <schema changes, migrations>
- Events/webhooks: <idempotency, retries>
- Security/permissions: <who can see and do this>
- Contracts: <UI design link; each source system's contract page and the endpoints used>
- Decision: <X>, because <Y>

## Dependencies

## Test approach (unit / integration / e2e)

## Out of scope

## ADRs

<Each ADR from templates/adr.md, in full, for a decision that met the ADR bar. Delete this section when there is none.>

## Estimate: <pts>  | Epic: <link>
