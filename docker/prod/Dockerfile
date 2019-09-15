FROM        floweryroad-backend:develop
MAINTAINER  lunacircle4@gmail.com

COPY ./floweryroad-backend /app/floweryroad-backend
COPY ./.server /app/.server
# COPY /app/floweryroad-backend /app/floweryroad-backend

# nginx
RUN         cp -f /app/.server/uwsgi.service /etc/systemd/system/uwsgi.service
RUN         cp -f /app/.server/supervisor_app.conf /etc/supervisor/conf.d/

# requirements.txt install
# RUN         /root/.pyenv/versions/floweryroad/bin/pip install -r /app/floweryroad-backend/requirements.txt