#!/usr/bin/env bash
sudo rm -rf /etc/nginx/sites-enabled/*
sudo cp -f </srv/nginx_test/app/.config/nginx-app.conf> /etc/nginx/sites-available/nginx-app.conf
sudo ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/nginx-app.conf
sudo cp -f </srv/nginx_test/app/.config/uwsgi.service> /etc/systemd/system/uwsgi.service

cd /srv/app
/bin/bash -c \
'/home/ubuntu/.pyenv/versions/<ec2-deploy>/bin/python \
</srv/ngingx_test/app/manage.py> collectstatic --noinput' ubuntu

sudo systemctl enable uwsgi
sudo systemctl daemon-reload
sudo systemctl restart uwsgi nginx