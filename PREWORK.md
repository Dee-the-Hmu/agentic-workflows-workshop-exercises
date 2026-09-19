# Pre-work checklist

Complete this checklist before the workshop. The primary path uses a personal
GitHub.com account and a Codespace created from your copy of the template.

## Account requirements

- [ ] I am signed in with a personal GitHub.com account.
- [ ] I can create a public or private repository in my personal namespace.
- [ ] My account can create a GitHub Codespace.
- [ ] My account has an active Copilot plan with available AI Credits.
- [ ] I can create a fine-grained personal access token.

Enterprise Managed User accounts cannot copy this public template or create a
personal Codespace for it. If you only have a managed account, arrange to pair
with another attendee.

## Create the workshop repository

1. Select **Use this template → Create a new repository**.
2. Create the repository under your personal account.
3. Open **Code → Codespaces → Create codespace on main**.
4. Wait for the terminal to report that the Codespace tools are installed.

## Configure Copilot inference

Create a fine-grained token owned by your personal account:

<https://github.com/settings/personal-access-tokens/new?name=COPILOT_GITHUB_TOKEN&description=GitHub+Agentic+Workflows+-+Copilot+engine+authentication&user_copilot_requests=read>

Confirm **Account permissions → Copilot Requests: Read**, generate the token,
then run this inside the Codespace:

```shell
gh aw secrets bootstrap --engine copilot
```

Store the token as the repository Actions secret `COPILOT_GITHUB_TOKEN`. This is
an Actions secret, not a Codespaces secret.

## Run the readiness check

```shell
./scripts/workshop-readiness.sh
```

- [ ] GitHub CLI authentication succeeds.
- [ ] gh-aw version 0.88.7 is installed.
- [ ] The Copilot repository secret is detected.
- [ ] Workshop labels are created.
- [ ] The duplicate fixture is created without starting the AI agent.
- [ ] The starter workflow compiles.

Do not complete the TODOs before the workshop. Do not use a production
repository.

The workshop standardizes on the default GitHub Copilot engine with a
fine-grained personal access token stored as the `COPILOT_GITHUB_TOKEN`
repository secret. The token must be owned by your user account and have
**Account permissions → Copilot Requests: Read**. Do not add
`copilot-requests: write` to the workshop workflow; that organization-billed
authentication path is intentionally outside the participant setup.

Create the token:
<https://github.com/settings/personal-access-tokens/new?name=COPILOT_GITHUB_TOKEN&description=GitHub+Agentic+Workflows+-+Copilot+engine+authentication&user_copilot_requests=read>
