# command-center

The team's home repo for agent sessions. It holds the skills shared across repos, in `.claude/skills/`:

- `confluence-page-design`: how to write Confluence Cloud pages. Link it into `~/.claude/skills/` to load it in every session, and edit the copy here, not through the link.
- `security-review`: a security review of the current branch's changes against `origin/HEAD`. It comes from anthropics/claude-code-security-review (MIT). To update it, copy that repo's `.claude/commands/security-review.md` over the body.
- `technical-writing`: the layered technical-writing standard.
- `unslop`: cuts AI tells from any prose, your replies included. Always apply it.

Installed skills (`~/.agents/skills`, plugins, claude.ai) stay where their installers put them.

## Setup

On a new checkout, run `bin/setup`. It finds the git repos under your home directory and writes them to `REPOS.md`. Then delete the repos you don't work in and add a line on what each one is.

## Per-developer config

Nothing about one developer's repos, accounts or spaces is committed. Each of these is gitignored:

- `REPOS.md` (written by `bin/setup`): each repo you work in, with its path, remote, base branch and what to read first.
- `command-center.local.yaml` (from `command-center.example.yaml`): your Jira project key and the Confluence space and page that `/ticket` publishes to.
- `scrub.local.txt` (optional): extra strings, one per line, that `bin/scrub-check` must never find in tracked files, such as your name or handle.

If a skill needs one of these files and it is missing, stop and tell the user how to create it.

Run `bin/scrub-check` before committing. It fails if a tracked file holds a home path, a clone URL, a Confluence personal-space ID or a string from your git identity or `scrub.local.txt`.

## Other Repos

Before you work in another repo, read `REPOS.md` for its path, base branch and what to read first. Branch from and open PRs against that base branch. If `REPOS.md` is missing, tell the user to run `bin/setup`.

## CLIs

Run `hq` to see the CLIs you can use, such as `gh` for GitHub and `twg` for Jira and Confluence, and whether each is installed and logged in. Call those CLIs directly. `hq doctor` exits 1 if any is missing or logged out. If one is, tell the user to run `hq install <name>` in their terminal, because installers and logins can open a browser. To register a new CLI, follow `clis/README.md`.
