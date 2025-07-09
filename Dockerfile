FROM tiangolo/uwsgi-nginx-flask:python3.9-2025-07-07
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip python3-dev build-essential vim
RUN apt-get install -y nginx

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

COPY requirements.txt /usr/src/build/requirements.txt


WORKDIR /usr/src/build
# RUN pip3 install --upgrade pip  --break-system-packages
RUN pip3 install -r requirements.txt  --break-system-packages

COPY app /usr/src/backend
WORKDIR /usr/src/backend
EXPOSE 5000

CMD ["flask", "--app", "main", "run"] # Uncomment to run UWSGI server
