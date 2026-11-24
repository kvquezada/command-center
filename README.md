# command-center

A home repo to start agent sessions from. It holds the skills shared across your other repos, the `/refine` skill, and pointers to the repos you work in. Agents read `AGENTS.md`; this file is for people.

## Setup

Do this once per checkout.

1. List your repos:

   ```sh
   bin/setup
   ```

   This finds the git repos under your home directory and writes them to `REPOS.md`, which git ignores. Open `REPOS.md`, delete the repos you don't work in, and add a line on what each one is. Agents read it before they work in another repo. To rescan, run `bin/setup --force`, which overwrites your edits.

2. Optional: configure `/refine`:

   ```sh
   cp config.example.yaml config.yaml
   ```

   Add your team's past tickets as estimation references. Without the file, `/refine` uses the generic examples. Git ignores `config.yaml`.

3. Check your CLIs:

   ```sh
   bin/hq doctor
   ```

   For each CLI it reports missing or logged out, run `bin/hq install <name>`. Installers and logins can open a browser.

4. Optional: load `confluence-page-design` in every session, not only in this repo:

   ```sh
   ln -s "$PWD/.claude/skills/confluence-page-design" ~/.claude/skills/
   ```

## Skills

The skills live in `.claude/skills/`.

| Area | Skills |
|---|---|
| Refinement | `refine`: takes one vague Jira ticket to Ready, following the team's Backlog Refinement Playbook. Its templates are in `templates/`. |
| Code questions | `how`, `why`, `sketch`, `in-your-own-words` |
| Writing | `unslop`, `technical-writing`, `confluence-page-design` |
| Review | `security-review` |
| Engineering principles | `principle-*`, one skill per principle |

## Maintenance

- **Update `security-review`:** copy `.claude/commands/security-review.md` from [anthropics/claude-code-security-review](https://github.com/anthropics/claude-code-security-review) (MIT) over the skill's body, and keep its frontmatter.
- **Add a CLI to `hq`:** follow `clis/README.md`.
- **Keep personal details out of tracked files.** Repo paths, accounts and space IDs belong in `REPOS.md` and `config.yaml`.
