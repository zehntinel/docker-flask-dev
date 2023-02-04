FROM python:3.11.1-bullseye

LABEL maintainer="Adrian Galicia <adgaben@gmail.com>"

# Install NGINX
COPY ./scripts/install-nginx-debian.sh /
RUN bash /install-nginx-debian.sh \
    && rm -rf /install-nginx-debian.sh

# Install requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /app
