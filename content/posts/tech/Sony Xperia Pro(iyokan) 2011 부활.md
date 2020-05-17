---
title: "Sony Xperia Pro(iyokan) 2011 부활 프로젝트"
date: 2020-05-01T12:03:18+09:00
categories: ["tech"]
tags: ["android", "Sony Xperia Pro", "qwerty phone"]
draft: false
---

미니 slide out qwerty 디바이스에 대한 로망은 식지 않는다. 하지만 대세는 터치 인터페이스라 더 이상 이런 스타일의 기기는 구할래야 구할 수가 없다. 그렇다면 서랍속에서 곤히 잠자는 그때 그 기기에게 새 생명을 불어넣어 보자. 

#### Sony Xperia Pro(2011) 코드명 'iyokan'

적당한 사이즈의 slide out qwerty android phone. 하지만 치명적 약점이 있는데

* 사용자 앱 설치 공간이 500메가 정도 밖에 되지 않는다.
* RAM도 역시 500메가 정도라 큰 프로그램을 돌릴 수 없다.
* cpu가 1core 1Ghz라서 무거운 프로그램을 돌릴 수 없다.
* 공식 지원 안드로이드 버전이 4.0.4 아이스크림 샌드위치(Ice Cream Sandwich) 로 상당히 낮다. 카카오톡도 설치되지 않는다(확인 결과 Kitkat에도 설치되기는 하는데 최신판으로 업그레이드 하라고 메시지가 뜬다. 최신판은 android 5 이상만 지원한다 -.- 텔레그램 씁시다)

{{< figure src="/images/IMG_0731.JPG" caption="(Xperia Pro의 공식 마지막 안드로이드 버전 4.0.4 Ice Cream Sandwich)" >}}

