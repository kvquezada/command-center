---
tags: [skill-creator]
max_turns: 40
timeout_seconds: 1200
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

can you write an ADR page in my confluence personal space recording why the OMS uses MongoDB + Mongoose instead of Postgres? reasons from back then: order line items + meal box options are nested and change shape a lot as the menu evolves, the team already knew mongo, and we run it in docker locally with no migrations step. downside we accepted: reporting queries across orders are harder and we have no FK guarantees. repo is ~/code/oms if you want to check details.
