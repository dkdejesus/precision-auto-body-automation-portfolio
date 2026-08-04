# Portfolio Roadmap

## Status Board

| Area | Repository | Automation | Endpoint | Local status | GitHub | Railway |
|---|---|---|---|---|---|---|
| Intake | [collision-phone-intake-api](../collision-phone-intake-api) | Phone intake | `POST /v1/phone-intakes` | Ready | Pending | Pending |
| Intake | [collision-appointment-scheduler-api](../collision-appointment-scheduler-api) | Appointment scheduler | `POST /v1/appointments` | Ready | Pending | Pending |
| Intake | [collision-vin-decoder-api](../collision-vin-decoder-api) | VIN decoder | `POST /v1/vin-decodes` | Ready | Pending | Pending |
| Estimating | [collision-estimate-parser-api](../collision-estimate-parser-api) | Estimate parser | `POST /v1/estimate-parses` | Ready | Pending | Pending |
| Closeout | [collision-repair-order-summarizer-api](../collision-repair-order-summarizer-api) | Repair-order summarizer | `POST /v1/repair-order-summaries` | Ready | Pending | Pending |
| Insurance | [collision-supplement-evidence-api](../collision-supplement-evidence-api) | Supplement evidence generator | `POST /v1/supplement-evidence` | Ready | Pending | Pending |
| Communications | [collision-customer-status-update-api](../collision-customer-status-update-api) | Customer status update agent | `POST /v1/status-updates` | Ready | Pending | Pending |
| Parts | [collision-parts-eta-tracker-api](../collision-parts-eta-tracker-api) | Parts ETA tracker | `POST /v1/parts-eta` | Ready | Pending | Pending |
| Production | [collision-technician-work-queue-api](../collision-technician-work-queue-api) | Technician work queue | `POST /v1/technician-work` | Ready | Pending | Pending |
| Delivery | [collision-delivery-readiness-api](../collision-delivery-readiness-api) | Delivery readiness checker | `POST /v1/delivery-readiness` | Ready | Pending | Pending |
| Insurance | [collision-insurance-email-drafting-api](../collision-insurance-email-drafting-api) | Insurance email drafting | `POST /v1/insurance-emails` | Ready | Pending | Pending |
| Production | [collision-daily-production-dashboard-api](../collision-daily-production-dashboard-api) | Daily production dashboard | `POST /v1/production-dashboards` | Ready | Pending | Pending |

## Launch Milestones

| Milestone | Status | Evidence |
|---|---|---|
| 12 local repos created | Complete | Local Git repos under `/Users/daviddejesus/Projects` |
| README case studies drafted | Complete | Each repo README |
| Synthetic sample data present | Complete | `sample_data/sample_request.json` |
| Screenshots captured | Complete | `docs/assets/swagger-docs.png`, `docs/assets/api-response.png` |
| Local validation script | Complete | `scripts/validate_all.sh` |
| GitHub remotes | Pending | Requires `gh auth login -h github.com` |
| Railway deployments | Pending | Use Railway dashboard from GitHub repos |
| Live demo links added | Pending | Update each README and this roadmap after deploy |

## Recommended Public Narrative

This portfolio shows a practical FDE-style path: understand the business, define workflows and objects, identify decisions, draw product boundaries, then ship small deployable services with typed APIs, observability, tests, Docker, and public-safe examples.
