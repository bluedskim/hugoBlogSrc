---
title: "Mirroring With Wget"
categories: ["tech"]
date: 2019-10-29T21:42:39+09:00
draft: false
tags: ["Mirroring", "Wget"]
---
볼만한 하둡 pdf 자료가 없어서 공식 홈페이지의 document를 다운받기로 했다.

웹사이트 미러링에는 wget 관련 자료가 가장 많다.

사용한 옵션을 정리해보자

--mirror : 해당 사이트의 link를 follow하면서 미러링을 한다.<br/>
--convert-links : 링크가 로컬에서도 동작하도록 변환한다.<br/>
--html-extension : 디렉토리 형태의 주소를 저장할 때 html 확장자를 붙혀준다. 로컬에서 조회할 때 필수~!<br/>
--wait=2 : 서버 부하를 줄여주기 위해 2초간 쉰다.<br/>
--no-parent : 상위 경로는 받아오지 않는다.<br/>
-o log : log라는 이름으로 로그를 저장한다.

	wget --mirror            \
		 --convert-links     \
		 --html-extension    \
		 --wait=2            \
		 --no-parent         \
		 -o log              \
	https://hadoop.apache.org/docs/stable/index.html
