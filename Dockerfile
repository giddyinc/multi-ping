FROM python:3.7-slim

ENV APP_HOME /srv/app
ENV ENV staging
ENV PYTHONUNBUFFERED 0

WORKDIR $APP_HOME
COPY requirements.txt $APP_HOME

RUN pip install -r requirements.txt

COPY . $APP_HOME

RUN chmod -R +x docker-entrypoint.*

ENTRYPOINT ["./docker-entrypoint.sh", "python", "-u"]


