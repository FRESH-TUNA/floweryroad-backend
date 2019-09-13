FROM        floweryroad-backend:1.1.0
MAINTAINER  lunacircle4@gmail.com

COPY ./ /app/floweryroad-backend

# COPY /app/floweryroad-backend /app/floweryroad-backend

# nginx
RUN         cp -f /app/floweryroad-backend/floweryroad/settings/.server/uwsgi.service /etc/systemd/system/uwsgi.service
RUN         cp -f /app/floweryroad-backend/floweryroad/settings/.server/supervisor_app.conf /etc/supervisor/conf.d/

# requirements.txt install
# RUN         /root/.pyenv/versions/floweryroad/bin/pip install -r /app/floweryroad-backend/requirements.txt