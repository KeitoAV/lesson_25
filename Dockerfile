#FROM ubuntu:20.04
#
#RUN apt update && apt install -y nginx
#
#CMD nginx -g 'daemon off;'

# Базовый образ, который тоже состоит из слоев
FROM python:3.10

# Новый слой
WORKDIR /code
# Новый слой
COPY requirements.txt .
# Новый слой
RUN pip install -r requirements.txt
# Новый слой
COPY app.py .
# Новый слой
COPY migrations migrations
# Новый слой
COPY docker_config.py default_config.py

# Новый слой
CMD flask run -h 0.0.0.0 -p 80