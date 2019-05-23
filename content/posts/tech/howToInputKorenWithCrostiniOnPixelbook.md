+++
title = "Pixelbook Crostini Linux앱에서 한글 입력하기"
date = "2019-03-16T22:38:28+09:00"
tags = ["Pixelbook", "crostini"]
featured_image = ""
description = ""
+++
영어/알파벳을 쓰는 나라 사람들은 이해하기 힘든 문제가 바로 2byte 이상 문자 입출력 문제이다.\
최신 기술일수록 한글지원이 미약한 경우가 많은데\
역시나 크롬북도 예외가 아니다.\
크롬북은 리눅스 기반이며 그래서 구글에서는 대부분의 크롬북에서 리눅스 프로그램 설치를 지원해주는데\
이것이 바로 프로젝트 Crostini다.\
구글답게 멋지게 구현하였는데 역시나 한글 입력 문제가 있다.\
크롬북의 한글전환 단축키가 리눅스앱에서는 동작하지 않는다는 점이다\
여러 아시아 2byte이상 문자권의 사용자들이 구글에 요구를 해왔던 것 같은데\
구글이 공식 지원해주기 전에 유저들이 방법을 찾아냈다.\
이것은 의외로 리눅스에서 여러 언어를 동시에 지원하는 방법과 동일한데 바로 fcitx입력기를 설치하는 것이다.\

[참고]\
* https://itsze.ro/blog/2018/08/08/quick-note-on-crostini-chinese-ime.html

한글locale 설치

	sudo apt-get install language-pack-ko

	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	E: Unable to locate package language-pack-ko
	
	# 실패하여 모든 locale을 다 설치함 -.-
	sudo apt-get install -y locales locales-all
	
한글입력기를 설치한다

	sudo apt-get install fcitx-hangul

fcitx-config-gtk3 도 같이 설치된다. fcitx-config-gtk3를 실행하여 한영 전환키를 취향에 맞게 설정한다

[![termdown 스크린샷](/images/Screenshot 2019-05-23 at 1.22.02 PM.png)](/images/Screenshot 2019-05-23 at 1.22.02 PM.png)

crostini에서 한글입력기를 사용하도록 설정변경 : /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf 에 추가]

	Environment="GTK_IM_MODULE=fcitx"
	Environment="QT_IM_MODULE=fcitx"
	Environment="XMODIFIERS=@im=fcitx"

부팅시 fcitx 프로세스가 자동으로 기동되도록 한다 : ~/.sommelierrc 에 추가

	/usr/bin/fcitx-autostart
	
