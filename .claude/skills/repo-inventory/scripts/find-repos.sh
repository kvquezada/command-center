#!/usr/bin/env bash
# Print every git repo under a root (default: $HOME), one tab-separated row each:
#   last_commit  kind  path  remote  visibility
# kind: repo | worktree (.git is a file) | empty (no commits).
# Remote credentials (user:token@) are masked. Visibility comes from gh for
# github.com remotes, "-" otherwise.
set -u
root="${1:-$HOME}"

find "$root" \
  \( -name node_modules -o -name .venv -o -name venv -o -name vendor -o -name Pods \
     -o -name .cache -o -name .npm -o -name .pnpm-store -o -name .yarn -o -name .cargo \
     -o -name .rustup -o -name .gradle -o -name .m2 -o -name .Trash -o -name site-packages \
     -o -name .build -o -name DerivedData -o -name SourcePackages -o -name Carthage \
     -o -path "$root/Library" \) -prune \
  -o -name .git -print 2>/dev/null |
while IFS= read -r g; do
  r="${g%/.git}"
  if [ -f "$g" ]; then kind=worktree; else kind=repo; fi
  date=$(git -C "$r" log -1 --format=%cs 2>/dev/null) || { date=none; kind=empty; }
  remote=$(git -C "$r" remote get-url origin 2>/dev/null || echo -)
  remote=$(printf '%s' "$remote" | sed -E 's#//[^/@]+@#//***@#')
  vis=-
  slug=$(printf '%s' "$remote" | sed -nE 's#^(git@github\.com:|https://(\*\*\*@)?github\.com/)([^/]+/[^/]+)$#\3#p' | sed 's/\.git$//')
  if [ -n "$slug" ] && command -v gh >/dev/null; then
    vis=$(gh repo view "$slug" --json visibility -q .visibility 2>/dev/null | tr 'A-Z' 'a-z')
    [ -n "$vis" ] || vis=unknown
  fi
  printf '%s\t%s\t%s\t%s\t%s\n' "$date" "$kind" "$r" "$remote" "$vis"
done | sort -r
