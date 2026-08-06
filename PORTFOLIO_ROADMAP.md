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

## Automation Reference Manual

Use this roadmap as the implementation reference for turning deployed APIs into real Precision Auto Body workflow automation. The core rule:

```text
An API is not the full automation.
Full automation = trigger + API processing + saved record + human review + approved business action.
```

### Standard Automation Loop

| Step | What happens | Implementation notes |
|---|---|---|
| 1. Trigger | A real business event starts the workflow | Vapi call ended, website lead submitted, Gmail received, Google Sheet row updated, daily schedule |
| 2. Capture | The raw artifact is collected | Transcript, form payload, estimate text, RO notes, parts email, production board |
| 3. Normalize | Input is mapped into a typed API request | Keep unknowns as `To Validate`; preserve source IDs and timestamps |
| 4. Process | The workflow API returns structured output | Drafts, checklists, risk flags, missing fields, next actions |
| 5. Persist | Store request, output, model/fallback, and request ID | SQLite per service now; shared Postgres later |
| 6. Review | Staff reviews before action | Required for safety, customer, insurance, repair, and financial outputs |
| 7. Act | Staff approves, edits, copies, drafts, schedules, or escalates | Start with copy/draft workflows before direct writes |
| 8. Update systems | Approved information moves to operating systems | CCC ONE, Gmail, Calendar, QuickBooks, production board |
| 9. Measure | Track whether the automation is valuable | Time saved, missing fields caught, callbacks avoided, blockers reduced |

### Workflow Implementation Map

| Workflow | Real-world trigger | Current API | Output to review | Next implementation step |
|---|---|---|---|---|
| Phone intake | Vapi end-of-call report | `collision-phone-intake-api` | Urgency, drivability caution, missing fields, next steps | Improve Precision-specific intake checklist and CCC-ready summary |
| Website intake | Website lead submission | `collision-intake-api` | Intake assessment and next steps | Route website leads into same review queue as Vapi intakes |
| Appointment scheduling | Intake marked ready to schedule | `collision-appointment-scheduler-api` | Appointment readiness and confirmation draft | Create Google Calendar draft after staff approval |
| VIN support | VIN captured from intake/estimate | `collision-vin-decoder-api` | Normalized vehicle profile and warnings | Trigger from intake and estimate workflows |
| Estimate review | Estimate text/PDF export available | `collision-estimate-parser-api` | Totals, missing fields, risk flags, review checklist | Support real estimate text export fixtures |
| RO summary | RO notes or repair status export available | `collision-repair-order-summarizer-api` | Internal summary, customer-safe summary, blockers | Add RO note template and manager review flow |
| Supplement evidence | Supplement candidate found | `collision-supplement-evidence-api` | Narrative draft, evidence checklist, readiness | Connect to estimate review and photo/procedure placeholders |
| Customer updates | Repair stage or blocker changes | `collision-customer-status-update-api` | Customer-safe message and approval flags | Build staff review screen with approve/copy action |
| Parts ETA | Vendor email or parts board changes | `collision-parts-eta-tracker-api` | Part status board, ETA risk, follow-up draft | Add Gmail/CSV trigger for vendor updates |
| Insurance email | Claim/supplement follow-up needed | `collision-insurance-email-drafting-api` | Adjuster email draft and escalation reason | Create Gmail draft, never auto-send |
| Daily dashboard | Daily schedule or production sheet update | `collision-daily-production-dashboard-api` | WIP summary, at-risk jobs, manager priorities | Start with Google Sheet/CSV as production source |
| Technician work queue | Production manager prioritizes work | `collision-technician-work-queue-api` | Task queue and blocker reasons | Deferred until production dashboard data is reliable |
| Delivery readiness | Job reaches delivery candidate stage | `collision-delivery-readiness-api` | QC/payment/docs/pickup gate status | Deferred until delivery workflow is standardized |

### Integration Policy

Start with low-risk handoffs and add deeper system writes only after staff trust the review loop.

| Integration level | Pattern | When to use |
|---|---|---|
| Manual review | Staff opens Ops Console and copies approved output | First production pilots |
| Draft creation | System creates Gmail/Calendar drafts but does not send | Customer, insurance, and scheduling workflows |
| File or sheet import | API reads CSV/Google Sheet exports | Production dashboard, estimate review, parts tracking |
| Controlled system write | Approved output writes into a business system | After audit logs, roles, and rollback path exist |
| Direct multi-system automation | Systems trigger each other automatically | Only after workflows are stable and measured |

### Production Readiness Checklist

Before a workflow is considered production-ready, confirm:

- Trigger is reliable and documented.
- API input schema matches the real business artifact.
- Unknowns are marked `To Validate`.
- Output has a clear staff review owner.
- Customer-facing, insurer-facing, financial, repair, and safety outputs require human approval.
- Records persist with request ID, source ID, model/fallback, and timestamp.
- Staff can review output without using raw JSON or Swagger.
- A rollback/manual fallback exists.
- Metrics are defined for time saved, errors avoided, or rework reduced.

## Recommended Public Narrative

This portfolio shows a practical FDE-style path: understand the business, define workflows and objects, identify decisions, draw product boundaries, then ship small deployable services with typed APIs, observability, tests, Docker, and public-safe examples.
