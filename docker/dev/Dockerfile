FROM        ubuntu:latest
MAINTAINER  lunacircle4@gmail.com

RUN         apt-get -y update
RUN         apt-get install -y tzdata
RUN         apt-get -y dist-upgrade
RUN         apt-get install -y python-pip git vim

# pyenv
RUN         apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev
RUN         curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
ENV         PATH /root/.pyenv/bin:$PATH
RUN         pyenv install 3.6.4

# zsh
RUN         apt-get install -y zsh
RUN         wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN         chsh -s /usr/bin/zsh

# pyenv settings
RUN         echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.zshrc
RUN         echo 'eval "$(pyenv init -)"' >> ~/.zshrc
RUN         echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# virtualenv floweryroad
COPY    ./requirements.txt /app/floweryroad-backend/requirements.txt
RUN     pyenv virtualenv 3.6.4 floweryroad
RUN     /root/.pyenv/versions/floweryroad/bin/pip install --upgrade pip
RUN     /root/.pyenv/versions/floweryroad/bin/pip install -r /app/floweryroad-backend/requirements.txt 