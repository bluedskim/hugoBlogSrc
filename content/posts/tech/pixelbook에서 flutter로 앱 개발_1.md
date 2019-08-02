---
title: "Pixelbook에서 Flutter로 앱 개발"
date: 2019-07-31T15:14:43+09:00
tags: ["Pixelbook", "Flutter", "Visual Studio Code"]
draft: false
---

픽셀북으로 안드로이드 개발을 편하게 할 수 있다고 해서 시도하고 있는데
편하다고 하는 이유는 픽셀북에서 바로 안드로이드 앱 화면을 띄울 수 있기 때문인것 같다.
그러나 그러기 위해서는 픽셀북을 Developer Mode 로 기동해야 하는데 이렇게 하면 3가지 문제가 있다.

1. 보안이 해제된다 : 무섭다
1. 시스템이 불안해진다 : 짜증 나다가 화가 나다가 최신 노트북 가격을 비교 하고 있는 나를 발견하면 구글이 미워지기 시작한다
1. cold 부팅 시 마다 Developer Mode 로 진입해줘야 한다 : 귀찮다.

그래서 약간(?) 불편하지만 실제 폰으로 테스트 하는 방법을 쓰기로 했다.

* 참고 : https://flutter.dev/docs/get-started/install/linux
* 참고 : https://medium.com/snapp-mobile/turning-the-pixelbook-into-a-great-flutter-development-laptop-db29105cc789

## 전제조건
* 픽셀북에 Linux Apps 활성화(모든 명령어들은 리눅스 터미널에서 실행)
* 픽셀북에 Google Play Store 활성화(앱을 하나 설치해야 함. 이유는 아래에서 확인 -.-)
* 픽셀북과 같은 네트워크에 wifi로 접속된 안드로이드 폰(개발자모드 활성화 필수)
* 끝까지 한번 읽어보시고 작업하세요.

## 순서
1. Flutter 설치
1. Android SDK Tools 와 Android SDK 설치
1. fwd 설치 & 개발용 android device에 개발자 모드 활성화 & adb connect over wifi
1. Visual Studio Code 와 Flutter extensions 설치

## flutter 설치

1. 최신 SDK 다운로드  : https://flutter.dev/docs/development/tools/sdk/releases?tab=linux
1. 적당한 위치에 압축 해제

		cd ~/Utils
		tar xf ~/Downloads/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz
	
1. flutter 경로를 path에 추가 : ~/.bashrc파일에 아래의 라인을 추가하는 것이 편하다

		PATH="$PATH:/home/My/Utils/flutter/bin"

* 가이드에 의하면 flutter설치 후 바로 각종 추가 파일들을 다운로드pre-download 하라고 하는데 필요할 때 알아서 다운로드 하므로 미리 할 필요 없을 듯

## Android SDK Tools 와 Android SDK 설치

1. Android SDK 용 폴더 생성

		mkdir ~/Utils/android-sdk
		cd ~/Utils/android-sdk

1. 명령행 툴 받기 : https://developer.android.com/studio/#downloads 에서  “Command line tools only” 의 리눅스 버전을 받는다.
* 혹은 '19.08.02 현재 최신버전을 wget으로 받기

		wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip

1. 압축을 해제 한다.

		unzip android-studio-ide-182.5264788-linux.zip
	
1. ~/.bashrc파일에 path 추가

		export PATH="$PATH:~/Utils/android-sdk/tools/bin"

1. sdkmanager 로  필요한  SDK 받기 : 각각의 버전 번호는 '19.08.02 현재 최신 버전인데 버전업 될 수 있으니 확인 후 최신버전을 받자. 

		sdkmanager "build-tools;29.0.1" "tools" "platform-tools" "platforms;android-29" "extras;google;google_play_services" "extras;google;webdriver" "system-images;android-29;google_apis_playstore;x86_64"
	
	sdk목록과 버전 확인 방법

		sdkmanager --list

1. ~/.bashrc파일에 path 추가

		export PATH="$PATH:~/Utils/android-sdk/platform-tools"
	
1. ~/.bashrc파일에  ANDROID_HOME 시스템 변수 추가

		export ANDROID_HOME="/home/bluedskim/Utils/android-sdk"
	
1. 지금까지 설정한 시스템 변수를 적용한다	
	
		. ~/.bashrc
	
1. Android 라이센스 동의

		flutter doctor --android-licenses
	
## fwd 설치 & 개발용 android device에 개발자 모드 활성화 & adb connect over wifi	
	
우리는 픽셀북을 개발자모드를 켜지 않았다. 그래서 픽셀북에서 바로 안드로이드 앱을 테스트 할 수 없고 실제 안드로이드 폰에 adb로 연결 후 디버깅할 것이다.
그러기 위해서는 usb케이블로 폰을 연결하던지 wifi와 adb를 이용해서 연결 하는 방법이 있다.
케이블 없는 개발을 위해 wifi와 adb를 이용해서 폰에 연결하도록 한다.
이때 문제는 픽셀북의 리눅스는 가상머신이기 때문에 폰과 같은 LAN에 있더라도 직접 접근이 불가능하다는 것이다.
그래서 fwd라고 하는 안드로이드용 포트 포워딩 앱을 통해서 폰으로 연결할 것이다(굳이 이렇게 까지?)

* fwd 설치

	https://play.google.com/store/apps/details?id=com.elixsr.portforwarder&hl=en&rdid=com.elixsr.portforwarder
	
* fwd 설정

	폰의 ip를 알아내는 방법은 폰마다 틀릴 수 있다. 일반적으로 현재 접속된 wifi의 속성을 보면 알 수 있다. 이 아이피를 설정에 추가해줘야 한다(이 아이피는 바뀔 수 있다!)

	[![fwd 설정](/images/Screenshot 2019-08-02 at 11.46.59 AM.png)](/images/Screenshot 2019-08-02 at 10.03.53 AM.png)
	
	fwd 를 시작한다
	
	[![fwd 설정](/images/Screenshot 2019-08-02 at 10.03.53 AM.png)](/images/Screenshot 2019-08-02 at 10.03.53 AM.png)

* adb 연결 & 폰에서 연결 수락

		adb connect 100.115.92.2:5554

	이렇게 하면 폰에서 연결 수락 요청 팝업이 뜬다. 연결을 수락하자.

	그 후 연결된 기기 목록을 조회하면 해당 폰 정보가 뜬다.
	
		adb devices -l
		List of devices attached
		100.115.92.2:5554      device product:kltektt model:SM_G900K device:kltektt transport_id:1
	
## Visual Studio Code 와 Flutter extensions 설치	

여기서 다운로드 하자 https://code.visualstudio.com/docs/?dv=linux64_deb

리눅스 터미널에서 설치하거나

	sudo apt install ./code_1.36.1-1562627527_amd64.deb
	
탐색기에서 더블클릭하면 바로 설치할 수도 있다	

설치가 끝나면 터미널에서 실행하자. 실행 명령어는 code

	code

실행 후에는 공식가이드에 따라 Flutter extensions을 설치한다
https://flutter.dev/docs/get-started/editor?tab=vscode

설치 후에는 테스트용 앱을 띄워보자
https://flutter.dev/docs/get-started/test-drive?tab=vscode

[![vs code](/images/IMG_20190802_120659_410.jpg)](/images/IMG_20190802_120659_410.jpg)
