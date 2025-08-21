from fastapi import FastAPI

app = FastAPI(title="ElevateLabs Pro CI/CD API", version="1.0.0")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/version")
def version():
    return {"version": "1.0.0", "app": "elevate-pro-cicd"}

@app.get("/")
def root():
    return {"message": "Hello from ElevateLabs Pro CI/CD!"}
