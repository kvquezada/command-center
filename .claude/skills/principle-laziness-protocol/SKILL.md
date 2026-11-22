---
name: principle-laziness-protocol
description: "Apply when refactoring, evaluating diff size, or tempted to add abstractions, layers, or signal threading. Bias toward deletion and the smallest change that solves the problem."
user-invocable: false
---

# Laziness Protocol

- **Consolidate decisions.** Do not repeat the same choice in several places. Put it behind one source of truth and pass the result as a simple flag.
- **Minimize the diff.** Make the smallest change that solves the problem. Fewer lines beat "elegant" boilerplate.

<!-- Copied from pstack (`cursor/plugins@792440e`, `pstack/skills/principle-laziness-protocol/SKILL.md`), MIT License, Copyright (c) 2026 Lauren Tan. -->
