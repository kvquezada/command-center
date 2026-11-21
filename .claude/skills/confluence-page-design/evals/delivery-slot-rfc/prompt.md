---
tags: [skill-creator]
max_turns: 30
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

I need an RFC page in Confluence (my personal space) for how we should handle delivery time slots in the OMS. Context: customers on the storefront currently just pick a date, and the kitchen gets slammed in the 11am-1pm window. Options I'm considering:
A) fixed 2-hour slots with a per-slot capacity cap (e.g. 25 orders/slot), customer picks at checkout
B) let customers pick AM or PM only, ops assigns exact times the night before
C) keep date-only but add surge pricing (+P50) for the lunch window
I'm leaning A but worried about the build effort (storefront checkout + api + admin screen to set capacity). Option B is cheapest to build but more manual work for ops every night. Write it up so Ana (kitchen) and Joel (delivery) can review and approve.
