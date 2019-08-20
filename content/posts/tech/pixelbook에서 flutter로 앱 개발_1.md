---
title: "Pixelbook에서 Flutter로 앱 개발"
categories: ["tech"]
date: 2019-07-31T15:14:43+09:00
tags: ["Pixelbook", "Flutter", "Visual Studio Code"]
draft: false
---

픽셀북으로 안드로이드 개발을 편하게 할 수 있다고 해서 시도하고 있는데
편하다고 하는 이유는 픽셀북에서 바로 안드로이드 앱 화면을 띄울 수 있기 때문인것 같다.
그러나 그러기 위해서는 픽셀북을 Developer Mode 로 변경해야 하는데 이렇게 하면 3가지 문제가 있다.

1. 보안이 해제된다 : _무섭다_
1. 시스템이 불안해진다 : _짜증 나다가 화가 나다가 최신 노트북 가격을 비교 하고 있는 나를 발견하면 구글이 미워지기 시작한다_
1. cold 부팅 시 마다 Developer Mode 로 진입해줘야 한다 : _귀찮다_

그래서 약간(?) 불편하지만 실제 폰으로 테스트 하는 방법을 쓰기로 했다.

* 참고 : https://flutter.dev/docs/get-started/install/linux
* 참고 : https://medium.com/snapp-mobile/turning-the-pixelbook-into-a-great-flutter-development-laptop-db29105cc789

## 전제조건
* 픽셀북에 Linux Apps 활성화(모든 명령어들은 리눅스 터미널에서 실행)
* 픽셀북과 같은 네트워크에 wifi로 접속된 안드로이드 폰(개발자모드 활성화 필수)
* 끝까지 한번 읽어보시고 작업하세요.

## 순서
1. Flutter 설치
1. Android SDK Tools 와 Android SDK 설치
1. 안드로이드 폰과 adb로 연결
1. Visual Studio Code 와 Flutter extensions 설치

## flutter 설치

1. 최신 SDK 다운로드  : https://flutter.dev/docs/development/tools/sdk/releases?tab=linux
1. 적당한 위치에 압축 해제

		$ cd ~/dev
		$ tar xf ~/Downloads/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz
	
1. flutter 경로를 path에 추가 : ~/.bashrc파일에 아래의 라인을 추가하는 것이 편하다

		export PATH="$PATH:/home/My/dev/flutter/bin"

* 가이드에 의하면 flutter설치 후 바로 각종 추가 파일들을 다운로드pre-download 하라고 하는데 필요할 때 알아서 다운로드 하므로 미리 할 필요 없을 듯

## Java 설치

왜 Java가 필요하냐고? Android sdkmanager 가 Java인 듯 -.- 어차피 설치할 Java라면 지금 설치하자.

최신 Java를 설치해도 되지만 나는 1.8 버전이면  충분하기 때문에 1.8을 설치하겠다. 그리고 OpenJDK보다 OracleJDK가 빠르다고 하니 OracleJDK를 설치하겠다.

Tharanga 란 분이 Github에 설치 스크립트를 공유해 주셔서 이것을 사용하려 한다. uninstall 스크립트도 제공해준다고 좋지 아니한가

https://github.com/chrishantha/install-java

1. 설치 스크립트 다운로드

		$ wget https://raw.githubusercontent.com/chrishantha/install-java/master/install-java.sh

1. JDK 다운로드

	jdk-8u212-linux-x64.tar.gz를 여기에서 다운로드 받자.
	https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8u211-later-5573849.html 

1. 암호화 확장 기능 다운로드

	암호화 확장 기능은 Java 개발시에만 필요한 기능이지만 Pixelbook에서 Java개발에 필요할거 같아 가이 설치했다. 
	jce_policy-8.zip 는 여기에서 다운로드 한다.
	https://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html

1. 설치 스크립트 실행

	다운로드한 3개의 파일은 모두 하나의 폴더에 있어야 한다. 
	
	설치 중 선택사항을 물어보는데 모두 Y로 했다.
	
		$ sudo ./install-java.sh -f ./jdk-8u212-linux-x64.tar.gz

## Android SDK Tools 와 Android SDK 설치

1. Android SDK 용 폴더 생성

		$ mkdir ~/dev/android-sdk
		$ cd ~/dev/android-sdk

1. 명령행 툴 받기 : https://developer.android.com/studio/#downloads 에서  “Command line tools only” 의 리눅스 버전을 받거나  '19.08.02 현재 최신버전을 wget으로 받을 수 있다.

		$ wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip

1. 압축을 해제 한다.

		$ unzip android-studio-ide-182.5264788-linux.zip
	
1. ~/.bashrc파일에 path 추가

		export PATH="$PATH:/home/My/dev/android-sdk/tools/bin"

