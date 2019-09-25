FROM        django_base
MAINTAINER  lunacircle4@gmail.com

COPY    ./requirements.txt /app/web/requirements.txt
RUN     pyenv virtualenv 3.6.4 floweryroad
RUN     /root/.pyenv/versions/floweryroad/bin/pip install --upgrade pip
RUN     /root/.pyenv/versions/floweryroad/bin/pip install -r /app/web/requirements.txt 