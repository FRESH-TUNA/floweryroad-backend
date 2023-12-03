## launcher 스테이지
# 어플리케이션의 동작에만 집중하고, 라이브러리 빌드, 설치는 library_builder 스테이지에 위임합니다.
# 이를 통해 레이어의 숫자를 줄이고, 컴파일러 환경설치를 피하여 이미지의 용량을 줄입니다.
ARG PROJECT_PYTHON_VERSION=3.9
FROM python:${PROJECT_PYTHON_VERSION}-slim-buster as library_builder
LABEL MAINTAINER="tunakim1004@gmail.com"

# RUN: 컨테이너 안에서 명령어를 실행합니다. 이미지가 빌드되면서 실행됩니다.
# FROM, RUN, COPY, CMD, ENTRYPOINT 명령어는 파일시스템상의 레이어의 기준이 됩니다. 
# RUN 스탭의 횟수를 최대한 줄여 레이어의 숫자를 줄이는것이 이미지의 용량을 낮추는데 도움이 됩니다.
# 이를 위해 명령어를 && 로 chaining 하고, cache를 clean하는것을 권장합니다.
RUN         apt-get update && apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libpq-dev libjpeg-dev

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt


## launcher 스테이지
# 어플리케이션의 동작에만 집중하고, 라이브러리 빌드, 설치는 library_builder 스테이지에 위임합니다.
# 이를 통해 레이어의 숫자를 줄이고, 컴파일러 환경설치를 피하여 이미지의 용량을 줄입니다.
FROM lunacircle4/python:${PROJECT_PYTHON_VERSION} as launcher
ARG PROJECT_PYTHON_VERSION
LABEL MAINTAINER="tunakim1004@gmail.com"
WORKDIR     /app

COPY --from=library_builder /usr/local/lib/python${PROJECT_PYTHON_VERSION}/site-packages /usr/lib/python${PROJECT_PYTHON_VERSION}/site-packages
COPY ./ /app
CMD ["python3", "manage.py", "runserver"]
