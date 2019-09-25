# 풀꽃길
![](./floweryroad.png)
[<a href="http://floweryroad.s3-website.ap-northeast-2.amazonaws.com/">http://floweryroad.s3-website.ap-northeast-2.amazonaws.com/</a>]

## 1. 만든사람들
김수빈 - 남서울대 멋사 운영진 (백엔드, 팀장)<br/>
김동원 - 강원대 멋사 7기 (백엔드, 프론트엔드)<br/>
이지은 - 덕성여대 멋사 7기 (백엔드, 자료조사)

## 2. 작동 환경
* Python : 3.6.4
* Django : 2.2.4

## 3. 프로젝트 개요
꽃의 종류가 너무 많고 상황에 맞는 적절한 꽃을 찾기 힘들다는점에 착안하여<br/>
사용자가 원하는 색깔이나 목적, 꽃말을 입력하면 원하는 꽃을 쉽게 찾을수 있는 웹서비스 
#### 기획안 PPT 자료 [<a href="/presentation.pdf">클릭</a>]

## 4) 웹서비스 주요기능
1. 꽃말, 이름, 색깔, 목적을 입력하여 원하는 꽃들을 검색할수 있다.
2. 각각의 꽃들에는 꽃말, 색깔, 목적 별로 태그가 정리 돠어있다. 이를 클릭하여 태그별로 원하는 꽃들을 검색할수 있다.

## 5. 주요 소스 코드
### 1. 도커를 활용한 개발, 테스트, 배포 환경
```/web/docker/dev/Dockerfile``` [<a href="/web/docker/dev/Dockerfile">이동</a>] 개발 환경을 위한 이미지<br/>
```/docker-compose/dev/docker-compose.yml``` [<a href="/docker-compose/dev/docker-compose.yml">이동</a>] 개발 환경 작동 파일<br/>
```/web/floweryroad/settings/development.py``` [<a href="/web/floweryroad/settings/development.py">이동</a>] 개발 settings
<br/><br/>
```/docker-compose/test/docker-compose.yml``` [<a href="/docker-compose/test/docker-compose.yml">이동</a>] 테스트 환경 작동파일
<br/><br/>
```/web/docker/prod/Dockerfile``` [<a href="/web/docker/prod/Dockerfile">이동</a>] 배포 환경을 위한 이미지<br/>
```/docker-compose/prod/docker-compose.yml``` [<a href="/docker-compose/prod/docker-compose.yml">이동</a>] 배포 환경 작동파일<br/>
```/web/floweryroad/settings/docker_production.py``` [<a href="/web/floweryroad/settings/docker_production.py">이동</a>] 테스트, 배포 settings
<br/><br/>
```/pipeline_open.sh``` [<a href="/pipeline_open.sh">이동</a>] 배포 파이프라인

### 2. jwt web token 방식 인증 사용
1. ```/web/flauth/views.py``` [<a href="/web/flauth/views.py">이동</a>] 회원가입, 회원정보 변경, 로그인 로직
2. ```/web/flauth/serializers/auth.py``` [<a href="/web/flauth/serializers/auth.py">이동</a>] 회원가입후 바로 로그인될수 있게 시리얼라이저 재정의하여 사용

### 3. 풀꽃길 로직
1. ```/web/core/views/flower.py``` [<a href="/web/core/views/flower.py">이동</a>] 필터 기능을 활용한 꽃 검색
2. ```/web/core/paginators/comment.py``` [<a href="/web/core/paginators/comment.py">이동</a>] 페이징시 링크를 제공하여 HATEOAS 할수 있도록 노력했다.

### 4. TDD
1. ```/web/tests``` [<a href="/web/tests">이동</a>] 테스트 함수를 이용한 로직 확인

