FROM        ubuntu:latest
MAINTAINER  floweryroad-backend:1.1.0

COPY /app/floweryroad-backend /app/floweryroad-backend
# pyenv
# RUN         apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
# libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
# xz-utils tk-dev
# RUN         curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
# ENV         PATH /root/.pyenv/bin:$PATH
# RUN         pyenv install 3.6.4

# # zsh
# RUN         apt-get install -y zsh
# RUN         wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
# RUN         chsh -s /usr/bin/zsh

# # supervisord install
# RUN         apt-get -y install supervisor

# # pyenv settings
# RUN         echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.zshrc
# RUN         echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# RUN         echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# COPY /app/floweryroad-backend /app/floweryroad-backend

# # pyenv virtualenv
# RUN         pyenv virtualenv 3.6.4 floweryroad
# RUN         /root/.pyenv/versions/floweryroad/bin/pip install --upgrade pip

# # requirements.txt install
# RUN         /root/.pyenv/versions/floweryroad/bin/pip install -r /app/floweryroad-backend/requirements.txt

# # nginx
# RUN         cp -f /app/floweryroad-backend/floweryroad/settings/.server/uwsgi.service /etc/systemd/system/uwsgi.service
# RUN         cp -f /app/floweryroad-backend/floweryroad/settings/.server/supervisor_app.conf /etc/supervisor/conf.d/