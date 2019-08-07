# 인스턴스 username
EC2_USER="ubuntu"

# AWS 도메인 주소
EC2_DOMAIN="<ec2-52-78-234-247.ap-northeast-2.compute.amazonaws.com>"

# pem 경로
EC2_PEM="<~/.ssh/examplekey.pem>"

# 복사할 로컬 프로젝트 위치
EC2_DIR="<~/Desktop/Backend/Study/django/nginx_test>"

# 인스턴스 접속 명령어 세팅
alias con-ec2="ssh -i $EC2_PEM $EC2_USER@$EC2_DOMAIN"

# 인스턴스에 복사하는 명령어 세팅
alias copy-ec2="scp -i $EC2_PEM -r $EC2_DIR $EC2_USER@$EC2_DOMAIN:</srv/nginx_test>"

# 인스턴스에 기존에 존재하던 파일 삭제 명령어 세팅
alias delete-ec2-command="con-ec2 sudo rm -rf </srv/nginx_test>"

# 인스턴스에 접속해서 작성한 shell 스크립트 명령어 실행
alias deploy-ec2-command="con-ec2 bash </srv/nginx_test/app/.config/deploy.sh>"

# 인스턴스에 접속해 pip list 설치 명령어 세팅
alias pip-ec2-command="con-ec2 /home/ubuntu/.pyenv/versions/<ec2-deploy>/bin/pip install -r </srv/nginx_test/requirements.txt>"

# 명령어들을 조합해 배포 명령어 세팅
alias deploy-ec2="delete-ec2-command; copy-ec2; pip-ec2-command; deploy-ec2-command"