# Portfolio Roadmap

## Status Board

| Area | Repository | Automation | Endpoint | Local status | GitHub | Railway |
| --- | --- | --- | --- | --- | --- | --- |
| Intake | [collision-phone-intake-api](https://github.com/dkdejesus/collision-phone-intake-api) | Phone intake | `POST /v1/phone-intakes` | Ready | Published | Pending |
| Intake | [collision-appointment-scheduler-api](https://github.com/dkdejesus/collision-appointment-scheduler-api) | Appointment scheduler | `POST /v1/appointments` | Ready | Published | Pending |
| Intake | [collision-vin-decoder-api](https://github.com/dkdejesus/collision-vin-decoder-api) | VIN decoder | `POST /v1/vin-decodes` | Ready | Published | Pending |
| Estimating | [collision-estimate-parser-api](https://github.com/dkdejesus/collision-estimate-parser-api) | Estimate parser | `POST /v1/estimate-parses` | Ready | Published | Pending |
| Closeout | [collision-repair-order-summarizer-api](https://github.com/dkdejesus/collision-repair-order-summarizer-api) | Repair-order summarizer | `POST /v1/repair-order-summaries` | Ready | Published | Pending |
| Insurance | [collision-supplement-evidence-api](https://github.com/dkdejesus/collision-supplement-evidence-api) | Supplement evidence generator | `POST /v1/supplement-evidence` | Ready | Published | Pending |
| Communications | [collision-customer-status-update-api](https://github.com/dkdejesus/collision-customer-status-update-api) | Customer status update agent | `POST /v1/status-updates` | Ready | Published | Pending |
| Parts | [collision-parts-eta-tracker-api](https://github.com/dkdejesus/collision-parts-eta-tracker-api) | Parts ETA tracker | `POST /v1/parts-eta` | Ready | Published | Pending |
| Production | [collision-technician-work-queue-api](https://github.com/dkdejesus/collision-technician-work-queue-api) | Technician work queue | `POST /v1/technician-work` | Ready | Published | Pending |
| Delivery | [collision-delivery-readiness-api](https://github.com/dkdejesus/collision-delivery-readiness-api) | Delivery readiness checker | `POST /v1/delivery-readiness` | Ready | Published | Pending |
| Insurance | [collision-insurance-email-drafting-api](https://github.com/dkdejesus/collision-insurance-email-drafting-api) | Insurance email drafting | `POST /v1/insurance-emails` | Ready | Published | Pending |
| Production | [collision-daily-production-dashboard-api](https://github.com/dkdejesus/collision-daily-production-dashboard-api) | Daily production dashboard | `POST /v1/production-dashboards` | Ready | Published | Pending |

## Launch Milestones

| Milestone | Status | Evidence |
|---|---|---|
| 12 local repos created | Complete | Local Git repos under `/Users/daviddejesus/Projects` |
| README case studies drafted | Complete | Each repo README |
| Synthetic sample data present | Complete | `sample_data/sample_request.json` |
| Screenshots captured | Complete | `docs/assets/swagger-docs.png`, `docs/assets/api-response.png` |
| Local validation script | Complete | `scripts/validate_all.sh` |
| GitHub remotes | Complete | All 12 service repos and the master repo are published |
| Railway deployments | Pending | Use Railway dashboard from GitHub repos |
| Live demo links added | Pending | Update each README and this roadmap after Railway deploy |

## Recommended Public Narrative

This portfolio shows a practical FDE-style path: understand the business, define workflows and objects, identify decisions, draw product boundaries, then ship small deployable services with typed APIs, observability, tests, Docker, and public-safe examples.
