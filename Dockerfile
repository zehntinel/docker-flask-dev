FROM python:3.11.1-bullseye

LABEL maintainer="Adrian Galicia <adgaben@gmail.com>"

# Install NGINX
COPY ./scripts/install-nginx-debian.sh /
RUN bash /install-nginx-debian.sh \
    && rm -rf /install-nginx-debian.sh

# Remove default configuration from NGINX
RUN rm /etc/nginx/conf.d/default.conf

# Install requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Expose ports
EXPOSE 80
EXPOSE 443

# Remove default configuration from Nginx
RUN rm /etc/nginx/conf.d/default.conf
# Copy the base uWSGI ini file to enable default dynamic uwsgi process number
COPY uwsgi.ini /etc/uwsgi/

# Install Supervisord
RUN apt-get update && apt-get install -y supervisor \
&& rm -rf /var/lib/apt/lists/*
# Custom Supervisord config
COPY supervisord-debian.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /app
