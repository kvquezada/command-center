# Publish to Confluence

Read `confluence.space_id` and `confluence.specs_parent_id` from `command-center.local.yaml`. If the file or either key is missing, stop and ask the user to copy `command-center.example.yaml` and fill it in. ✋

Pages live in that space under the parent page `specs`, which sits under `specs_parent_id`. Its children are `prd`, `user-journeys`, `tech-specs`, `plans` and `adrs`. Look up their page ids with `twg confluence tree <specs_parent_id> --depth 2` the first time. The local Markdown is the source, and the page matches the file name without `.md`. Follow **confluence-page-design** for the page itself.

- **First publish.** `twg confluence content create --space-id '<space_id>' --parent-id <child page id> --content-type page --title "<file name without .md>" --body-file <file> --format md --ack-body-formats -y`. Write the returned page id into the file's `confluence_id`. Version 1 is the agent's own.
- **Republish.**
  1. Read `twg confluence content get <id> --include-metadata` and `versions list`. If the latest version is not version 1 and its message doesn't start with `ticket:`, someone else edited the page. Show the diff (`versions diff`) and wait. ✋
  2. List comments (`twg confluence content comments list --id <id> --sort -created-date --include-replies true`). If any inline comment exists, stop and tell the user: a Markdown republish probably detaches inline comments from their text, and that choice is still open on the map.
  3. Update with the snapshot token from `content get <id> --draft`, the same body flags, and `--version-message "ticket: <KEY> <step>"`.
- **Refine pass.** List comments newer than the last pass, newest first, and stop at the cutoff (twg has no `--since`). Fold each answer or requested change into the Markdown, cite the comment in the file's Change log, and show the user what changed before republishing. Resolve account ids to names with `twg user get`.
