#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
SKIP_AUDIT=false

for arg in "$@"; do
  case $arg in
    --skip-audit) SKIP_AUDIT=true ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

# Check node/npm
if ! node --version >/dev/null 2>&1; then
  echo "Error: Node.js is required. Install via brew, nvm, mise, fnm, volta, etc." >&2
  exit 1
fi

# Audit dependencies before installing
if [ "$SKIP_AUDIT" = false ]; then
  echo "Auditing dependencies for known vulnerabilities..."
  if ! npm audit --prefix "$SKILL_DIR" 2>/dev/null; then
    echo ""
    echo "Error: vulnerabilities detected in dependencies. Aborting." >&2
    echo "Re-run with --skip-audit to install anyway." >&2
    exit 1
  fi
fi

# Install dependencies locally
npm install --prefix "$SKILL_DIR"

echo ""
echo "Done. md-to-pdf is ready at $SKILL_DIR/node_modules/.bin/md-to-pdf"
echo "You may be prompted to approve this binary the first time it runs — approve permanently."
