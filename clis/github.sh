CLI_BIN=gh
CLI_DESC="GitHub: repos, PRs, issues, Actions and the API (gh)"

cli_version() { gh --version | awk 'NR==1{print $3}'; }

# Succeeds when logged in; prints the active account.
cli_auth() {
	gh auth status --active >/dev/null 2>&1 || return 1
	gh auth status --active 2>&1 | sed -n 's/.*account \([^ ]*\).*/\1/p' | head -1
}

cli_install() { brew install gh; }

cli_login() { gh auth login; }
