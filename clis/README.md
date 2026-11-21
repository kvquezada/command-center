# CLIs

Each `<name>.sh` here registers one CLI with `hq`. `hq` lists it in `hq --help`, checks it in `hq doctor`, installs it with `hq install <name>`, and updates it with `hq update <name>`.

## Add a CLI

1. Copy `_template.sh.txt` to `<name>.sh`.
2. Set `CLI_BIN` and `CLI_DESC`, and fill in the four functions: `cli_version`, `cli_auth`, `cli_install` and `cli_login`. Add `cli_update` too, unless the CLI can't update itself.
3. Run `hq doctor <name>`, then `hq install <name>` if it's missing.
4. Commit the file.

## Rules for the functions

- `cli_auth` must exit 0 only when the CLI is logged in and usable, because `hq doctor` uses its exit code. It may print the account name.
- `cli_install` prefers Homebrew. Use the vendor's installer only when the CLI isn't in Homebrew, and link its docs in a comment.
- If an installer or login needs a browser or a prompt, check `[ -t 0 ]` first and tell the user to run `hq install <name>` in their terminal.
- `hq` sources each file in its own subshell, so variables and functions don't leak between CLIs.
