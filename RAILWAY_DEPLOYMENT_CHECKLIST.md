# Railway Deployment Checklist

Railway CLI is not installed locally, so use the Railway dashboard after GitHub publishing.

## Repeat For Each Repository

1. Open Railway.
2. Create a new project from the GitHub repo.
3. Confirm Railway uses the repo `Dockerfile`.
4. Add service variables:

```text
APP_ENV=production
LOG_LEVEL=INFO
OPENAI_API_KEY=<your key>
OPENAI_MODEL=gpt-5-mini
REQUEST_TIMEOUT_SECONDS=30
DATABASE_PATH=/data/<service>.db
```

5. Add a volume mounted at `/data`.
6. Confirm `/health` passes.
7. Generate a public domain.
8. Test `/docs`.
9. Run one sample `POST` from `sample_data/sample_request.json`.
10. Paste the live URLs into that repo README and `PORTFOLIO_ROADMAP.md`.

## Deployment Tracker

| Repository | Health | Docs | Sample POST | Status |
|---|---|---|---|---|
| collision-phone-intake-api | `/health` | `/docs` | `POST /v1/phone-intakes` | Pending |
| collision-appointment-scheduler-api | `/health` | `/docs` | `POST /v1/appointments` | Pending |
| collision-vin-decoder-api | `/health` | `/docs` | `POST /v1/vin-decodes` | Pending |
| collision-estimate-parser-api | `/health` | `/docs` | `POST /v1/estimate-parses` | Pending |
| collision-repair-order-summarizer-api | `/health` | `/docs` | `POST /v1/repair-order-summaries` | Pending |
| collision-supplement-evidence-api | `/health` | `/docs` | `POST /v1/supplement-evidence` | Pending |
| collision-customer-status-update-api | `/health` | `/docs` | `POST /v1/status-updates` | Pending |
| collision-parts-eta-tracker-api | `/health` | `/docs` | `POST /v1/parts-eta` | Pending |
| collision-technician-work-queue-api | `/health` | `/docs` | `POST /v1/technician-work` | Pending |
| collision-delivery-readiness-api | `/health` | `/docs` | `POST /v1/delivery-readiness` | Pending |
| collision-insurance-email-drafting-api | `/health` | `/docs` | `POST /v1/insurance-emails` | Pending |
| collision-daily-production-dashboard-api | `/health` | `/docs` | `POST /v1/production-dashboards` | Pending |
