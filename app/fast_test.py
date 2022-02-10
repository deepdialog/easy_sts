from typing import Optional
from fastapi import FastAPI , Form
from sentence_transformers import SentenceTransformer, util
from typing import Optional
from pydantic import BaseModel
import base64
import os
from pydub import AudioSegment


app = FastAPI()

# model = SentenceTransformer('all-roberta-large-v1')
model = SentenceTransformer('paraphrase-multilingual-mpnet-base-v2') 

@app.get("/sts")
async def sts_help():
    return "send_data"

@app.get("/sts/{_text}")
async def read_sentence(_text):
    embedding = model.encode(_text, convert_to_tensor=True)
    print(embedding)
    return {"txt": _text,"embedding":embedding.tolist()}

class Item_sts(BaseModel):
    text: Optional[str] = ""

@app.post("/api/sts/")
async def create_item(item: Item_sts):
    embedding = model.encode(item.text, convert_to_tensor=True)
    print(item.text)
    # print(item.method)
    return embedding.tolist()
