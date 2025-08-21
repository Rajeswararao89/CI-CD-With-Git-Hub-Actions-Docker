
APP?=elevate-pro-cicd
IMAGE?=$(DOCKERHUB_USERNAME)/$(APP)
TAG?=dev

.PHONY: help
help:
	@echo "make venv | lint | test | build | run | push | compose-up | compose-down"

venv:
	python -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt -r requirements-dev.txt

lint:
	. .venv/bin/activate && flake8 app && black --check app && isort --check-only app

test:
	. .venv/bin/activate && pytest -q

build:
	docker build -t $(IMAGE):$(TAG) .

run:
	docker run --rm -p 8080:8080 $(IMAGE):$(TAG)

push:
	docker push $(IMAGE):$(TAG)

compose-up:
	DOCKERHUB_USERNAME=$(DOCKERHUB_USERNAME) TAG=$(TAG) docker compose up -d --build

compose-down:
	docker compose down -v
