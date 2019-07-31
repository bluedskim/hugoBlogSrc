---
title: "Pixelbook에서 Reaper사용하기"
date: 2019-07-10T17:24:26+09:00
categories: ["음악"]
tags: ["pixelbook", "reaper"]
---

크롬북 리눅스 앱에서 오디오 재생을 지원한것은 얼마되지 않았다.
(OS버전 74부터 지원)

주위에서 리눅스를 쓰는 사람도 없지만 쓴다고 해도 오디오 편집까지 하는 경우를 보지 못했다.
맥의 Logic이나 윈도우의 Cubase, Ableton Live같은 멋진 리눅스용 멀티트랙 녹음 편집 프로그램은 없는 듯 하다

신기하게도 Reaper 는 리눅스용 무설치 버전을 제공하고 있다. 개발자 중에 리눅스 매니아가 있는 듯

http://reaper.fm/download.php#linux_download

[![Reaper](/images/Screenshot 2019-07-10 at 5.13.23 PM.png)](/images/Screenshot 2019-07-10 at 5.13.23 PM.png)


중요한거 하나! 터미널에서 reaper실행 파일을 바로 실행할 수 있는데 아래처럼 조그많게 떠서 알아 볼 수가 없다 -.-

[![조그많게 떠서 알아 볼 수가 없다](/images/Screenshot 2019-07-31 at 1.13.17 PM.png)](/images/Screenshot 2019-07-31 at 1.13.17 PM.png)

해상도가 맞지 않아서인데 이 때 "use low density" 를 활성화 하면 해결되는데 터미널에서 reaper실행 파일을 바로 실행할 경우는 해당 메뉴가 뜨지 않는다.\
이때는 install-reaper.sh를 실행해서 설치를 진행하되  "desktop integration" 을 꼭 해야 한다

아래 설치로그 참조

	bluedskim@penguin:~/Utils/reaper_linux_x86_64$ ./install-reaper.sh 
	REAPER installation script

	PLEASE NOTE -- REAPER for Linux is an unsupported experimental version.

	-------------------------------------------------------------------------------
	Available commands:
	  [V]iew readme-linux.txt and REAPER license agreement

	  [R]un REAPER from /home/bluedskim/Utils/reaper_linux_x86_64/REAPER/reaper

		 You can run REAPER without installing it.
		 Your ~/.config/REAPER/ directory will be used

	  [I]nstall REAPER (you will be prompted for various options)

		 This install script can put the REAPER program into /opt
		 or ~/opt, or a path of your choice, and optionally set
		 up desktop integration (menu items, file associations).

	  [A]dd desktop integration for /home/bluedskim/Utils/reaper_linux_x86_64/REAPER/reaper

		 If you've extracted REAPER into the path you would like
		 it to live in (/home/bluedskim/Utils/reaper_linux_x86_64/REAPER), you can set
		 up desktop integration (menu items, file associations, 
		 etc) via this action.

	Command [V,R,I,A]: I

	Install REAPER
	  [1] Install to /opt (in /opt/REAPER) [will require sudo password entry]
	  [2] Install to /home/bluedskim/opt (in ~/opt/REAPER)

	  Or, enter a path starting with / or ~/ to install to that path
	  (e.g. /foo to install into /foo/REAPER, or ~/foo to install into ~/foo/REAPER)

	Path to install [1,2, or /whatever]: 2

	Would you like to add desktop integration for this install [Y/N]?: Y


	Confirm:
	  Copy files to: /home/bluedskim/opt/REAPER
	  + Perform desktop integration for /home/bluedskim/opt/REAPER/reaper

	Proceed with installation [Y/N]?: Y
	REAPER installer -- install to /home/bluedskim/opt

	Copying files... done
	Writing uninstall script to /home/bluedskim/opt/REAPER/uninstall-reaper.sh
	Installing desktop integration... done

	 *** Installation complete
	 
설치 후 최초 실행 시  audio device setting에서  Pulse Audio를 선택한다.

[![설치 후 최초 실행 시  audio device setting에서  Pulse Audio를 선택한다](/images/Screenshot 2019-07-31 at 2.14.04 PM.png)](/images/Screenshot 2019-07-31 at 2.14.04 PM.png)

현재까지는 특별한 문제 없이 쓰고 있다(물론 무거운 작업을 하고 있지는 않다)

하지만 아직 Chromeos의 리눅스 앱에서 오디오 녹음은 지원하지 않는다고하니 반쪽짜리 앱 -.-

