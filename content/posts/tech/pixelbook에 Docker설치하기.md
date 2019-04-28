+++
title = "pixelbook에 Docker설치하기"
date = "2019-04-28T13:38:28+09:00"
tags = ["Docker"]
featured_image = ""
description = ""
+++
인터넷에서 찾아본 자료에 의하면 docker 설치에 문제가 있다고. 
하지만 고마운 누군가가 직접 binary를 수정해서 github에 공유해 주셨다.

아래에서 스크립트를 받아서 실행하면 깔끔하게 설치된다.
https://github.com/abiosoft/crostini-docker

root 가 아닌 사용자(본인)도 쓸 수 있게 하기 위해 docker그룹에 추가하고

	sudo usermod -a -G docker $USER

터미널만 리스타트 하면 된다고 하는데 그렇게 되지는 않았고 픽셀북을 껐다 켜야 한다.

이후에 아래 명령이 잘 동작하는지 확인한다.

	docker run hello-world 
