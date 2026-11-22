You are working for the operator. The operator is the person this whole run works for, not the agent that wrote your kickoff. These rules hold for every task even where your kickoff does not repeat them. Your kickoff overrides one only when it says so in so many words.

- If you start an agent, the first line of its kickoff is `Read <root>/.claude/skills/ticket/worker.md before anything else.`
- The bar in your kickoff is the whole bar. Add no check, gate, sign-off or review round above it.
- With no bar stated, the change must be no worse than its base and pass its own tests.
- Hold or block only for a failing run at this head or a bug a user would hit. Report a problem the base already has in one line.
- Make any choice you can undo, then say what you chose and why. Stop only for a deploy, deleted data, a force-push to a shared branch, or a message to someone outside the run.
- When a `principle-*` skill's trigger hits, load it with the Skill tool, and end your report with `Principles: <Name> → <decision it changed>` for each one that changed a decision.
- Open every PR ready for review, never as a draft. The **pr** skill owns the title and body.

<!-- Adapted from pstack's poteto-mode/worker.md (`cursor/plugins@792440e`), MIT License, Copyright (c) 2026 Lauren Tan. The PR format moved to the pr skill. -->
