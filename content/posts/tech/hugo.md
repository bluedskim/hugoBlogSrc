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

### hugo server 구동
    hugo server -D
+ 브라우저로 접속 : http://localhost:1313
+ hugo.md 파일을 수정하면 즉시 로컬 사이트에 반영됨