1. sdkmanager 로  필요한  SDK 받기 : 각각의 버전 번호는 '19.08.02 현재 최신 버전인데 버전업 될 수 있으니 확인 후 최신버전을 받자. 

		$ sdkmanager "build-tools;29.0.1" "tools" "platform-tools" "platforms;android-29" "extras;google;google_play_services" "extras;google;webdriver" "system-images;android-29;google_apis_playstore;x86_64"
	
	sdk목록과 버전 확인 방법

		$ sdkmanager --list

1. ~/.bashrc파일에 path 추가

		export PATH="$PATH:~/Utils/android-sdk/platform-tools"
	
1. ~/.bashrc파일에  ANDROID_HOME 시스템 변수 추가

		export ANDROID_HOME="/home/bluedskim/Utils/android-sdk"
	
1. 지금까지 설정한 시스템 변수를 적용한다	
	
		$ . ~/.bashrc
	
1. Android 라이센스 동의

		$ flutter doctor --android-licenses
		
## lib32stdc++6 설치
	
여기까지 하고 flutter doctor 를 실행해보면 "Downloaded executables cannot execute on host" 라면서 불평을 한다. lib32stdc++6를 설치하자.

	$ sudo apt-get install lib32stdc++6
	
## 안드로이드 폰과 연결
	
우리는 픽셀북을 개발자모드를 켜지 않았다. 그래서 픽셀북에서 바로 안드로이드 앱을 테스트 할 수 없고 실제 안드로이드 폰에 adb로 연결 후 디버깅할 것이다.
그러기 위해서는 usb케이블로 폰을 연결하던지 wifi와 adb를 이용해서 연결 하는 방법이 있다.
케이블 없는 개발을 위해 wifi와 adb를 이용해서 폰에 연결하도록 한다.

* 해당 폰을 wifi로 디버깅 가능하도록 설정변경 

	최소 한번은 해당 폰과 usb로 연결해야 한다. 연결 후 다음 명령을 실행한다.

		$ adb tcpip 5555
		
	[![최소 한번은 해당 폰과 usb로 연결해야 한다](/images/IMG_20190803_105402.jpg)](/images/IMG_20190803_105402.jpg)

* adb over wifi 연결

		$ adb connect 해당폰의_내부ip:5554

	연결된 기기 목록을 조회하면 해당 폰 정보가 뜬다.
	
		$ adb devices -l
		List of devices attached
		해당폰의_내부ip:5554      device product:kltektt model:SM_G900K device:kltektt transport_id:1
	
## Visual Studio Code 와 Flutter extensions 설치	

여기서 다운로드 하자 https://code.visualstudio.com/docs/?dv=linux64_deb

리눅스 터미널에서 설치하거나

	$ sudo apt install ./code_1.36.1-1562627527_amd64.deb
	
탐색기에서 더블클릭하면 바로 설치할 수도 있다	

설치가 끝나면 터미널에서 실행하자. 실행 명령어는 code

	$ code

혹은 바로가기를 클릭한다. 

실행 후에는 공식가이드에 따라 Flutter extensions을 설치한다
https://flutter.dev/docs/get-started/editor?tab=vscode

설치 후에는 테스트용 앱을 띄워보자
https://flutter.dev/docs/get-started/test-drive?tab=vscode

[![vs code](/images/IMG_20190802_120659_410.jpg)](/images/IMG_20190802_120659_410.jpg)

* 아직 크롬북 리눅스 앱에서 scaling 문제로 화면이 흐릿하게 보이는 문제가 있다 -.- 다행히도 vs code 는 자체적으로  scaling 할 수 있는 옵션을 제공한다. vs code의 바로가기에 이 옵션을 추가면 쨍쨍한 화면을 볼 수 있다. /usr/share/applications/code.desktop 을 열어서  --force-device-scale-factor=2 인수를 추가한다

		[Desktop Entry]
		Name=Visual Studio Code
		Comment=Code Editing. Redefined.
		GenericName=Text Editor
		Exec=/usr/share/code/code --force-device-scale-factor=2 --unity-launch %F
		Icon=com.visualstudio.code
		Type=Application
		StartupNotify=false
		StartupWMClass=Code
		Categories=Utility;TextEditor;Development;IDE;
		MimeType=text/plain;inode/directory;
		Actions=new-empty-window;
		Keywords=vscode;

		X-Desktop-File-Install-Version=0.23

		[Desktop Action new-empty-window]
		Name=New Empty Window
		Exec=/usr/share/code/code --force-device-scale-factor=2 --new-window %F
		Icon=com.visualstudio.code

* Flutter 공부를 하던 중 '나에게 이 기술이 꼭 필요할까' 라는 질문에 도달하게 되었다. 딱히 잘하는 것도 없으면서 하고 싶은 것은 참 많기는 한데  GUI(Graphical User Interface)쪽은 내 분야가 아니라는 생각이 들었다. 적어도 앞으로는. 이제는 선택과 집중이 필요할 때.
