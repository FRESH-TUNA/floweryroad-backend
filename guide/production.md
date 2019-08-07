1. chmod 400 [name].pem 
- 키파일을 자신만이 볼수 있게 한다.

2. ssh -i <pem 파일 경로> <user-name(ubuntu)>@public-dns-name
- 원격 터미널로 ec2에 접속한다.

3. 
- sudo vi /etc/default/locale 입력
- LC_CTYPE="en_US.UTF-8"
  LC_ALL="en_US.UTF-8"
  LANG="en_US.UTF-8"
  입력후 저장
- 문자 깨짐 현상 방지

4. 
- sudo apt-get update
  sudo apt-get dist-upgrade
- 패키지관리자 업데이트 

5.
- sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev

-일반적 문제 해결 패치

6.  
- sudo apt-get install zsh
  curl -L http://install.ohmyz.sh | sh
  sudo chsh ubuntu -s `which zsh`
- oh my zsh

7. 
-  vi ~/.zshrc
-  export PATH ~ 주석해제
-  export PATH="/home/ubuntu/.pyenv/bin:$PATH"
   eval "$(pyenv init -)"
   eval "$(pyenv virtualenv-init -)" ~/.zshrc 에 추가후 저장

- source ~/.zshrc

8. sudo chown -R ubuntu:ubuntu /srv

9. scp -i <pem 파일 경로> -r <복사할 로컬 프로젝트 위치> <user-name(ubuntu)>@<public dns name>:<복사될 인스턴스 위치>

10. 
- pyenv install 3.6.4
- pyenv virtualenv 3.6.4 <가상환경이름>
