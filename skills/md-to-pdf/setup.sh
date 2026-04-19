#!/usr/bin/env bash
set -euo pipefail

# Check node/npm
if ! node --version >/dev/null 2>&1; then
  echo "Error: Node.js is required. Install via brew, nvm, mise, fnm, volta, etc." >&2
  exit 1
fi

# Install md-to-pdf globally (pinned version)
npm install -g md-to-pdf@5.2.5

echo ""
echo "Done. md-to-pdf is ready."
echo "You may be prompted to approve 'md-to-pdf' the first time it runs — approve permanently."
