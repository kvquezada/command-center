# Questions to ask on a vague ticket

The checklist for Investigate. Each line needs an answer from the code or the ticket, a stated assumption, a question for the PM, or a spike.

- **Purpose.** Who is the user, what problem does this solve, and how will we know it worked?
- **Behaviour.** What are the inputs, outputs, validation rules and empty states?
- **Edge cases.** What happens on errors, retries, timeouts, duplicates and concurrent writes?
- **Permissions.** Who can see this, and who can do it?
- **Data.** Which fields are new, and does the change need a migration, a backfill or a retention rule?
- **Integrations.** Which external APIs and webhooks does it call, under what rate limits, and is each call idempotent?
- **NFRs.** What volume and latency are expected, and what logging and alerts does it need?
- **Rollout.** Does it need a feature flag, backwards compatibility or a migration order?
- **Scope.** What is explicitly out?
