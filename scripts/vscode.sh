#!/usr/bin/env bash
# Commands for the VS Code tasks; always start in the project directory.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE/.."
case "${1:-start}" in
  login) exec bash scripts/setup-codex.sh login ;;
  doctor) exec bash scripts/doctor.sh ;;
  start)
    bash scripts/services.sh up verify
    exec ./bin/codex --sandbox workspace-write --ask-for-approval on-request
    ;;
  stop) exec bash scripts/services.sh down verify ;;
  *) echo "Usage: bash scripts/vscode.sh {login|doctor|start|stop}" >&2; exit 1 ;;
esac