하지만 다행히도 능력자들이 마시멜로(Marshmallow)-Android 6.0 까지 커스텀 롬을 만들었다! 하지만 롤리팝(Lollipop)-Android 5.0 이후로는  512RAM 기기의 경우 최적화가 되어 있지 않아 쾌적하게 사용할 수 없다고 한다.
(https://github.com/LegacyXperia/Wiki/wiki/Installing-LegacyXperia-for-Dummies)

그래서 Android 4.4 Kitkat으로 업그레이드를 하였다.

#### 공개된 롬 목록

여기 https://forum.xda-developers.com/showthread.php?t=1642480 에 사용가능한  ROM 목록들이 있다.

* __LegacyXperia__ : 가장 유명한 프로젝트인 듯. 롬파일을 다운로드 할 수가 없다. 사이트 다운 된 듯 -.- 구글링하여 예전 버전 롬을 찾아 설치는 성공했지만 호환되는 Gapps를 찾지 못해 무용 지물.
* Unofficial Carbon Rom : 다운로드 불가
* ___AOSB Project___ : 사이트는 사라졌지만 롬파일은 구할 수 있음. 설치 성공
	* https://www.mediafire.com/folder/bqea4oqt4wmc1/AOSB
	* http://www.mediafire.com/file/67ey3nkl5s28pky/Slim_AIO_gapps.4.4.2.zip/file
* __VanirAOSP__ : 사이트 접속 불가. 롬 다운로드 불가
* __Resurrection Remix__ : 설치 성공하였으나 호환 가능한 Gapps를 찾지 못함. 반응 속도가 느림
	* 안드로이드 버전 4.4.2
	* 사이트도 살아있음
	* 롬 다운로드 가능 https://androidfilehost.com/?w=files&flid=14317
* PHD Rom : 개인 작업인 듯. 별로 믿음이 안감 -.-
* iyokanLX : 개인 작업인 듯. 호환가능한 GApps 찾지 못함
	* 롬 다운로드 https://androidfilehost.com/?fid=95747613655046171
* AOKP : 롬 다운로드 불가

#### AOSB 설치

위의 롬들 중 AOSB 롬이 Gapps까지 깔끔하게 설치 가능하고 반응속도도 제일 빠르다.

1. 준비물
	1. Xperia Pro(배터리를 100% 충전 후 진행! 가능하면 컴퓨터에 연결해서 충전하면서 진행하는게 좋음)
	1. USB케이블
	1. 컴퓨터 : fastboot에서 kernel 설치 시 필요
	2. SD카드 : 설치한 앱들을 SD카드로 옮길 예정이므로 속도가 빠를수록 좋다. 최소 2G는 되어야 할 듯
1. 다운로드
	1. ROM : http://www.mediafire.com/file/w9kbvhw97dklnja/20140224-UNOFFICIAL-AOSB-iyokan.zip/file
	1. Gapps : http://www.mediafire.com/file/67ey3nkl5s28pky/Slim_AIO_gapps.4.4.2.zip/file
1. ROM 압축해제(커널 플래싱 할 때 사용예정)
1. sd카드에 ROM 과 Gapps복사(압축된 상태로)한 후 전화기에 꼽는다.
1. unlock 코드 받기
	1. unlock 코드를 발급받아서 이후에 사용할 것이므로 잘 복사해둔다
	1. 발급 주소 : https://developer.sony.com/develop/open-devices/get-started/unlock-bootloader/#unlock-code
1. unlock 하기 : android 툴을 설치해야 한다(아래는 모두 pixelbook에서 진행했으며 윈도우즈에서는 다운받아 설치해야 한다) 
	
	* 다운로드 주소 : https://developer.android.com/studio/releases/platform-tools

	1. 툴 설치 
	
		{{< highlight bash >}}
$ sudo apt install android-tools-fastboot
$ sudo apt install android-sdk-platform-tools-common
{{< / highlight >}}

	1. fastboot으로 폰 시작하기
	
		1. 전원을 끈다
		1. 메뉴 키를 누른 상태에서 usb를 연결한다. 이 때 상태 LED는 파란색으로 켜진다		
		1. fastboot으로 연결되었는지 확인. "fastboot devices" 명령을 입력했을 때 아래처럼 기기명이 출력되어야 한다
		
			{{< highlight bash >}}
$ fastboot devices
CB5A1GSVH8&ZLP	fastboot
{{< / highlight >}}
	
	1. unlock 하기
	
		{{< highlight bash >}}
$ fastboot oem unlock 0x발급받은unlock코드
...
(bootloader) Unlock phone requested
(bootloader) Erasing block 0x00001300
...
(bootloader) Erasing block 0x00001f00
OKAY [  4.461s]
finished. total time: 4.461s
{{< / highlight >}}


1. 커널 플래싱

	{{< highlight bash >}}
$ fastboot flash boot ROM압축을_해제한_경로/boot.img

target didn't report max-download-size
sending 'boot' (8576 KB)...
(bootloader) USB download speed was 148844kB/s
OKAY [  1.000s]
writing 'boot'...
(bootloader) Download buffer format: boot IMG
(bootloader) Flash of partition 'boot' requested
(bootloader) S1 partID 0x00000003, block 0x00000280-0x000002e3
(bootloader) Erase operation complete, 0 bad blocks encountered
(bootloader) Flashing...
(bootloader) Flash operation complete
OKAY [  1.681s]
finished. total time: 2.681s
{{< / highlight >}}

1. 롬 & GApps 설치
	1. 리커버리 모드로  부팅

		{{< highlight bash >}}
$ fastboot reboot
rebooting...

finished. total time: 0.317s
{{< / highlight >}}

	1. 기기가 리부팅 되면서 로고가 뜬다. 이 때 1초에 한번 씩 볼륨다운 버튼을 눌러주면 리커버리 모드로 진입된다.
	
		{{< figure src="/images/IMG_0733.JPG">}}
		
		메뉴 이동은 볼륨 키, 선택은 home 키, 상위 메뉴로 이동은 back 키
		
	1. 초기화 
		
		1. 선택 : mounts and storage
			* Format /system
				{{< figure src="/images/IMG_0734.JPG">}}
			* Format /data
			* Format /cache
			
		1. Wipe Data / Factory Reset

	1. 롬 설치
		* 선택 : Install .zip
		* /Storage/SDcard0 에서 20140224-UNOFFICIAL-AOSB-iyokan.zip 선택
		
		
	1. GApps 설치 설치
		* 선택 : Install .zip
		* /Storage/SDcard0 에서 Slim_AIO_gapps.4.4.2.zip 선택
		
		
	1. 리부팅 : 메인 메뉴로 돌아가서 Reboot system now 선택

#### 필수 앱

리부팅하면 기기가 다시 시작되는데 부팅 로고가 뜬 후 몇 분 정도 걸린다. 초기 세팅을 마치면 필수앱을 바로 설치하자.

{{< figure src="/images/IMG_E0738.JPG" caption="(설치된 안드로이드 버전은 4.4.2 Kitkat이다)">}}

1. Link2SD
	* 가장 먼저 설치해야 하는 앱이다. xperia pro는 저장 공간이 500 메가 정도 밖에 안되기 때문에 프로그램 설치 후 SD 카드로 옮겨줘야 한다.
	* 다운로드 주소 :  https://play.google.com/store/apps/details?id=com.buak.Link2SD
1. 도돌 키보드
	* 물리 키보드에서 한글을 입력하기 위해 필요. 다른 키보드를 사용해도 한글 입력은 할 수 있지만 한영 전환을 쉽게 하기 위해서 필수다(1.67 버전만 정상 동작하는 듯 하다)
	* 다운로드 주소 : https://play.google.com/store/apps/details?id=com.fiberthemax.OpQ2keyboard
* 그 외에 필요한 앱이 있다면 사이즈가 큰 것부터 설치하고 Link2SD 로 SD카드로 옮겨준다.

#### 오버클럭 하기

*  장착된 CPU 원래의 클럭 속도 1Ghz에서 1.4Ghz까지 오버클럭 가능하다. 배터리 소모는 좀 있지만 쾌적한 사용을 위해 시도해볼 만하다.
* 설정 > Performance 에서 Profile을 'Performance'로 선택한다.

#### 사용 후기

Kitkat 업그레이드 & 오버클럭 후 체감 속도는 2배 이상  빨라졌다.

이런 폼팩터에 램1G, 듀얼코어 CPU만 장착 되었어도 정말 쓸만한  기기가 되었을 텐데 하는 아쉬움이 있다. 하지만  텔레그램 채팅과 터미널 접속용으로는 최상이다.

{{< figure src="/images/IMG_E0736.JPG" caption="텔레그램" >}}

{{< figure src="/images/IMG_E0735.JPG" caption="Juice SSH 터미널 앱" >}}

{{< figure src="/images/nibbles.JPG" caption="지렁이 게임 Nibbles" >}}

{{< figure src="/images/bastet.JPG" caption="Juice SSH 터미널 앱으로 서버 접속 후 터미널용 tetris clon인 bastet 실행" >}}
