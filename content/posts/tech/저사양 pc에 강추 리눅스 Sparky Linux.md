---
title: "저사양 Pc에 강추 리눅스 Sparky Linux"
date: 2019-11-02T02:14:20+09:00
draft: true
---



hibernate 후 resume 안될 때 참고

https://unix.stackexchange.com/a/410971/380108

하여 GRUB_CMDLINE_LINUX_DEFAULT 의 제일 마지막에 nokaslr 옵션을 추가하고

	#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=9449b1a5-f2c1-4116-a1f3-6b10e63728ef"
	GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=9449b1a5-f2c1-4116-a1f3-6b10e63728ef nokaslr"

update-grub 하면 잘 된다.

	sudo update-grub 
