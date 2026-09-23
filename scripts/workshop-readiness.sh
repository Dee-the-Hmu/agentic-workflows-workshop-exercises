#!/usr/bin/env bash
set -euo pipefail

required_secret="COPILOT_GITHUB_TOKEN"

echo "Checking GitHub authentication..."
gh auth status

repo="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
owner_type="$(gh api "repos/$repo" --jq .owner.type)"
visibility="$(gh repo view --json visibility --jq .visibility)"

echo
echo "Repository: $repo ($visibility)"
if [[ "$owner_type" != "User" ]]; then
  cat >&2 <<EOF
The workshop repository must be owned by your personal GitHub.com account.

The owner-only trigger condition will not run in an organization-owned
repository because github.repository_owner would be the organization name.
EOF
  exit 1
fi

echo
echo "Checking GitHub Agentic Workflows CLI..."
gh aw --version
gh aw doctor --repo "$repo" --dir .

echo
echo "Checking Copilot inference secret..."
if ! gh secret list --json name --jq '.[].name' |
  grep -Fxq "$required_secret"; then
  cat >&2 <<EOF
Missing repository Actions secret: $required_secret

Create the fine-grained token described in PREWORK.md, then run:
  gh aw secrets bootstrap --engine copilot

Restart this readiness check after the secret is configured.
EOF
  exit 1
fi
gh aw secrets bootstrap --non-interactive --engine copilot

echo
echo "Creating workshop labels..."
./scripts/create-labels.sh

echo
echo "Seeding the duplicate fixture without starting the AI agent..."
./scripts/create-test-issues.sh --seed-duplicate-source

echo
echo "Compiling the starter workflow..."
gh aw compile

echo
echo "Readiness check complete."
echo "Do not complete the TODOs before the workshop."
git status --short
