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
	
	
	
---
title: "Pixelbook에서 Flutter로 앱 개발"
date: 2019-07-31T15:14:43+09:00
draft: true
---

* 참고 URL : https://flutter.dev/docs/get-started/install/linux

## flutter 설치

* 최신 SDK 다운로드  : https://flutter.dev/docs/development/tools/sdk/releases?tab=linux
* 적당한 위치에 압축 해제

	cd ~/Utils
	tar xf ~/Downloads/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz
	
* flutter 경로를 path에 추가	

	export PATH="$PATH:`pwd`/flutter/bin"

그런데 위의 방식은 터미널을 새로 열때 마다 해야 하기 때문에 ~/.bashrc에 아래의 라인을 추가하는 것이 편하다

	PATH="$PATH:/home/<user>/Utils/flutter/bin"

* 가이드에 의하면 flutter설치 후 바로 각종 추가 파일들을 다운로드pre-download 하라고 하는데 필요할 때 알아서 다운로드 하므로 미리 할 필요 없을 듯

* flutter 진단doctor 하기
flutter 개발환경이 준비되었는지 확인하는 기능이다. 4가지 문제 발견!

	bluedskim@penguin:~$  flutter doctor
	Doctor summary (to see all details, run flutter doctor -v):
	[!] Flutter (Channel stable, v1.7.8+hotfix.4, on Linux, locale en_US.UTF-8)
		✗ Downloaded executables cannot execute on host.
		  See https://github.com/flutter/flutter/issues/6207 for more information
		  On Debian/Ubuntu/Mint: sudo apt-get install lib32stdc++6
		  On Fedora: dnf install libstdc++.i686
		  On Arch: pacman -S lib32-gcc-libs

	[✗] Android toolchain - develop for Android devices
		✗ Unable to locate Android SDK.
		  Install Android Studio from: https://developer.android.com/studio/index.html
		  On first launch it will assist you in installing the Android SDK components.
		  (or visit https://flutter.dev/setup/#android-setup for detailed instructions).
		  If the Android SDK has been installed to a custom location, set ANDROID_HOME to that location.
		  You may also want to add it to your PATH environment variable.

	[!] Android Studio (not installed)
	[!] Connected device
		! No devices available

	! Doctor found issues in 4 categories.

From the download Android Studio page, in the download options, look for “Command line tools only”: 

* unstalling android studio
rm -rf ~/.android/
rm -rf ~/Android/
rm -rf ~/.AndroidStudio3.4/
and delete the extracted folder.

--------------------------------

android studio 없이  해본다 https://medium.com/snapp-mobile/turning-the-pixelbook-into-a-great-flutter-development-laptop-db29105cc789

sdkmanager --list

sdkmanager "build-tools;29.0.1" "emulator" "tools" "platform-tools" "platforms;android-29" "extras;google;google_play_services" "extras;google;webdriver" "system-images;android-29;google_apis_playstore;x86_64"

export PATH="$PATH:~/Utils/flutter/bin"
export PATH="$PATH:~/Utils/android-sdk/tools/bin"
export PATH="$PATH:~/Utils/android-sdk/platform-tools"
export ANDROID_HOME="/home/bluedskim/Utils/android-sdk"

flutter doctor --android-licenses

https://code.visualstudio.com/docs/?dv=linux64_deb

Failed to launch emulator: emulator: ERROR: x86_64 emulation currently requires hardware acceleration!
Please ensure KVM is properly installed and usable.
CPU acceleration status: KVM requires a CPU that supports vmx or svm
More info on configuring VM acceleration on Linux:
https://developer.android.com/studio/run/emulator-acceleration#vm-linux
General information on acceleration: https://developer.android.com/studio/run/emulator-acceleration.
statvfs('/home/bluedskim/.android/avd/flutter_emulator.avd/snapshots/default_boot/ram.img') failed: No such file or directory


https://support.elix.sr/#!/products/fwd/answers/Getting_started_with_fwd
	
