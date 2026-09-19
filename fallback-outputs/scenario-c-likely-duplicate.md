# Scenario C: likely duplicate

## Representative safe outputs

- Add label: `bug`
- Add label: `duplicate`
- Add one triage comment
- Leave priority unset

## Representative maintainer comment

### Summary

The issue reports that GitHub CLI authentication is not retained after a
successful browser flow. The environment and keyring error match the previously
seeded issue titled "CLI login loops after the browser authorization succeeds."

### Classification

- **Type:** Bug.
- **Priority:** Unset because neither issue establishes impact beyond the
  affected authentication flow.

### Similar issue

- The seeded duplicate-source issue describes the same browser-login loop on
  macOS 15.6 with GitHub CLI 2.98.0, a corporate proxy, and the error
  `failed to write token to keyring: user interaction is not allowed`.

### Next step

Confirm that both reports share the same keyring failure, then continue
investigation on the earlier issue.

## Evaluation observations

- The duplicate decision uses symptoms, environment, workflow, and exact error,
  not title similarity alone.
- The comment should identify the actual issue number in a live repository.
- If the agent cannot establish the match, mentioning the issue as related is
  preferable to applying `duplicate`.
