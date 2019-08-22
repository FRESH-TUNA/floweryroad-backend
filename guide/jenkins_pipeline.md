#jenkins pipeline

cd folder
git clone https://github.com/lunacircle4/floweryroad-backend.git
git checkout -b practice/docker
git pull origin practice/docker

sudo docker build --tag web:latest .
docker network create hello-network
docker run --name db -d --network hello-network postgres
docker run --name web -d -p 80:80 --network hello-network ubuntu