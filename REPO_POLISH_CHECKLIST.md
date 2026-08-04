# Repo Polish Checklist

Use this checklist before making any repo public.

- README renders as Markdown, not indented code.
- README has Portfolio Status, Live demo, Case study, Architecture, API endpoints, Example request/response, local run, Docker, Railway, Test, Production considerations, and Portfolio talking points.
- `docs/assets/swagger-docs.png` exists.
- `docs/assets/api-response.png` exists.
- `sample_data/sample_request.json` exists and uses synthetic data only.
- `.env`, local SQLite databases, `.pytest_cache`, `.ruff_cache`, and `.DS_Store` are not tracked.
- `ruff format --check .` passes.
- `ruff check .` passes.
- `pytest -q` passes.
- `docker build -t <repo>:ci .` passes.
- Git working tree is clean.
