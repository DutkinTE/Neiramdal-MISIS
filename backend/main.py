from fastapi import FastAPI

app = FastAPI(
    title="NeiramdalMISIS API",
    description="API",
    version="0.1.0"
)

@app.get("/")
async def root():
    return {"message": "Hello World!"}

@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello, {name}!"}

@app.get("/items/")
async def read_items(skip: int = 0, limit: int = 10):
    return {"skip": skip, "limit": limit}