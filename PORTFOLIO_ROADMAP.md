# Portfolio Roadmap

## Status Board

| Area | Repository | Automation | Endpoint | Local status | GitHub | Railway |
| --- | --- | --- | --- | --- | --- | --- |
| Intake | [collision-phone-intake-api](https://github.com/dkdejesus/collision-phone-intake-api) | Vapi phone intake automation | `POST /v1/webhooks/vapi/intake-call`; `POST /v1/phone-intakes` | Ready | Published | Online |
| Website intake | [collision-intake-api](https://github.com/dkdejesus/collision-intake-api) | Current website intake workflow | `POST /v1/intakes`; `POST /v1/intakes/assess` | Ready | Published | Online |
| Intake | [collision-appointment-scheduler-api](https://github.com/dkdejesus/collision-appointment-scheduler-api) | Appointment scheduler | `POST /v1/appointments` | Ready | Published | Online |
| Intake | [collision-vin-decoder-api](https://github.com/dkdejesus/collision-vin-decoder-api) | VIN decoder | `POST /v1/vin-decodes` | Ready | Published | Online |
| Estimating | [collision-estimate-parser-api](https://github.com/dkdejesus/collision-estimate-parser-api) | Estimate parser | `POST /v1/estimate-parses` | Ready | Published | Online |
| Closeout | [collision-repair-order-summarizer-api](https://github.com/dkdejesus/collision-repair-order-summarizer-api) | Repair-order summarizer | `POST /v1/repair-order-summaries` | Ready | Published | Online |
| Insurance | [collision-supplement-evidence-api](https://github.com/dkdejesus/collision-supplement-evidence-api) | Supplement evidence generator | `POST /v1/supplement-evidence` | Ready | Published | Online |
| Communications | [collision-customer-status-update-api](https://github.com/dkdejesus/collision-customer-status-update-api) | Customer status update agent | `POST /v1/status-updates` | Ready | Published | Online |
| Parts | [collision-parts-eta-tracker-api](https://github.com/dkdejesus/collision-parts-eta-tracker-api) | Parts ETA tracker | `POST /v1/parts-eta` | Ready | Published | Online |
| Insurance | [collision-insurance-email-drafting-api](https://github.com/dkdejesus/collision-insurance-email-drafting-api) | Insurance email drafting | `POST /v1/insurance-emails` | Ready | Published | Online |
| Production | [collision-daily-production-dashboard-api](https://github.com/dkdejesus/collision-daily-production-dashboard-api) | Daily production dashboard | `POST /v1/production-dashboards` | Ready | Published | Online |
| Production | [collision-technician-work-queue-api](https://github.com/dkdejesus/collision-technician-work-queue-api) | Technician work queue | `POST /v1/technician-work` | Ready | Published | Deferred |
| Delivery | [collision-delivery-readiness-api](https://github.com/dkdejesus/collision-delivery-readiness-api) | Delivery readiness checker | `POST /v1/delivery-readiness` | Ready | Published | Deferred |

## Launch Milestones

| Milestone | Status | Evidence |
|---|---|---|
| 12 local repos created | Complete | Local Git repos under `/Users/daviddejesus/Projects` |
| README case studies drafted | Complete | Each repo README |
| Synthetic sample data present | Complete | `sample_data/sample_request.json` |
| Screenshots captured | Complete | `docs/assets/swagger-docs.png`, `docs/assets/api-response.png` |
| Local validation script | Complete | `scripts/validate_all.sh` |
| GitHub remotes | Complete | All 12 service repos and the master repo are published |
| Railway deployments | Complete | 10 active workflow services online; technician work queue and delivery readiness intentionally deferred |
| Vapi phone intake automation | Complete | Vapi end-of-call reports create `collision-phone-intake-api` records |
| Website intake workflow | Complete | `collision-intake-api` remains active for current website leads |
| Live demo links added | Partial | Known phone and website intake URLs are documented; remaining service URLs should be pasted after final verification |

## Current Automation Boundary

The deployed APIs are the processing layer. Full automation occurs when a trigger sends real workflow input into an API and routes the saved output to a review/action surface.

Current proven automation:

```text
Customer phone call
-> Vapi recording/transcript
-> collision-phone-intake-api webhook
-> saved structured phone intake
-> staff review
```

Current website intake lane:

```text
Current website lead
-> collision-intake-api
-> saved intake assessment
-> staff review
```

Next production layer:

```text
Private Precision Ops Console
-> review saved API outputs
-> approve drafts and next actions
-> copy or integrate into CCC ONE, Gmail, Calendar, and production workflows
```

## Recommended Public Narrative

This portfolio shows a practical FDE-style path: understand the business, define workflows and objects, identify decisions, draw product boundaries, then ship small deployable services with typed APIs, observability, tests, Docker, and public-safe examples.
