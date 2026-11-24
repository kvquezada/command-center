---
name: repo-inventory
description: Find every git repo under the home directory, have the user mark each in or out, and write their gitignored repos.yaml and the "Other Repos" notes in CLAUDE.local.md.
disable-model-invocation: true
---

# Repo inventory

Refreshes the home repo's `repos.yaml` and the `## Other Repos` section of its `CLAUDE.local.md` (the home repo is the git root you run from). Both files are gitignored and belong to the user running this, so never commit them from what is actually on disk. Only read until step 4 is done. Leave `.env` and other secret files unread.

## 1. Find

Run `scripts/find-repos.sh` (beside this file). It prunes dependency and build folders, then prints one row per repo, newest first: `last_commit  kind  path  remote  visibility`. `kind` is `repo`, `worktree` (`.git` is a file) or `empty` (no commits). Credentials in remote URLs come out as `***@`. Also run `gh api user -q .login` to learn which owner is the user.

Done when you hold the full output and the login.

## 2. Group

Collapse rows into repos, one per remote. The canonical copy is the `repo` row outside `.claude/worktrees/`, `orca/` and tool dotfolders. A repo with no remote stands alone. When a remote has only tool-managed copies and no checkout of its own, it is a candidate with no local path.

Mark these **out** without asking, and list them in one line each with a count:

- copies: worktrees and extra clones of a grouped remote
- installed: plugin marketplaces and other installer-owned clones (`~/.claude/plugins/`, `~/.adalflow/`, `~/.cookiecutters/`)
- tooling: shell frameworks, themes, editor extensions

Everything left is a **candidate**. Done when every row belongs to a candidate or one of the three out groups.

## 3. Mark

Recommend **in** for a candidate the user owns (a remote under their login, or no remote) with a commit in the last 60 days, or local-only with files changed in that window. Recommend **out** for stale repos and for other people's repos.

Show one table (#, repo, path, remote, visibility, last commit, proposed), then put the decisions in one round: numbered questions, each with your recommended answer, worded so "yes" accepts it. Add a separate warning for any masked `***@` remote, since that is a credential sitting on disk.

Done when the user has marked every candidate in or out.

## 4. Describe

For each repo that is in, find its base branch: `git -C <path> symbolic-ref --short refs/remotes/origin/HEAD`, minus the `origin/`. If that fails, use `main` or `master`, whichever exists locally. Keep the base branch `repos.yaml` already has for that repo.

Then write one line saying what it is, taken from the top of its `README.md`, `AGENTS.md` or `SPEC.md`. Pick its hint:

- it has an `AGENTS.md` → "Read its AGENTS.md first."
- it has a `SPEC.md`, `GLOSSARY.md` or `docs/adr/` → name it as the first read
- it has no remote → "Local only: no remote, so it isn't backed up anywhere."

Keep any hand-written hint that the current `CLAUDE.local.md` already has for that repo.

## 5. Write

Rewrite `repos.yaml` at the home repo root with one entry per repo that is in, in the order the user knows them. Take its header comment from `repos.example.yaml`. Leave out repos with no local checkout.

```yaml
- name: example-app
  path: ~/code/example-app
  base_branch: main
```

Then replace only the `## Other Repos` section of `CLAUDE.local.md`. Create the file if it doesn't exist. Open the section with the paragraph that points to `repos.yaml`, then add one note per repo that is in, in the same order:

```
- <name> (<what it is>):
  Clone from <remote> if missing.
  <hint>
```

The path lives only in `repos.yaml`. Leave out the clone clause when there is no remote. When the repo has no local checkout, write "Clone from <remote>." It gets a note but no `repos.yaml` entry.

Past about 20 repos, group the notes by area into `repos.local/<area>.md` (gitignored), using the same format, and make the section one line per file: `- <area> (<which repos>): see repos.local/<area>.md.` `repos.yaml` stays one flat list.

Done when every repo marked in has exactly one note, plus one `repos.yaml` entry if it is on disk, and no repo marked out has either.

## 6. Report

Show what changed in `repos.yaml` and `CLAUDE.local.md` against their previous contents, and list the repos that came in or went out. Neither file is committed.
