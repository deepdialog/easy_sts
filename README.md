# easy_sts



|  Name   | API  | Method | Func | State |
|  ----  | ----  | ----  | ----  |----|
| sts  | /sts | get |test| ✅|
| ...  | /sts/ |get|text->vector|✅|
| ...  | /api/sts/ |post|vector->text|✅|

## Deploy

### Way 1 Docker 

Simply copy code below
```
docker run -d -p 61111:81 tianrking/fastapi_sts:v0.4
```


### Way 2 Clone code run on localhost

```
git clone https://github.com/deepdialog/easy_sts 
sudo apt-get update && sudo apt-get install python3 python3-pip
pip install -r requirements.txt
uvicorn app.fat_test:app --reload --host 0.0.0.0 --port 61112
```
Then the server is running on localhost:61112

## Server test

- curl -X GET "127.0.0.1:61111/sts/text"
- curl -X POST -k "127.0.0.1:61111/api/sts/" -H 'Content-Type: application/json' -d'
{
    "text": "ok"
}
'
