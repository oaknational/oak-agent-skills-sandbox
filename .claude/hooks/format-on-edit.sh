#!/usr/bin/env sh
# Formats the file an agent just edited, as the adapter's hook does.
set -eu
file="$(jq -r '.tool_input.file_path // empty')"
[ -n "$file" ] || exit 0
[ -f "$file" ] || exit 0
pnpm exec prettier --write --ignore-unknown "$file" >/dev/null 2>&1 || true
