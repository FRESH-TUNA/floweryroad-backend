#jenkins pipeline
sudo docker network create hello-network
sudo docker run --name db -d --network hello-network mongo
sudo docker run --name web -d -p 80:80 --network hello-network nginx