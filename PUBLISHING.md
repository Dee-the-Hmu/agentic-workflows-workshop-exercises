# Publish the workshop template

Use these steps after uploading this folder to your GitHub.com namespace.

1. Create a public repository from this folder.
2. Open **Settings → General** and select **Template repository**.
3. Confirm GitHub Actions and Issues are enabled.
4. Create a clean repository from the template under a separate personal
   account.
5. Launch a Codespace from the copied repository.
6. Complete [PREWORK.md](PREWORK.md) exactly as an attendee would.
7. Run all three scenarios and record their AI Credits:

   ```shell
   gh aw logs issue-triage --last 5 --json
   ```

8. If successful runs approach the configured `max-ai-credits` limit, raise the
   limit before the event and recompile the workflow.
9. Replace the representative files in `fallback-outputs/` with output captured
   during the rehearsal.
10. Keep one facilitator-owned repository and Codespace ready for a live demo.

## Suggested attendee instructions

1. Select **Use this template → Create a new repository**.
2. Create the repository under a personal GitHub.com account.
3. Open **Code → Codespaces → Create codespace on main**.
4. Complete `PREWORK.md`.
5. Run `./scripts/workshop-readiness.sh`.

Do not instruct attendees to open a Codespace directly against the original
template. Each pair needs its own repository for secrets, workflow runs, issues,
and generated files.
