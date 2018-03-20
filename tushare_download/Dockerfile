FROM python:3.6.4-alpine3.7
FROM amancevice/pandas:0.22.0-python3-alpine

RUN echo "http://mirrors.aliyun.com/alpine/v3.7/main/" > /etc/apk/repositories

RUN apk update && apk add bash py3-pip build-base libxml2-dev libxslt-dev
RUN pip3 install --upgrade pip lxml requests bs4
RUN pip3 install tushare

WORKDIR /usr/src/app
RUN mkdir data
VOLUME /usr/src/app/data

COPY download_ticks.py .

ENTRYPOINT ["python3", "./download_ticks.py"]
