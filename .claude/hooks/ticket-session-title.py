#!/usr/bin/env python3
"""UserPromptSubmit hook: name a /ticket session "KEY", then "KEY · Playbook".

Reads the hook payload on stdin. Prints a sessionTitle only when the session
has no custom title yet, or its title starts with the ticket key, so a name
you chose yourself is never overwritten.
"""
import glob, json, os, re, sys

TICKET = re.compile(r"^\s*/ticket\s+([A-Z][A-Z0-9]+-\d+)\b")
PLAYBOOKS = {"bug-fix": "Bug fix", "feature": "Feature"}


def playbook(root, key):
    for path in sorted(glob.glob(os.path.join(root, "work", f"{key}-*", "ticket.md"))):
        text = open(path, encoding="utf-8").read()
        front = re.match(r"---\n(.*?)\n---", text, re.S)
        m = front and re.search(r"^playbook:\s*(\S+)", front.group(1), re.M)
        if m:
            return PLAYBOOKS.get(m.group(1), m.group(1))
    return None


def main():
    try:
        event = json.load(sys.stdin)
    except ValueError:
        return
    root = os.environ.get("CLAUDE_PROJECT_DIR") or event.get("cwd") or "."
    title = (event.get("session_title") or "").strip()
    m = TICKET.match(event.get("prompt") or "")
    key = m.group(1) if m else title.split(" ")[0] if re.fullmatch(r"[A-Z][A-Z0-9]+-\d+", title) else None
    if not key or (title and not title.startswith(key)):
        return
    pb = playbook(root, key)
    new = f"{key} · {pb}" if pb else key
    if new != title:
        print(json.dumps({"hookSpecificOutput": {"hookEventName": "UserPromptSubmit", "sessionTitle": new}}))


if __name__ == "__main__":
    main()
