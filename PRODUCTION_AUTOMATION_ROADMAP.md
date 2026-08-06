# Production Automation Roadmap

This document defines the production path for the Precision Auto Body automation suite. The current deployed APIs are workflow engines. Production requires orchestration, review, approval, shared storage, integrations, and staff-facing UI.

## Stage 0: Foundation Completed

Current state:

- 10 active Railway workflow services are online.
- `collision-phone-intake-api` receives Vapi `end-of-call-report` webhooks and creates saved phone intake records.
- `collision-intake-api` remains the current website / lead workflow intake service.
- 2 workflow services are deferred: technician work queue and delivery readiness.
- Public repos are synthetic-safe portfolio artifacts.
- The master portfolio repo is private and acts as the production control center.

Production interpretation:

```text
Automation engines exist.
The production operating system still needs orchestration, staff review, approval, shared data, and integrations.
```

## Stage 1: Intake Capture Layer

Goal: every inbound lead or call becomes a structured intake record automatically or semi-automatically.

Inputs:

- Vapi phone calls
- current website leads
- manual staff entry
- future email leads

Workflow:

```text
Vapi call transcript
-> collision-phone-intake-api
-> phone intake record
-> staff review queue

Website lead
-> collision-intake-api
-> website intake record
-> staff review queue

Manual staff entry
-> intake form
-> staff review queue
```

Required intake statuses:

```text
New
Needs Review
Missing Info
Ready To Schedule
Scheduled
Archived
```

Required fields:

- source: `vapi`, `website`, `manual`, `email`
- source record ID
- customer / caller metadata
- vehicle metadata
- transcript or intake notes
- missing fields
- urgency
- drivability caution
- next staff action
- human review required

## Stage 2: Internal Ops Console

Goal: staff should not use Swagger, raw JSON, or individual Railway URLs.

Build a private application:

```text
precision-auto-body-ops-console
```

First screens:

- Phone Intake Inbox
- Website Lead Inbox
- Intake Detail
- Review / Approve
- Needs Info
- Ready To Schedule

Minimum actions:

- view transcript or source lead
- view AI assessment
- copy CCC-ready summary
- copy customer follow-up draft
- mark reviewed
- mark missing info
- mark ready to schedule
- archive duplicate or test records

This is the highest-priority production build because it turns deployed APIs into staff-usable workflow software.

## Stage 3: Central Operational Database

Goal: stop treating each service SQLite database as the production source of truth.

Recommended database:

```text
Postgres on Railway
```

Minimum v1 tables:

```text
calls
leads
intakes
automation_runs
approval_actions
staff_users
```

Later tables:

```text
customers
vehicles
appointments
repair_orders
estimates
supplements
parts_status
customer_updates
insurance_drafts
production_jobs
```

Design decision:

- Service-local SQLite remains useful for per-service audit records.
- Central Postgres becomes the production control layer for the Ops Console and cross-service workflow state.

## Stage 4: Human Approval Workflow

Goal: AI drafts, summarizes, classifies, and recommends. Staff approves business actions.

Approval categories:

- customer-facing message
- insurance-facing email
- drivability or safety caution
- appointment readiness
- supplement narrative
- estimate review flag
- production priority

Each approval record should store:

- approving user
- source record
- original AI output
- final edited output
- approval action
- timestamp

Do not automate outbound customer messages, insurer emails, scheduling commitments, repair decisions, financial actions, or drivability guidance before this exists.

## Stage 5: Scheduling Workflow

Goal: turn reviewed intakes into appointment drafts.

Workflow:

```text
Reviewed intake
-> appointment scheduler API
-> appointment readiness
-> missing prerequisites
-> confirmation draft
-> staff approval
-> Google Calendar draft or manual scheduling
```

Initial integration:

- manual scheduling
- Google Calendar draft only

Do not auto-book appointments in v1.

Statuses:

```text
Ready To Schedule
Scheduling Blocked
Appointment Drafted
Scheduled
No Show
Rescheduled
```

## Stage 6: Estimate And Supplement Workflow

Goal: reduce estimator and admin time around estimate review and supplement prep.

