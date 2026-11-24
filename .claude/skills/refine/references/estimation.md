# Story point estimation

The agent proposes an estimate for a ticket that passes every other Definition of Ready item, and the team confirms it in planning poker. Points measure relative effort (complexity, uncertainty and volume), never hours.

**Scale.** Fibonacci 1, 2, 3, 5, 8, 13. A 13 means split or spike, with no estimate.

## Reference scale

`estimation.reference` in `config.yaml` maps a point value to one of the team's past tickets. Where it names a ticket, read that ticket and use it as the example for that value. Elsewhere, use the generic example below.

| Points | Meaning | Generic example |
| --- | --- | --- |
| 1 | One file, no unknowns | Copy change, config flag |
| 2 | One module, clear tests | Add a field to an API response |
| 3 | Several files, one layer | New validated endpoint on an existing model |
| 5 | Crosses layers or touches one integration | New endpoint plus a DB migration |
| 8 | Several components, some unknowns | External API integration with webhooks and retries |
| 13 | Too big or unclear | Split or spike |

## Steps

1. **Gate.** If the ticket fails any other Definition of Ready item, output `Not Ready` with what is missing, and stop.
2. **Scan impact.** List the files, modules, endpoints, tables and integrations the change touches. Investigate already found them.
3. **Score three factors**, Low = 1, Med = 2, High = 3: Complexity, Uncertainty, Volume.
4. **Map the sum to points.** 3 → 1, 4 → 2, 5 → 3, 6 → 5, 7 → 8, 8 or 9 → 13.
5. **Compare with the reference scale.** Pick the closest reference ticket. If it disagrees with step 4, move one step toward it.
6. **Add one step** for each of these that holds: no existing tests in the area, a migration on a large table, a cross-team dependency.
7. **At 13, or with Uncertainty High,** recommend a split (SPIDR) or a timeboxed spike instead of a number.
8. **Output** the block below.

```md
Estimate: <pts> (confidence: low | med | high)
Factors: Complexity <L/M/H> · Uncertainty <L/M/H> · Volume <L/M/H>
Closest reference: <ticket key, or the generic example>
Impact: <files / modules / tables / integrations>
Drivers: <what makes it this size>
Risks / split suggestion: <...>
```

## Guardrails

- Estimate in points only, never in hours or days.
- A Not Ready ticket gets no estimate.
- A spike gets a timebox, not points.
- The team's vote wins. When it is two or more steps from the agent's number, the team discusses it, and the agent offers to log the ticket in `estimation.reference` so the reference scale recalibrates.
