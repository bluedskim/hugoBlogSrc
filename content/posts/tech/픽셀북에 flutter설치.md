---
title: "픽셀북에 Flutter설치"
tags: ["pixelbook", "픽셀북", "flutter"]
date: 2019-06-24T16:58:23+09:00
draft: true
---

모바일 앱 개발할 때 flutter가 편하다고 해서 픽셀북에서 시도 해보고 있다.

* 참고 https://medium.com/snapp-mobile/turning-the-pixelbook-into-a-great-flutter-development-laptop-db29105cc789 ) 
* java 는 이미 설치되어 있다고 가정한다

#### 리눅스용 Flutter SDK다운로드

https://flutter.dev/docs/get-started/install/linux

#### 압축 해제

	tar xf ~/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz

#### 실행 path에 추가 : ~/.bashrc에 추가한다.
	
	export PATH="/home/bluedskim/utils/flutter/bin:$PATH"
	
#### 환경을 다시 읽어온다.

	$ source ~/.bashrc
	
#### Android Studio 설치

이미 설치되어 있다(여기서 설치 https://developer.android.com/studio/#downloads)	

#### 시스템 라이브러리 설치
	
	sudo apt-get install lib32stdc++6
	
#### 안드로이드 개발 라이센스 동의

아래 명령 실행하고 동의하면 됨
	
	flutter doctor --android-licenses


일단 한번 실행해보니 오류 발생

	  ╔════════════════════════════════════════════════════════════════════════════╗
	  ║                 Welcome to Flutter! - https://flutter.dev                  ║
	  ║                                                                            ║
	  ║ The Flutter tool anonymously reports feature usage statistics and crash    ║
	  ║ reports to Google in order to help Google contribute improvements to       ║
	  ║ Flutter over time.                                                         ║
	  ║                                                                            ║
	  ║ Read about data we send with crash reports:                                ║
	  ║ https://github.com/flutter/flutter/wiki/Flutter-CLI-crash-reporting        ║
	  ║                                                                            ║
	  ║ See Google's privacy policy:                                               ║
	  ║ https://www.google.com/intl/en/policies/privacy/                           ║
	  ║                                                                            ║
	  ║ Use "flutter config --no-analytics" to disable analytics and crash         ║
	  ║ reporting.                                                                 ║
	  ╚════════════════════════════════════════════════════════════════════════════╝


	Doctor summary (to see all details, run flutter doctor -v):
	[!] Flutter (Channel stable, v1.5.4-hotfix.2, on Linux, locale en_US.UTF-8)
		✗ Downloaded executables cannot execute on host.
		  See https://github.com/flutter/flutter/issues/6207 for more information
		  On Debian/Ubuntu/Mint: sudo apt-get install lib32stdc++6
		  On Fedora: dnf install libstdc++.i686
		  On Arch: pacman -S lib32-gcc-libs

	 
	[!] Android toolchain - develop for Android devices (Android SDK version 29.0.0)
		✗ Android licenses not accepted.  To resolve this, run: flutter doctor
		  --android-licenses
	[!] Android Studio (version 3.4)
		✗ Flutter plugin not installed; this adds Flutter specific functionality.
		✗ Dart plugin not installed; this adds Dart specific functionality.
	[!] IntelliJ IDEA Community Edition (version 2019.1)
		✗ Flutter plugin not installed; this adds Flutter specific functionality.
		✗ Dart plugin not installed; this adds Dart specific functionality.
	[!] Connected device
		! No devices available

	! Doctor found issues in 5 categories.
