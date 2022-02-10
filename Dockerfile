FROM ubuntu
LABEL maintainer="tian.r.king@gmail.com"
LABEL author="w0x7ce"
LABEL version="v0.1"
WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
RUN apt-get update 
RUN apt-get install python3.8 -y  && apt-get install python3-pip -y
RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple
RUN pip config set install.trusted-host mirrors.aliyun.com
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
 
COPY ./app /code/app
 
RUN echo "EXPOSE PORT 81 "
RUN (echo "from sentence_transformers import SentenceTransformer, util" ; \
     echo "model = SentenceTransformer('paraphrase-multilingual-mpnet-base-v2')") | python3

CMD ["uvicorn", "app.fast_test:app", "--host", "0.0.0.0", "--port", "81"]
