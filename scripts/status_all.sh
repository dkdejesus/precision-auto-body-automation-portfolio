#!/usr/bin/env bash
set -euo pipefail

repos=(
  "/Users/daviddejesus/Projects/collision-phone-intake-api"
  "/Users/daviddejesus/Projects/collision-appointment-scheduler-api"
  "/Users/daviddejesus/Projects/collision-vin-decoder-api"
  "/Users/daviddejesus/Projects/collision-estimate-parser-api"
  "/Users/daviddejesus/Projects/collision-repair-order-summarizer-api"
  "/Users/daviddejesus/Projects/collision-supplement-evidence-api"
  "/Users/daviddejesus/Projects/collision-customer-status-update-api"
  "/Users/daviddejesus/Projects/collision-parts-eta-tracker-api"
  "/Users/daviddejesus/Projects/collision-technician-work-queue-api"
  "/Users/daviddejesus/Projects/collision-delivery-readiness-api"
  "/Users/daviddejesus/Projects/collision-insurance-email-drafting-api"
  "/Users/daviddejesus/Projects/collision-daily-production-dashboard-api"
)

for repo in "${repos[@]}"; do
  name="$(basename "$repo")"
  branch="$(git -C "$repo" branch --show-current)"
  commit="$(git -C "$repo" rev-parse --short HEAD)"
  dirty="$(git -C "$repo" status --short | wc -l | tr -d ' ')"
  remote="$(git -C "$repo" remote get-url origin 2>/dev/null || echo 'no-origin')"
  printf "%-48s branch=%-10s commit=%-8s dirty=%s remote=%s\n" "$name" "$branch" "$commit" "$dirty" "$remote"
done
