# Facilitator guide

## Recommended delivery model

- Publish this folder as a GitHub template repository before the event.
- Send `PREWORK.md` at least one week before the workshop.
- Ask attendees to create their own repository from the template and launch its
  Codespace before the event.
- Require attendees to complete the pre-work verification.
- Keep one facilitator-owned fallback repository available for demonstration.
- Encourage pairs or tables to use one working environment when setup fails.
- Treat Copilot Free and other Auto-only plans as evaluation-only participants;
  pair them with a compatible Copilot Pro+ or organization-seat environment.

## Before publishing

1. Follow `PUBLISHING.md` with a separate personal GitHub.com account.
2. Create a repository from the template and launch a new Codespace.
3. Run `./scripts/workshop-readiness.sh`.
4. Confirm the workflow uses `model: auto`.
5. Confirm the fixture issue is skipped and scenario A proceeds past
   pre-activation. The root-level `if:` checks the triggering issue's labels;
   `skip-if-match` must not be used because it searches the repository.
6. Confirm `on.roles: all`, the `WORKSHOP_OPERATOR` variable, and the operator
   condition are present. Test personal and organization-owned copies. In a
   public rehearsal copy, verify that an unconfigured user cannot start
   inference.
7. Run all scenarios and inspect AI Credits with `gh aw logs` and `gh aw audit`.
8. Adjust `max-ai-credits` only if a successful rehearsal approaches the cap.
9. Reset `.github/workflows/issue-triage.md` to the TODO version.
10. Recompile so the committed lock file matches the starter.
11. Test each script mode in a disposable repository:
   - `./scripts/create-test-issues.sh --seed-duplicate-source`
   - `./scripts/create-test-issues.sh A`
   - `./scripts/create-test-issues.sh B`
   - `./scripts/create-test-issues.sh C`
12. Run `gh aw secrets bootstrap --non-interactive --engine copilot` and confirm
   the participant authentication path is ready.

## 90-minute run of show

| Time | Activity |
|---|---|
| 0–5 | Welcome, outcomes, readiness check |
| 5–17 | Agentic workflow foundations |
| 17–27 | Issue-triage contract and quality bar |
| 27–32 | Starter repository walkthrough |
| 32–57 | Customize and compile |
| 57–62 | Troubleshooting buffer and checkpoint |
| 62–74 | Run one assigned scenario |
| 74–82 | Evaluate and propose one evidence-based refinement |
| 82–87 | Share observations and discuss human gates |
| 87–90 | Resources and close |

## Distributed test assignments

- Assign one third of the room scenario A.
- Assign one third scenario B.
- Assign one third scenario C.
- Have each group report:
  - The labels or type applied
  - The strongest evidence used
  - The least certain decision
  - One change they would make

## Fallbacks

If authentication or installation fails:

- Pair the attendee with a working environment.
- Use the facilitator repository and ask the attendee to evaluate an output.
- If most of the room is blocked, demonstrate one live run from the facilitator
  repository and continue with the fallback outputs.

If an attendee has Copilot Free:

- Do not spend workshop time trying alternate model names.
- Explain that direct Copilot CLI may work while the current PAT-backed gh-aw
  proxy path returns `400 The requested model is not supported`.
- Pair the attendee or continue with the matching fallback output.

If Actions or inference is slow:

- Use the matching file in `fallback-outputs/`.
- Continue with the rubric and refinement exercise.

The fallback files are representative workshop outputs, not evidence of a live
run in the attendee's repository. Ask participants to evaluate them exactly as
they would evaluate a live result.

If compilation fails broadly:

- Reveal `solutions/issue-triage.complete.md`.
- Copy it into `.github/workflows/issue-triage.md`.
- Compile once as a group and continue to evaluation.
