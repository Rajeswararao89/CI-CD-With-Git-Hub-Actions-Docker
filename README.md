# ElevateLabs Pro CI/CD (FastAPI + Docker + GitHub Actions)

[![CI](https://github.com/<youruser>/elevate-pro-cicd/actions/workflows/ci.yml/badge.svg)](../../actions/workflows/ci.yml)

A production-grade template that lint/tests, builds multi-arch Docker images, generates SBOMs, scans vulnerabilities, signs images with Cosign, and pushes to Docker Hub. Includes Docker Compose for local deployment.

## Quickstart
```bash
make venv && make lint && make test
DOCKERHUB_USERNAME=youruser make compose-up TAG=dev
```

## Release
Create a SemVer tag and push:
```bash
git tag v1.0.0 && git push origin v1.0.0
```
This triggers release workflow → build multi-arch → SBOM → Trivy → Cosign → push `:v1.0.0` and `:latest`.

## Endpoints
- `/` root message
- `/health` health probe
- `/version` app version
- OpenAPI docs at `/docs`

## Env Vars
- `PORT` (default 8080)

## Docker Hub
Images are published to `docker.io/<youruser>/elevate-pro-cicd`.
