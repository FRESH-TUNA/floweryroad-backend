docker run \
--name floweryroad-db \
--net floweryroad \
--net-alias db \
--env-file $(pwd)/.credentials/db.env \
-v $(pwd)/db/volume/:/var/lib/postgresql/data postgres:11


docker run -it --name floweryroad-was --net floweryroad --net-alias was --env-file $(pwd)/.credentials/was.env -v $(pwd)/media:/web/media -v $(pwd)/static:/web/static lunacircle4/floweryroad-backend

docker run -it --name floweryroad-web --net floweryroad --net-alias web -v $(pwd)/media:/app/media -v $(pwd)/static:/app/static -v $(pwd)/.credentials/nginx.conf:/etc/nginx/nginx.conf:ro -p 20000:80 nginx
