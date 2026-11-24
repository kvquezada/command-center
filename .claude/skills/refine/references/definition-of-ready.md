# Definition of Ready

The team owns this checklist and edits it here. It is a light checklist for the team, not a hard gate. For the agent it is binding in one place: a ticket that fails any item other than the estimate gets no estimate.

Check every item. A pass needs evidence from the ticket text, its comments, or the draft in `ready.md`.

| Item | Pass when |
| --- | --- |
| Value and target user clear | The ticket names who it is for, the problem, and how anyone will know it worked. |
| Acceptance criteria written, testable | Gherkin scenarios cover the happy path and the edge and error cases, and each `Then` is something a test can observe. "Works correctly" fails. |
| Dependencies known or resolved | Other teams, services and tickets the work waits on are named, each with its state. |
| Unknowns cleared by a spike | No question or spike is open. |
| UI or API contract attached if needed | A UI change links its design. A change that calls a source system cites that system's contract. |
| Estimated, fits in one sprint | The ticket has the team's points, under 13, and about 3 days of work or less. |
| NFRs noted | Expected volume, latency, logging and alerts are stated, or the ticket says none apply. |

A **Bug** also needs these sections, each filled: Environment, Steps to reproduce, Expected, Actual, Severity.

## Signs a ticket needs refinement

Use these to explain a gap in one line.

- No acceptance criteria, or criteria like "works correctly"
- Missing the why: no user, problem or success measure
- Edge cases, error states and permissions not covered
- API, data model or integration impact unknown
- The team can't estimate it, or estimates spread widely
- Bigger than about 3 days of work
- Hidden dependencies on other teams, services or tickets
