CLI_BIN=twg
CLI_DESC="Atlassian Teamwork Graph: Jira, Confluence, Bitbucket and more (twg)"
# Docs: https://developer.atlassian.com/platform/teamwork-graph/twg-cli/getting-started/installation/

cli_version() {
	twg --version 2>/dev/null && return
	twg doctor --basic 2>/dev/null | awk '/Version:/{print $2; exit}'
}

# twg has no "auth status" command; twg doctor checks credentials and connectivity.
cli_auth() { twg doctor >/dev/null 2>&1; }

# Not in Homebrew. Atlassian's installer puts twg in ~/.local/bin, then runs an
# interactive setup (browser login, agent skill, twg doctor), so it needs a terminal.
cli_install() {
	if [ ! -t 0 ]; then
		echo "twg's installer needs an interactive terminal. Run 'hq install twg' there." >&2
		return 1
	fi
	curl -fsSL --retry 2 https://teamwork-graph.atlassian.com/cli/install | bash
	export PATH="$HOME/.local/bin:$PATH"
}

cli_login() { twg login; }
