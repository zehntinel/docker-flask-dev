FROM python:3.11.1

LABEL maintainer="Adrian Galicia <adgaben@gmail.com>"

# Install dependencies

RUN pip install pipenv  \
    pip install gunicorn[gevent]

WORKDIR /app
