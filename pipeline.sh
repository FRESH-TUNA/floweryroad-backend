#!/bin/zsh

docker build -t lunacircle4/floweryroad-backend:1.3.1  -f docker/prod/Dockerfile .
docker push lunacircle4/floweryroad-backend:1.3.1
docker tag lunacircle4/floweryroad-backend:1.3.1 lunacircle4/floweryroad-backend:latest
docker push lunacircle4/floweryroad-backend:latest

docker build -t lunacircle4/nginx:floweryroad-backend  -f docker/nginx/prod/Dockerfile .
docker push lunacircle4/nginx:floweryroad-backend

scp -i <pem 파일 경로> -r /Users/kimdongwon/Documents/WebProgramming/Projects/Floweryroad/docker/prod ec2-user@15.164.30.120:/app/floweryroad-backend/docker/

ssh -tt -i <pem 파일 경로> ec2-user@15.164.30.120   "\
                                    docker-compose -f /app/floweryroad-backend/docker/prod/docker-compose.yml stop  && \
                                    docker-compose -f /app/floweryroad-backend/docker/prod/docker-compose.yml pull  && \
                                    docker-compose -f /app/floweryroad-backend/docker/prod/docker-compose.yml up -d"