# Pre-work checklist

Complete this checklist before the workshop. The primary path uses a personal
GitHub.com account and a Codespace created from your copy of the template.

## Account requirements

- [ ] I am signed in with a personal GitHub.com account.
- [ ] I can create a repository in my personal namespace.
- [ ] My account can create a GitHub Codespace.
- [ ] My account has Copilot Pro, Pro+, Max, or an eligible
  Business/Enterprise seat with available AI Credits.
- [ ] I can create a fine-grained personal access token.

Enterprise Managed User accounts cannot copy this public template or create a
personal Codespace for it. If you only have a managed account, arrange to pair
with another attendee.

Copilot Free and other Auto-only plans are not currently compatible with the
released PAT-backed gh-aw workflow path. A direct Copilot CLI prompt may work
while the same PAT still receives `400 The requested model is not supported`
inside an agentic workflow. If you use Copilot Free, arrange to pair with a
participant who has compatible access.

## Create the workshop repository

1. Select **Use this template → Create a new repository**.
2. Create a public or private repository under your personal account.
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

The workflow uses `model: auto` and the Copilot CLI version supplied by the
installed gh-aw release.

If inference still fails, test the same PAT directly without placing it in
shell history:

```shell
read -rsp "Copilot PAT: " COPILOT_GITHUB_TOKEN; echo
export COPILOT_GITHUB_TOKEN
copilot -p "Reply with exactly OK." --model auto --allow-all-tools --no-ask-user
unset COPILOT_GITHUB_TOKEN
```

The workshop prerequisite remains a paid individual plan or eligible
organization seat.

## Run the readiness check

```shell
./scripts/workshop-readiness.sh
```

- [ ] GitHub CLI authentication succeeds.
- [ ] gh-aw version 0.88.8 is installed.
- [ ] The Copilot repository secret is detected.
- [ ] Workshop labels are created.
- [ ] The duplicate fixture is created without starting the AI agent.
- [ ] The starter workflow compiles.

Do not complete the TODOs before the workshop. Do not use a production
repository.

The workflow permits all issue authors through the framework's role check but
adds an owner-only expression. Only an event performed by the personal
repository owner can start inference, so a public repository does not expose
the owner's Copilot credits to arbitrary issue authors.

The workshop standardizes on the default GitHub Copilot engine with a
fine-grained personal access token stored as the `COPILOT_GITHUB_TOKEN`
repository secret. The token must be owned by your user account and have
**Account permissions → Copilot Requests: Read**. Do not add
`copilot-requests: write` to the workshop workflow; that organization-billed
authentication path is intentionally outside the participant setup.

Create the token:
<https://github.com/settings/personal-access-tokens/new?name=COPILOT_GITHUB_TOKEN&description=GitHub+Agentic+Workflows+-+Copilot+engine+authentication&user_copilot_requests=read>
