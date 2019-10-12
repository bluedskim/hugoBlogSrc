+++
title = "pixelbook에 Docker설치하기"
date = "2019-04-28T13:38:28+09:00"
tags = ["Docker"]
featured_image = ""
description = ""
+++

reddit에 의하면 Chromeos 72 이상에서 docker-ce 최신 버전 설치에 문제가 없다고 한다(참고 : https://www.reddit.com/r/Crostini/comments/aoc9i7/docker_working_now/)

여기 가이드대로 진행하면 문제없이 설치되는데  https://docs.docker.com/install/linux/docker-ce/debian/

한가지 주의사항이 있다. add-apt-repository 할 때 lsb-core가 없어서 오류가 발생한다. 그래서  아래처럼 lsb-core 를 설치하던가

	sudo apt-get install lsb-core

add-apt-repository 구문을 아래처럼 변경하면 된다.

	$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

Docker 만세!

<!---
인터넷에서 찾아본 자료에 의하면 docker 설치에 문제가 있다고.  
하지만 고마운 누군가가 직접 binary를 수정해서 github에 공유해 주셨다.

아래에서 스크립트를 받아서 실행하면 깔끔하게 설치된다.
https://github.com/abiosoft/crostini-docker

root 가 아닌 사용자(본인)도 쓸 수 있게 하기 위해 docker그룹에 추가하고

	sudo usermod -a -G docker $USER

터미널만 리스타트 하면 된다고 하는데 그렇게 되지는 않았고 픽셀북을 껐다 켜야 한다.

이후에 아래 명령이 잘 동작하는지 확인한다.

	docker run hello-world
-->
