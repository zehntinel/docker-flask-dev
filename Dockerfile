FROM python:3.11.1-bullseye

LABEL maintainer="Adrian Galicia <adgaben@gmail.com>"

# Install requirements

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /app
