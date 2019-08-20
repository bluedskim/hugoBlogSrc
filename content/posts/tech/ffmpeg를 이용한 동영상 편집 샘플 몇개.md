---
title: "ffmpeg를 이용한 동영상 편집 샘플 몇개"
date: 2019-08-20T17:06:05+09:00
categories: ["tech"]
tags: ["ffmpeg"]
draft: false
---

자르기, 스크린샷 찍기같은 간단한 동영상 편집은 GUI프로그램보다 명령행 툴 ffmpeg가 훨씬 편하다.

* 동영상에서 초당 하나씩 스크린샷 찍기. 스크린샷 파일명에 자동으로 3자리수 숫자를 붙힌다. ex) thumb001.png, thumb002.png...
	
		ffmpeg -i 동영상.mp4 -vf fps=1 thumb%04d.png

* 동영상을 일정한 분량(30분)으로 쪼개기. 쪼갠 동영상 파일명에 자동으로 1자리수 숫자를 붙힌다. ex) 동영상_1.mp4, 동영상_2.mp4...
	
		ffmpeg -i 동영상.mp4 -c copy -map 0 -segment_time 00:30:00 -f segment 동영상_%01d.mp4

* 동영상에서 특정 시간 구간만 따로 저장하기. 19초에서 29초까지 따로 저장하고자 할 때
	
		ffmpeg -ss 00:00:19 -i 동영상.MP4 -t 00:00:29 -vcodec copy -acodec copy 해당구간동영상.MP4
