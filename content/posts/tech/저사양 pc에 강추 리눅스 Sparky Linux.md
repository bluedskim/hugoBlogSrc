---
title: "저사양 Pc에 강추 리눅스 Sparky Linux"
categories: ["tech"]
date: 2019-11-02T02:14:20+09:00
tags: ["sparkylinux","linux"]
draft: false
---

## 32bit 노트북에 SparkyLinux 설치

설치한 모델은 MSI vr420x이다. 2008년에 구입한 모델

* Intel Pentium Dual Core T2330 (1.6GHz / 1MB / FSB 533MHz)
* 2GB DDR2 667Mhz

이 노트북에 설치한 리눅스  OS중에 가장 쾌적하다.

[![screenShootvr420.png](/images/screenShootvr420.png)](/images/screenShootvr420.png)

### hibernate 후 resume 안될 때 참고

https://unix.stackexchange.com/a/410971/380108

하여 GRUB_CMDLINE_LINUX_DEFAULT 의 제일 마지막에 nokaslr 옵션을 추가하고

	#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=9449b1a5-f2c1-4116-a1f3-6b10e63728ef"
	GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=9449b1a5-f2c1-4116-a1f3-6b10e63728ef nokaslr"

update-grub 하면 잘 된다.

	sudo update-grub 

## Winbook TW801에 SparkyLinux 설치

노트북에 설치할 때와 방식은 동일하다.

* usb에 설치 성공
* SD카드에 설치 후 부팅 실패.
* 내장 MMC에 설치하려 했으나 파티션 생성 실패 -.- 윈도우 설치 파티션을 줄이고 리눅스파티션을 만드려고 했으나 2.7g 밖에 확보 못했다. 
다른 툴을 쓰면 가능하다고 하는데 굳이 그렇게까지 하고싶지는 않아서


안되는 것들

* bluetooth 안됨
* battery 상태 확인 불가
* hibernate 안됨
* 화면에서 터치로 마우스 오른쪽 클릭 안됨. 왼쪽 클릭, 드래그는 됨

[![screenShotTW801.png](/images/screenShotTW801.png)](/images/screenShotTW801.png)
