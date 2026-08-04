# GitHub Publishing Checklist

## Current State

- GitHub CLI is installed.
- Current `gh` token is invalid.
- No automation repo has an `origin` remote yet.
- Publish target: public repositories.

## One-Time Authentication

```bash
gh auth login -h github.com
gh auth status
```

## Publish Commands

```bash
gh auth login -h github.com

gh repo create collision-phone-intake-api --public --source /Users/daviddejesus/Projects/collision-phone-intake-api --remote origin --push
gh repo create collision-appointment-scheduler-api --public --source /Users/daviddejesus/Projects/collision-appointment-scheduler-api --remote origin --push
gh repo create collision-vin-decoder-api --public --source /Users/daviddejesus/Projects/collision-vin-decoder-api --remote origin --push
gh repo create collision-estimate-parser-api --public --source /Users/daviddejesus/Projects/collision-estimate-parser-api --remote origin --push
gh repo create collision-repair-order-summarizer-api --public --source /Users/daviddejesus/Projects/collision-repair-order-summarizer-api --remote origin --push
gh repo create collision-supplement-evidence-api --public --source /Users/daviddejesus/Projects/collision-supplement-evidence-api --remote origin --push
gh repo create collision-customer-status-update-api --public --source /Users/daviddejesus/Projects/collision-customer-status-update-api --remote origin --push
gh repo create collision-parts-eta-tracker-api --public --source /Users/daviddejesus/Projects/collision-parts-eta-tracker-api --remote origin --push
gh repo create collision-technician-work-queue-api --public --source /Users/daviddejesus/Projects/collision-technician-work-queue-api --remote origin --push
gh repo create collision-delivery-readiness-api --public --source /Users/daviddejesus/Projects/collision-delivery-readiness-api --remote origin --push
gh repo create collision-insurance-email-drafting-api --public --source /Users/daviddejesus/Projects/collision-insurance-email-drafting-api --remote origin --push
gh repo create collision-daily-production-dashboard-api --public --source /Users/daviddejesus/Projects/collision-daily-production-dashboard-api --remote origin --push
gh repo create precision-auto-body-automation-portfolio --public --source /Users/daviddejesus/Projects/precision-auto-body-automation-portfolio --remote origin --push
```

## Public-Readiness Check

Before publishing each repo:

- `git status --short` is empty.
- `.env`, local databases, caches, and real data are untracked.
- README screenshots render locally.
- README states synthetic-data-only policy.
- `sample_data/sample_request.json` contains no real customer, VIN, claim, phone, or email data.
