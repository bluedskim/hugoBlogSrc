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

## 참고

* https://itsze.ro/blog/2018/08/08/quick-note-on-crostini-chinese-ime.html
* https://wiki.debianusers.or.kr/index.php?title=%ED%95%9C%EA%B8%80_%EC%84%A4%EC%A0%95

## 한글폰트 설치

나눔글꼴을 좋아해서 항상 나눔글꼴만 설치한다

	$ apt-get install fonts-nanum

## 한글locale 설치

1. /etc/locale.gen 파일을 편집기로 열어보면 한글 로케일이 comment 되어있다

		#ko_KR.UTF-8 UTF-8

	이 comment를 해제하고 저장한다

		ko_KR.UTF-8 UTF-8
		
1. 로케일을 생성한다

		$ sudo locale-gen 
		Generating locales (this might take a while)...
		  ko_KR.EUC-KR... done
		  ko_KR.UTF-8... done
		Generation complete.
			
## fcitx 한글 입력기  설치

	$ sudo apt-get install fcitx-hangul

이 때 fcitx-config-gtk3 도 같이 설치된다. fcitx-config-gtk3를 실행하여 한영 전환키를 취향에 맞게 설정한다

[![fcitx-config-gtk3](/images/Screenshot 2019-05-23 at 1.22.02 PM.png)](/images/Screenshot 2019-05-23 at 1.22.02 PM.png)

* 설치 후 fcitx 데몬이 기동되지 않는 것 같다. 이때 fcitx-config-gtk3 를 띄웠을 때 input method tab에 아무것도 보이지 않는 증상이 발생한다. 이 때는 수동으로 데몬을 띄워준다.
	
		$ /usr/bin/fcitx-autostart
	
## crostini에서 한글입력기를 사용하도록 설정변경

/etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf 에 추가

	$ sudo vi /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
	...
	Environment="GTK_IM_MODULE=fcitx"
	Environment="QT_IM_MODULE=fcitx"
	Environment="XMODIFIERS=@im=fcitx"

부팅 시 fcitx 프로세스가 자동으로 기동되도록 한다 : ~/.sommelierrc 에 추가(없다면 만든다)

	/usr/bin/fcitx-autostart

terminator에서 한글이 잘 입력된다.

[![terminator에서 한글 입출력](/images/Screenshot 2019-07-31 at 12.42.45 PM.png)](/images/Screenshot 2019-07-31 at 12.42.45 PM.png)

그런데 기본 터미널에 한글 입출력에 문제가 있다 -.-

[![기본 터미널에 한글 입출력에 문제가 있다](/images/Screenshot 2019-07-31 at 12.51.33 PM.png)](/images/Screenshot 2019-07-31 at 12.51.33 PM.png)

그래서  terminator 프로그램을 추천한다.\
https://taufanlubis.wordpress.com/2011/08/15/terminator-%E2%80%93-multiple-gnome-terminals-in-one-window/

(fcitx는ˈfaɪtɪks라고 발음한다고)
