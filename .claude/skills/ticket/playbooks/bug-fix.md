# Bug fix

You own the diagnosis. The user owns the reproduction: there is no surface testing yet, so the user runs the repro and names the cause that holds. Every shipped line traces to that evidence, and the smallest change it supports ships.

1. **Restate the symptom**, expected against actual. ✋ (This is the router's restatement.)
2. **Search for probable causes.** **diagnosing-bugs** ranks hypotheses (skip its feedback-loop build). **how** or an Explore subagent traces the code path, and **why** reads the regression history. Principles: Fix Root Causes, Guard the Context Window.
3. **Write `work/<KEY>-<slug>/<YYYY-MM-DD>-<topic>-diagnosis.md`** from `templates/diagnosis.md`. It is not published. Write the Repro test with **tdd** only when a cheap local test target exists. Principle: Laziness Protocol for the fix plan.
   Done when every cause has file:line evidence and repro steps that tell the causes apart.
4. **The user reproduces and names the cause that holds.** ✋
   - None holds: re-rank with the user's result, update the diagnosis, and ask again. Principle: Attack the Premise when two causes that share an assumption both fail.
   - The expected behavior was never specified: propose Feature (see the router).
   - A cause holds: write "Approved by: <user>" and the result into the diagnosis. That approval authorizes the commits, pushes and PR for the fix.
5. **Build** per `build.md`, with the failing test committed before the fix. Principles: Sequence Work into Verifiable Units, Test Behavior Not Implementation.
6. **Verify.** The Repro test passes if one exists, and the user reruns the repro steps. Principle: Prove It Works.
7. **Open the PR** per `open-pr.md`. Its Verification section lists the repro steps and the user's result.

**Reply at the end:** what was broken, the cause, the fix, and how it was verified, with the failing-then-passing output.
