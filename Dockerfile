# syntax=docker/dockerfile:1.7-labs
ARG PYTHON_VERSION=3.12

########### builder stage ###########
FROM python:${PYTHON_VERSION}-slim AS builder
RUN --mount=type=cache,target=/var/cache/apt     apt-get update && apt-get install -y --no-install-recommends build-essential && rm -rf /var/lib/apt/lists/*
WORKDIR /src
COPY requirements.txt requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip     pip install --upgrade pip && pip wheel --wheel-dir /wheels -r requirements.txt

########### runtime stage ###########
FROM python:${PYTHON_VERSION}-slim AS runtime
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8080
WORKDIR /app
COPY --from=builder /wheels /wheels
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir /wheels/* && rm -rf /wheels
COPY app/ /app/app/
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import sys,urllib.request; sys.exit(0 if urllib.request.urlopen('http://localhost:8080/health').status==200 else 1)"
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
