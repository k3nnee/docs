from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def getRoot():
    return {"message": "Hello world"}
