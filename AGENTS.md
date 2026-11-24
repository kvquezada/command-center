# command-center

The team's home repo for agent sessions with pointers across other repos. Apply `unslop` to all prose, your replies included.

## Other repos

Before you work in another repo, read `REPOS.md` for its path, base branch and what to read first. Branch from and open PRs against that base branch.

## Local config

These per-developer files are gitignored:

- `REPOS.md`: the repos you work in.
- `config.yaml`: the Jira project key and Confluence target for `/ticket`.

If a task needs one that is missing, stop and point the user to the Setup section of `README.md`.

## CLIs

Run `hq` to see the CLIs you can use, such as `gh` for GitHub and `twg` for Jira and Confluence, and whether each is installed and logged in. Call those CLIs directly. If `hq doctor` exits 1, tell the user to run `hq install <name>` in their terminal, because installers and logins can open a browser. To register a new CLI, follow `clis/README.md`.
