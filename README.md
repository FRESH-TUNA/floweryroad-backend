# 풀꽃길
![](./floweryroad.png)
<a href="http://floweryroad-frontend.s3-website.ap-northeast-2.amazonaws.com/">http://floweryroad-frontend.s3-website.ap-northeast-2.amazonaws.com/</a>

## 1. 만든사람들
김수빈 - 남서울대 멋사 운영진 (백엔드, 팀장)<br/>
김동원 - 강원대 멋사 7기 (백엔드, 프론트엔드)<br/>
이지은 - 덕성여대 멋사 7기 (백엔드, 자료조사)

## 2. 작동 환경
* Python : 3.8.1
* Django : 3.1

## 3. 프로젝트 개요
꽃의 종류가 너무 많고 상황에 맞는 적절한 꽃을 찾기 힘들다는점에 착안하여<br/>
사용자가 원하는 색깔이나 목적, 꽃말을 입력하면 원하는 꽃을 쉽게 찾을수 있는 웹서비스 
#### 기획안 PPT 자료 [<a href="/presentation.pdf">클릭</a>]

## 4) 웹서비스 주요기능
1. 꽃말, 이름, 색깔, 목적을 입력하여 원하는 꽃들을 검색할수 있다.
2. 각각의 꽃들에는 꽃말, 색깔, 목적 별로 태그가 정리 돠어있다. 이를 클릭하여 태그별로 원하는 꽃들을 검색할수 있다.

## 5. 개발환경 시작하기
개발환경을 시작하기전에 docker와 docker-compose의 설치가 필요하다. 다음 공식문서를 참고해 서버나 PC에 설치해준다.
<a href="https://docs.docker.com/engine/install/ubuntu/">https://docs.docker.com/engine/install/ubuntu/</a>
<a href="https://docs.docker.com/compose/install/">https://docs.docker.com/compose/install/</a>

docker와 docker-compose를 설치한후 다음명령어를 시작하면 개발환경이 구축되고 실행된다.

```sh
chmod 700 ./init
./init
```

한번 ./init 을 실행했다면 다시 실행해줄 필요는 없고 다음명령어로 개발환경을 시작할수 있다.
```sh
docker-compose up
```

## 6. 프로젝트 환경 관련 폴더
### 1. config
서비스를 위한 설정값들이 담겨 있다.
<br>
[<a href="/config">config 폴더 이동</a>]

### 2. deployment
배포를 위한 쿠버네티스 설정 파일들이 담겨있다.<br>
[<a href="/deployment">deployment 폴더 이동</a>]

### 3. docker
개발, 배포 환경 구성을 위한 도커 파일들이 담겨있다.<br>
[<a href="/docker">docker 폴더 이동</a>]

### 4. envs
개발 환경에 필요한 환경변수들이 담길 폴더<br>
[<a href="/envs">envs 폴더 이동</a>]

### 5. tests
테스트코드가 담겨 있는 폴더<br>
[<a href="/tests">tests 폴더 이동</a>]

## 7. 프로젝트 기능 관련 폴더
### 1. core 
풀꽃길이 주요기능을 제공하는 로직을 담당<br>
[<a href="/core">core 폴더 이동</a>]

### 2. auth
jwt 기반의 사용자 인증 기능을 제공하는 로직을 담당<br>
[<a href="/auth">auth 폴더 이동</a>]
