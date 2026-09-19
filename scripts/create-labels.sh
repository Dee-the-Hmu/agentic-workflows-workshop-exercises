#!/usr/bin/env bash
set -euo pipefail

labels=(
  "bug|d73a4a|Something is not working"
  "feature|a2eeef|New functionality or request"
  "question|d876e3|Further information is requested"
  "needs-info|fbca04|Additional information is required"
  "duplicate|cfd3d7|This issue already exists"
  "invalid|e4e669|This issue is not actionable"
  "spam|b60205|Spam or test submission"
  "priority/p0|b60205|Critical incident, severe data loss, or broad outage"
  "priority/p1|d93f0b|Major regression or blocker without a workaround"
  "priority/p2|fbca04|Normal actionable work"
  "workshop-fixture|6e7781|Workshop test fixture; agent execution is skipped"
)

for entry in "${labels[@]}"; do
  IFS='|' read -r name color description <<< "$entry"
  gh label create "$name" \
    --color "$color" \
    --description "$description" \
    --force
done

echo "Workshop labels are ready."
