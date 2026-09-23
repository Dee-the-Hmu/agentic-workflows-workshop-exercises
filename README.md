# AI issue triage workshop

This repository is the hands-on starter for the **Build an AI-powered issue triage workflow** workshop.

You will customize a GitHub Agentic Workflow that evaluates new issues, applies controlled metadata, identifies likely duplicates, and posts a concise maintainer-facing report.

## Workshop objectives

By the end of the exercise, you will:

1. Configure a bounded set of safe outputs.
2. Add repository-specific completeness and priority criteria.
3. Define a predictable triage report.
4. Compile and run the workflow.
5. Evaluate one assigned test case and make one evidence-based improvement.

## Start in GitHub Codespaces

1. Select **Use this template → Create a new repository**.
2. Create a public or private repository under your personal GitHub.com account
   or an organization where you can administer Actions secrets and variables.
3. In your new repository, select **Code → Codespaces → Create codespace on
   main**.
4. Complete [PREWORK.md](PREWORK.md).
5. Run:

   ```shell
   ./scripts/workshop-readiness.sh
   ```

Do not complete the TODOs in the starter workflow before the workshop.

If you cannot administer the repository, use Codespaces, or access Copilot
inference, pair with someone who has a working environment. The facilitator can
also demonstrate the live run while you evaluate the supplied fallback output.

Copilot Free and other plans restricted to Auto-only model access are not
currently compatible with the released PAT-backed gh-aw workflow path. Use
Copilot Pro, Pro+, Max, or an eligible Business/Enterprise seat for the live
run. Attendees with Copilot Free should pair or use the fallback output.

The template uses `on.roles: all` to avoid inconsistent membership detection,
then restricts execution to either the personal repository owner or the
repository variable `WORKSHOP_OPERATOR`. The readiness script sets that variable
to the signed-in user. In a public repository, issues opened by anyone else
produce no inference run. Each pair should use the configured operator's
Codespace and have that operator create the assigned issue.

## Repository map

| Path | Purpose |
|---|---|
| `.github/workflows/issue-triage.md` | Starter workflow containing three workshop TODOs |
| `.devcontainer/` | Reproducible Codespaces environment with gh-aw installed |
| `solutions/issue-triage.complete.md` | Reference solution to use only after the exercise |
| `test-cases/` | Prepared issue bodies for distributed testing |
| `fallback-outputs/` | Sample results for continuing when Actions or inference is delayed |
| `docs/evaluation-rubric.md` | Rubric for reviewing workflow output |
| `scripts/create-labels.sh` | Creates the labels allowed by the workflow |
| `scripts/create-test-issues.sh` | Creates only the assigned test scenario |
| `scripts/workshop-readiness.sh` | Verifies auth, secret, labels, fixture, and compilation |
| `FACILITATOR.md` | Instructions for publishing and running the workshop |

## Exercise 1: customize and compile

Open `.github/workflows/issue-triage.md` and complete the three TODOs:

1. Finish the safe-output label allowlist.
2. Add the missing completeness and priority rules.
3. Complete the maintainer-facing report contract.

Then compile and inspect the changes:

```shell
gh aw compile
git diff -- .github/workflows/issue-triage.md \
  .github/workflows/issue-triage.lock.yml
```

Commit and push both files to the default branch:

```shell
git add .github/workflows/issue-triage.md \
  .github/workflows/issue-triage.lock.yml
git commit -m "Customize issue triage workflow"
git push
```

## Exercise 2: run one assigned test

The facilitator will assign your pair or table one scenario:

- **A:** Complete bug
- **B:** Incomplete bug
- **C:** Likely duplicate

Create only the scenario assigned to your table:

```shell
./scripts/create-test-issues.sh A
# or B / C
```

Scenario C uses a duplicate source that should already have been created during
pre-work.

Watch the run:

```shell
gh aw list
gh aw logs
```

If needed, inspect a specific run:

```shell
gh aw audit RUN-ID
```

## Exercise 3: evaluate and refine

Use [docs/evaluation-rubric.md](docs/evaluation-rubric.md) to score the result.

Use the weakest rubric dimension to propose one change to a workflow variable,
such as:

- A completeness criterion
- A priority definition
- The duplicate evidence threshold
- The maximum number of related issues
- The report length or structure

Write down the exact change and the behavior you expect it to improve. A second
compile and run is an optional extension after the workshop; it is not required
inside the 90-minute session.

## Important operating constraints

- Use this only in a test repository.
- Use one repository and one live workflow run per pair.
- The agent analyzes with read-only permissions.
- Repository writes occur only through declared safe outputs.
- Every allowed label must already exist in the repository.
- Prefer an unset classification over an unsupported guess.
- The Copilot engine uses `model: auto` with explicit per-run, per-day, turn,
  and timeout limits.
- Copilot Free may work in Copilot CLI directly but still fail in the
  PAT-backed Agentic Workflows proxy path.

## References

- <https://github.github.com/gh-aw/gallery/ai-issue-triage/>
- <https://gh.io/gh-aw-quickstart>
- <https://docs.github.com/en/enterprise-cloud@latest/copilot/concepts/agents/about-github-agentic-workflows>
