# command-center

The team's home repo for agent sessions. It holds the skills shared across repos, in `.claude/skills/`:

- `confluence-page-design`: how to write Confluence Cloud pages. Link it into `~/.claude/skills/` to load it in every session, and edit the copy here, not through the link.
- `repo-inventory` (run `/repo-inventory`): finds every git repo under `~`, has you mark each in or out, and writes your `repos.yaml` and `CLAUDE.local.md`.
- `security-review`: a security review of the current branch's changes against `origin/HEAD`. It comes from anthropics/claude-code-security-review (MIT). To update it, copy that repo's `.claude/commands/security-review.md` over the body.
- `technical-writing`: the layered technical-writing standard.
- `unslop`: cuts AI tells from any prose, your replies included. Always apply it.

Installed skills (`~/.agents/skills`, plugins, claude.ai) stay where their installers put them.

## Per-developer config

Nothing about one developer's repos, accounts or spaces is committed. Each of these is gitignored and starts from a tracked example:

- `repos.yaml` (from `repos.example.yaml`, or written by `/repo-inventory`): each repo you work in, with its `name`, `path` and `base_branch`. Branch from and open PRs against that `base_branch`.
- `CLAUDE.local.md` (written by `/repo-inventory`): the "Other Repos" notes, which say what each repo is and what to read first.
- `command-center.local.yaml` (from `command-center.example.yaml`): your Jira project key and the Confluence space and page that `/ticket` publishes to.
- `scrub.local.txt` (optional): extra strings, one per line, that `bin/scrub-check` must never find in tracked files, such as your name or handle.

If a skill needs one of these files and it is missing, stop and tell the user how to create it.

Run `bin/scrub-check` before committing. It fails if a tracked file holds a home path, a clone URL, a Confluence personal-space ID or a string from your git identity or `scrub.local.txt`.

## CLIs

Run `hq` to see the CLIs you can use, such as `gh` for GitHub and `twg` for Jira and Confluence, and whether each is installed and logged in. Call those CLIs directly. `hq doctor` exits 1 if any is missing or logged out. If one is, tell the user to run `hq install <name>` in their terminal, because installers and logins can open a browser. To register a new CLI, follow `clis/README.md`.
