+++
title = "Hugo + Github으로 블로깅"
date = "2017-10-22T22:38:28+09:00"
tags = []
featured_image = ""
description = ""
+++
### 왜 Hugo인가?
원래 Jekyll 을 사용하려 했으나 Asus Flip C100pa 에 설치 실패하여 어쩔 수 없이 선택 -.-

#### 환경
ASUS Chromebook C100PA-DS03 + Crouton + Debian Stretch

#### 설치
아래처럼 apt-get으로 설치하면 0.18 버전이 설치됨. 0.18  버전에서는 쓸 수 없는 theme 이 있어 더 최신 버전을 찾기로 함
    
    sudo apt-get install hugo 
    
https://packages.debian.org/sid/armhf/hugo/download 에서 0.25.1-2 버전을 다운로드 받아. dpkg 명령으로 설치
    
    sudo dpkg -i hugo_0.25.1-2_armhf.deb
    
### GitHub에 연결
이것이 쉽지 않다. GitHub문서에 따르면 https://gohugo.io/hosting-and-deployment/hosting-on-github/ 
GitHub에  *username*.github.io 리포지토리를 만들고 master branch내에 docs 폴더를 만들면 docs폴더를 root디렉토리로 
인식된다고 했는데 docs폴더를 인식하지 못하는 듯 하다. 만약 이것이 가능했다면 소스(?) 파일과 생성된 html파일들을 하나의 리포지토리에서 관리할 수 있어 편할 듯 하다.

하지만 안되니깐 어떨 수 없이 소스 리포지토리와 퍼블리시된 파일들을 따로 리포지토리를 만들었다. 그러기 위해서는 설정을 변경해야 한다.
#### config.toml 수정
config.toml 에 publishDir 를 변경(혹은 추가)한다. 
다행이도 상대경로 지정이 가능하여 상위 디렉토리에 생성

    publishDir = "../docs"

### 디렉토리 구조
+ ~/hugo/blog : md 파일 저장용
+ ~/hugo/docs : 자동 퍼블리싱 된 파일들 

### 새  post 생성
~/hugo/blog 에서 실행

    hugo new posts/tech/hugo.md

한글명으로 페이지 생성해도 잘 된다.

### hugo server 구동
    hugo server -D
+ 브라우저로 접속 : http://localhost:1313
+ hugo.md 파일을 수정하면 즉시 로컬 사이트에 반영됨

### 정적 파일 생성
    hugo

live reload 는 메모리상에서 이루어지고 실제 파일들 생성은 명령을 실행해야 생성됨

### 주요 파일들
+ ./themes/ananke/layouts/_default/baseof.html : head 태그 내용 수정

### 주의 사항

#### 포스팅 시각 문제

posting용 md에는 날짜를 타이핑해야 하는데 현재 시스템 시각보다 이후의 시각을 입력하면 render가 되지 않는다

#### rss의 링크 문제

설정에서 baseUrl을 / 로 설정한 경우 rss의 링크에 도메인 정보가 없어 링크를 타고 들어올 수가 없다.
그렇다고 baseUrl을 실제 탑재할 서버의 링크로 변경하면 로컬에서 미리보기를 할 수가 없다. 이 때는 html 생성시 다음과 같이 명령 옵션으로 baseUrl을 변경한다.

	hugo --baseURL="https://bluedskim.github.io/"
	
#### html 로 내용 작성 시 'raw HTML omitted' 오류 발생 문제

* 증상 : 내용에 html로 작성한 부분에 해당 내용이 뜨지 않고 아래와 같은 html 코멘트가 삽입됨

{{< highlight go "linenos=false" >}}
<!-- raw HTML omitted --> 
{{< / highlight >}}

* 해결 방법 : 설정에 아래 내용 추가

{{< highlight go "linenos=false" >}}
[markup]
  [markup.goldmark]
	[markup.goldmark.renderer]
	  unsafe = true
{{< / highlight >}}		  




