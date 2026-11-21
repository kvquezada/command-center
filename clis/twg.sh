CLI_BIN=twg
CLI_DESC="Atlassian Teamwork Graph: Jira, Confluence, Bitbucket and more (twg)"
# Docs: https://developer.atlassian.com/platform/teamwork-graph/twg-cli/getting-started/installation/

cli_version() { twg --version; }

# twg has no "auth status" command. The first "Token:" line in doctor --basic is the
# Atlassian token; later ones are optional extras such as Bitbucket.
cli_auth() { twg doctor --basic 2>/dev/null | awk '/Token:/{exit $2 != "valid"}'; }

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
