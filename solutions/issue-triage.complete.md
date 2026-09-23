---
description: >
  Triages new and reopened issues by assessing completeness, applying bounded
  labels, finding duplicates, and posting a concise report.

on:
  issues:
    types: [opened, reopened]
  reaction: eyes
  roles: all

if: >-
  (
    github.actor == github.repository_owner ||
    github.actor == vars.WORKSHOP_OPERATOR
  ) &&
  contains(
    github.event.issue.labels.*.name,
    'workshop-fixture'
  ) == false

permissions:
  contents: read
  issues: read
  copilot-requests: none

engine:
  id: copilot
  model: auto

max-turns: 12
max-ai-credits: 25
max-daily-ai-credits: 75

safe-outputs:
  add-labels:
    allowed:
      - bug
      - feature
      - question
      - needs-info
      - priority/p0
      - priority/p1
      - priority/p2
      - duplicate
      - invalid
      - spam
    max: 3
  add-comment:
    max: 1

timeout-minutes: 8
---

# Issue Triage Assistant

Analyze issue #${{ github.event.issue.number }} and help maintainers understand
and route it quickly. Base every conclusion on the issue, its discussion, and
repository context. Do not invent missing details.

## 1. Gather context

1. Read the issue and its comments.
2. Inspect the repository's available labels.
3. Search issues for the same symptoms, request, error message, component, or
   expected behavior. Stop after finding two useful candidates.
4. Consult repository documentation only when the issue directly depends on
   documented behavior or contribution requirements.

## 2. Assess completeness

For a bug, look for reproduction steps, expected and actual behavior, relevant
logs or errors, and environment details. For a feature or task, look for the
problem being solved, desired outcome, and enough scope to understand the
request.

If essential details are missing:

- Apply `needs-info` when that label exists.
- Ask only the specific questions needed to proceed.
- Do not guess a type, priority, or solution.

If the issue is clearly spam, gibberish, or a test submission, apply `spam` or
`invalid` when available, explain the assessment briefly, and stop.

## 3. Classify and prioritize

Choose only labels that already exist and are directly supported by evidence.
Apply at most one type label and one priority label, plus `needs-info` or
`duplicate` when appropriate.

- `priority/p0`: Active security incident, severe data loss, or broad outage.
- `priority/p1`: Major regression or blocker with no reasonable workaround.
- `priority/p2`: Normal actionable work without immediate operational impact.

Labels can trigger other automation. Prefer leaving priority unset over applying
one speculatively.

## 4. Find duplicates and related issues

- A **duplicate** describes the same problem or request with strong supporting
  evidence. Apply `duplicate` and cite the issue number.
- A **related issue** shares a component or context but is a distinct problem.
  Mention it without applying `duplicate`.

Include no more than two useful matches. Never classify an issue as a
duplicate based only on similar title words.

## 5. Assess next steps

Suggest one focused next step when the evidence supports it.

## 6. Report

Post one concise comment:

```markdown
## Triage report

[One or two sentences summarizing the issue and recommended routing.]

| Assessment | Result | Reasoning |
|---|---|---|
| Type | [type or unset] | [brief evidence] |
| Priority | [priority or unset] | [brief evidence] |

### Similar issues
- #[number] — [duplicate or related, with a brief reason]

### Next step
[One focused action or the specific information still needed.]
```

Omit "Similar issues" when there are no useful matches. Include no more than two
matches. For an incomplete issue, replace the table with concise clarifying
questions. Keep the report under 250 words, factual, respectful, and easy to
scan.
