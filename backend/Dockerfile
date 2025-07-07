FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip python3-dev build-essential vim
RUN apt-get install -y nginx

COPY requirements.txt /usr/src/appname/requirements.txt


WORKDIR /usr/src/appname
# RUN pip3 install --upgrade pip  --break-system-packages
RUN pip3 install -r requirements.txt  --break-system-packages

COPY . /usr/src/appname
EXPOSE 8000

CMD ["python3", "app.py"]
