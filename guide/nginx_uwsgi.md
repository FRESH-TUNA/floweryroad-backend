1. nginx 설치
- sudo add-apt-repository ppa:nginx/stable
  sudo apt-get update
  sudo apt-get install nginx

2. sudo cp -f <nginx-app.conf 경로> /etc/nginx/sites-available/nginx-app.conf
- nginx-app.conf 파일 sites-available 폴더에 복사

3. sudo ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/nginx-app.conf
- site-enabled에 링크 걸어주기

4. sudo cp -f /srv/nginx_test/app/.config/uwsgi.service /etc/systemd/system/uwsgi.service
- uwsgi.sevice 파일 system 폴더에 복사

5. 
- sudo systemctl enable uwsgi
  sudo systemctl daemon-reload
  sudo systemctl restart uwsgi nginx

6. nginx 테스트
- uwsgi --http :8000 --home <가상환경폴더위치> --chdir <프로젝트폴더위치> -w floweryroad.wsgi

- uwsgi --ini /app/floweryroad-backend/floweryroad/settings/.server/uwsgi.ini



uwsgi --http :80 --home /root/.pyenv/versions/floweryroad --chdir /app/floweryroad-backend -w floweryroad.wsgi