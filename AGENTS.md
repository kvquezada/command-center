# command-center

My home repo. I start agent sessions here. It holds the skills I share across repos, in `.claude/skills/`:

- `api-conventions`: conventions for the oms NestJS + type-graphql + Mongoose API.
- `confluence-page-design`: how to write Confluence Cloud pages. It is linked from `~/.claude/skills/`, so it loads in every session. Edit the copy here, not through the link.
- `security-review`: a security review of the current branch's changes against `origin/HEAD`. It comes from anthropics/claude-code-security-review (MIT). To update it, copy that repo's `.claude/commands/security-review.md` over the body.
- `technical-writing`: the layered technical-writing standard.
- `unslop`: cuts AI tells from any prose, your replies included. Always apply it.

Installed skills (`~/.agents/skills`, plugins, claude.ai) stay where their installers put them.

## CLIs

Run `hq` to see the CLIs you can use, such as `gh` for GitHub and `twg` for Jira and Confluence, and whether each is installed and logged in. Call those CLIs directly. `hq doctor` exits 1 if any is missing or logged out. If one is, tell me to run `hq install <name>` in my terminal, because installers and logins can open a browser. To register a new CLI, follow `clis/README.md`.

## Other Repos

