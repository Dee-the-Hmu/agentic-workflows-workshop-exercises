#!/usr/bin/env bash
set -euo pipefail

readonly gh_aw_version="v0.88.7"

echo "Installing GitHub Agentic Workflows CLI ${gh_aw_version}..."
gh extension install github/gh-aw --pin "$gh_aw_version" --force

echo
gh aw --version
echo
echo "Codespace tools are installed."
echo "Complete PREWORK.md, then run ./scripts/workshop-readiness.sh."
