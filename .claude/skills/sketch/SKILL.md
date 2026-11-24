---
name: sketch
description: "Sketch types, signatures, and module structure before code. Use for non-trivial work where jumping to code would lock in the wrong shape."
---

# Sketch

Before writing code, trace every system the change touches, then sketch two different shapes for it (types, signatures, module boundaries) and pick the one where each piece of state has one owner, each task has one way to do it, and callers need to know least. Redesign instead of patching if workarounds repeat.

Write the pick and the rejected shape into the spec: the pick under Proposed design, the rejected shape under Alternatives considered.

Spawn no subagents and run no arena. The calling step names the principles that apply.

<!-- Adapted from pstack's `architect` (`cursor/plugins@792440e`, `pstack/skills/architect/SKILL.md`), MIT License, Copyright (c) 2026 Lauren Tan. Renamed so it doesn't clash with the global `architect` port. -->
