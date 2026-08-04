#!/usr/bin/env bash
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-/Users/daviddejesus/Projects/collision-intake-api/.venv/bin/python}"

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
  echo "== $name =="
  "$PYTHON_BIN" -m ruff format --check "$repo"
  "$PYTHON_BIN" -m ruff check "$repo"
  PYTHONPATH="$repo" DATABASE_PATH="/tmp/$name-test.db" OPENAI_API_KEY="" "$PYTHON_BIN" -m pytest -q "$repo/tests"
  docker build -q -t "$name:ci" "$repo" >/dev/null
  test -f "$repo/docs/assets/swagger-docs.png"
  test -f "$repo/docs/assets/api-response.png"
  test -z "$(git -C "$repo" status --short)"
done

echo "All portfolio repos validated."
