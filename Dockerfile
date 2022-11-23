FROM python:3.10-slim-bullseye

LABEL maintainer="Ayushi Agrawal <ayushiag@gmail.com>"

WORKDIR /technical-resource-db

RUN apt-get update
RUN apt-get install -y gcc libssl-dev libmariadb-dev
RUN python3 -m pip install poetry

COPY pyproject.toml /technical-resource-db/
COPY poetry.lock /technical-resource-db/

RUN poetry config virtualenvs.create false
RUN poetry install --no-dev --no-root --no-interaction --no-ansi
