FROM python:3.11.0a7-alpine3.15

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./Django-Polls-App /Django-Polls-App

WORKDIR /Django-Polls-App


EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home polls

ENV PATH="/py/bin:$PATH"

USER polls
