FROM        floweryroad-backend:1.0.0
MAINTAINER  lunacircle4@gmail.com

COPY ../../ /app/floweryroad

# pip upgrade 
RUN         pip install --upgrade pip
# pyenv virtualenv
RUN         source ~/.zshrc
RUN         pyenv virtualenv 3.6.4 floweryroad

# requirements.txt install
RUN         /root/.pyenv/versions/floweryroad/bin/pip install -r /app/floweryroad-backend/requirements.txt

# nginx
RUN         sudo cp -f /app/floweryroad-backend/settings/.server/nginx-app.conf /etc/nginx/sites-available/nginx-app.conf
RUN         sudo ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/nginx-app.conf
RUN         sudo cp -f /app/floweryroad-backend/settings/.server/uwsgi.service /etc/systemd/system/uwsgi.service