---
name: spec
description: "Turn a Jira ticket or idea into an implementation-ready technical spec: /spec <KEY>."
disable-model-invocation: true
---

# Idea to Spec

Turn the idea into a technical spec covering goals, non-goals, constraints, entrypoints, changes to existing behavior, failure handling, open questions, and how each claim will be verified — not implementation steps.

Ground every factual claim in evidence you gathered from the codebase or environment this session, and put decisions that are genuinely the user's — anything involving auth, credentials, destructive operations, cost, or taste — to the user rather than defaulting them.

Spend as much computation as the stakes warrant: explore widely, draft alternatives, critique your own draft with fresh eyes, and iterate until the spec would survive a skeptical reviewer.

Confirm the spec with the user before publishing it wherever they choose.

## Factory contract

The spec feeds `npm run sdlc` in the kering-technologies-ai repo. sdlc refuses a spec that breaks these rules.

- **Sources.** Read the ticket and its linked pages with `twg jira` and `twg confluence`. Read the target's code through the repos in `REPOS.md`. Never write to Jira.
- **Where it goes.** Save the spec to `work/<SPRINT>/<KEY>-<slug>/spec.md` when the ticket has a sprint, and to `work/<KEY>-<slug>/spec.md` when it has none. It is the same folder `/refine` uses, and `work/` is gitignored. With no ticket, use `work/<slug>/spec.md`.
- **Approval.** After the user confirms the spec, add `Status: approved · YYYY-MM-DD` on its own line above the first `##` heading. sdlc builds only a spec with that line.
- **Ticket key.** Put the ticket key in the text, such as in the title. sdlc links the run to the first key it finds.
- **No working answers.** Leave out a `## Working answers` section.
- **Hand-off.** End by printing the command for the user to run from the kering-technologies-ai repo, with the spec's absolute path and the complexity you suggest (S, M or L):

  ```bash
  npm run sdlc -- --target <target> --complexity <S|M|L> --spec <absolute path to spec.md> --ship
  ```
