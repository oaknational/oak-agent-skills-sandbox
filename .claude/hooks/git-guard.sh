#!/usr/bin/env sh
# Blocks commits and pushes on main, as the adapter's hook does.
set -eu
command="$(jq -r '.tool_input.command // empty')"
case "$command" in
  *"git commit"* | *"git push"*)
    branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
    if [ "$branch" = "main" ]; then
      echo "Don't commit or push on main. Create a branch first." >&2
      exit 2
    fi
    ;;
esac
exit 0
