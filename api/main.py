from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}
  
@app.get("/calc/sum")
async def sum(a: int, b: int):
    return {"result": a + b}

# Required packages:
# > conda install -c conda-forge fastapi
# > conda install -c conda-forge uvicorn

# Starting FastAPI:
# > cd /d G:\Meine Ablage\Schule\fh_technikum_wien_data_science\S3_2022\MDS-BB-3-WS2022-SDC\Exercise 2_Dashboard\api
# > uvicorn main:app --reload