Workflow:

```text
Estimate text or PDF-export text
-> estimate parser API
-> labor / parts / paint totals
-> missing fields
-> risk flags
-> review checklist
-> supplement evidence API
-> evidence checklist
-> supplement narrative draft
-> insurance email drafting API
-> adjuster email draft
-> human approval
```

Production screens:

- Estimate Review
- Supplement Packet
- Insurance Drafts

Human approval is required before supplement submission, insurer communication, repair decisions, or financial/customer commitments.

## Stage 7: Parts And Vendor Workflow

Goal: track parts blockers and draft vendor follow-ups.

Inputs:

- manual parts status
- CSV / Google Sheet
- vendor email copy/paste
- future Gmail parsing

Workflow:

```text
Parts status input
-> parts ETA tracker API
-> blocked parts
-> ETA risk
-> vendor follow-up draft
-> staff review
```

Minimum fields:

- RO number
- part description
- part type
- vendor
- status
- ETA
- backorder flag
- blocking production?
- last checked

Statuses:

```text
Needed
Ordered
Partial
Backordered
Received
Returned
Blocking
Resolved
```

## Stage 8: Customer Update Workflow

Goal: draft customer-safe updates from actual repair status.

Workflow:

```text
Job status note
-> customer status update API
-> customer-safe message
-> delay reason
-> approval flags
-> staff review
-> copy/send manually first
```

Safeguards:

- no promises unless staff confirms
- no safety claims
- no blame language
- no insurer commitments
- flag delays, supplements, parts, and payment issues for review

Do not auto-send in v1.

## Stage 9: Production Dashboard

Goal: give management a daily operating view.

Inputs:

- manual table
- Google Sheet
- CSV
- future CCC export

Workflow:

```text
Production status data
-> daily production dashboard API
-> WIP summary
-> blocked jobs
-> promised-date risk
-> manager priorities
```

Dashboard sections:

- open jobs
- jobs at risk
- parts blockers
- supplement blockers
- delivery today
- customer update needed
- manager priorities

This becomes the morning meeting screen.

## Stage 10: External Integrations

Goal: replace copy/paste with controlled system connections.

Integration order:

1. Google Sheets / CSV
2. Gmail draft creation
3. Google Calendar draft creation
4. Website form webhooks
5. Vapi production hardening
6. QuickBooks reference / export
7. CCC ONE exports / manual imports
8. Vendor email parsing
9. Direct APIs only where officially available and contractually allowed

Do not start with CCC ONE direct integration. Validate export/API access and terms first.

## Stage 11: Security And Production Hardening

Required before broader staff rollout:

- authenticated internal console
- role-based access
- private admin routes
- webhook secrets
- audit logs
- request IDs everywhere
- rate limiting
- error monitoring
- backup policy
- data retention policy
- no PII in GitHub
- no sensitive transcripts in unnecessary logs
- staff training guide
- incident rollback process

## Stage 12: Production Metrics

Track whether automation is improving operations.

Metrics:

- intakes processed
- missing fields caught
- callbacks avoided
- time to schedule
- customer updates drafted
- estimate review time saved
- supplement packets prepared
- parts blockers identified
- jobs at promised-date risk
- staff edits to AI drafts

If a workflow does not improve a metric, do not expand it.

## Recommended Build Order

1. Ops Console v1: Phone Intake Inbox
2. Central Postgres database
3. Intake approval workflow
4. Website lead inbox
5. Scheduling draft workflow
6. Customer status update workflow
7. Daily production dashboard
8. Estimate parser workflow
9. Supplement and insurance draft workflow
10. Parts ETA workflow
11. Gmail / Calendar integrations
12. CCC/export workflow investigation

## Immediate Next Sprint

Scope:

```text
Production Suite v1: Intake Review
```

Deliverables:

- private Ops Console repo
- phone intake inbox
- website intake inbox
- intake detail page
- review status changes
- CCC-ready summary copy action
- customer follow-up draft copy action
- audit trail for review actions
- Railway Postgres database
- authenticated access before real staff usage
