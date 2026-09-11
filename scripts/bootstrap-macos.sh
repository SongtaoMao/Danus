#!/usr/bin/env bash
# Install a project-local Python on macOS, then run the common bootstrap.
# No Homebrew changes, shell-profile edits, or global package installs.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
[ "$(uname -s)" = Darwin ] || { echo "Use scripts/bootstrap.sh on Linux." >&2; exit 1; }
RT="$ROOT/runtime"
mkdir -p "$RT/bootstrap-tools"
export UV_CACHE_DIR="$RT/uv-cache"
export UV_PYTHON_INSTALL_DIR="$RT/python"
export UV_PYTHON_BIN_DIR="$RT/python-bin"
UV="$RT/bootstrap-tools/bin/uv"
if [ ! -x "$UV" ]; then
  python3 -m pip install --disable-pip-version-check --no-cache-dir \
    --target "$RT/bootstrap-tools" uv
fi
"$UV" python install 3.12
export DANUS_BOOTSTRAP_PYTHON
DANUS_BOOTSTRAP_PYTHON="$("$UV" python find --managed-python 3.12)"
exec bash "$HERE/bootstrap.sh"
