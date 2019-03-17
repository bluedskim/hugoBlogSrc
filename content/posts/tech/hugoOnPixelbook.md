+++
title = "Pixelbook에서 hugo 설치"
date = "2019-03-15T22:38:28+09:00"
tags = ["Pixelbook", "hugo"]
featured_image = ""
description = ""
+++
# 설치
ASUS Chromebook C100PA-DS03 에 설치할 때와 마찬가지로 최신버전을 설치하려면 deb 파일을 다운 받아야 한다. 현재 최신 버전은 hugo_0.54.0-1_amd64.deb 이다.
하지만 libsass1이 필요하다고 하니 먼저 설치한다.

다운로드 경로 https://packages.debian.org/sid/amd64/libsass1/download

다운 받은 후 설치

    sudo dpkg -i libsass1_3.5.5-2_amd64.deb
    
다운로드 경로 https://packages.debian.org/sid/amd64/hugo/download

다운 받은 후 설치

    sudo dpkg -i hugo_0.54.0-1_amd64.deb 

# 구동

pixelbook에서는 hugo 기본 포트인 1313 으로 띄울 수 없으니 아래를 참고하고
https://www.reddit.com/r/Crostini/comments/aewwhf/cannot_access_penguinlinuxtestport/

서버 띄울 때 포트 변경해줘야 한다. 제일 유명한 포트 중에 하나인 8080을 사용하면 잘 뜬다

    hugo server -D -p 8080
