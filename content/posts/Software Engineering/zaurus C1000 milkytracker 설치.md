+++
title = "zaurus C1000 milkytracker 설치"
date = "2007-05-12T12:26:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="zaurus C1000 milkytracker 설치@@**@@http://shed.egloos.com/1565193"></span>음악 신디사이저, 샘플러, 작곡 프로그램인
<br>
<br>milkytracker 설치법입니다. (자세한 정보는 http://www.milkytracker.net/?ABOUT)
<br>
<br>www.milkytracker.net 에서 다운로드 받은 ipk만 설치해서는 동작하지 않습니다.
<br>(SL5500용이라서 그렇다고 하는데 5500에서도 동작하지 않더군요)
<br>
<br>문제는
<br>
<br>1. 화면이 뒤집혀서 실행됨 : 강제로 rotation 시켜 해결
<br>2. 화면이 뜨는 순간 자우루스 다운됨 : 설치시 같이 제공되는 libSDL 문제인듯. Dosbox(zaurus 용) 설치시 같이 제공되는 libSDL 사용하여 해결.
<br>
<br>
<br>
<설치환경>
 <br>
 <br>- Rom : NYMPH Zaurus Qtopia ROM 060801600
 <br>
 <br>- Zaurus C1000
 <br>
 <br>
 <br>
 <설치 순서>
  <br>
  <br>1. 첨부한 milkytracker_0.90.50_arm.ipk 를 설치합니다. 'Applications' 탭에 MilkyTracker 아이콘이 생깁니다.
  <br>
  <br>2. MilkyTracker 아이콘을 꾹 누르고 있으면 세부옵션 창이 뜹니다. '어플리케이션을 qvga(320x240)에 최적화 시켜서 실행합니다' 를 선택합니다.
  <br>
  <br>3. /home/QtPalmtop/bin/milkytracker_execute.sh 를 아래와 같이 편집합니다.
  <br>
  <br>#!/bin/bash
  <br>/home/milkytracker.net/bin/MilkyTracker -bpp 16 -orientation ROTATE90CW
  <br>
  <br>(잘 보시면 원본 파일에서 ROTATE 부분만 수정하시면 됩니다. 이걸 수정하지 않으면 화면이 뒤집혀서 보입니다.)
  <br>
  <br>4. /home/milkytracker.net/lib/libSDL-1.2.so.0 을 삭제합니다.
  <br>
  <br>5. 첨부한 libSDL-1.2.so.0.7.1 를 /home/milkytracker.net/lib/ 아래에 넣습니다.
  <br>
  <br>6. 터미널에서 아래와 같이 입력해서 링크를 걸어줍니다.
  <br>
  <br>ln -s /home/milkytracker.net/lib/libSDL-1.2.so.0.7.1 /home/milkytracker.net/lib/libSDL-1.2.so.0
  <br>
  <br>
  <br>
  <a href="http://pds5.egloos.com/pds/200705/12/82/milkytracker_0.90.50_arm.ipk">milkytracker_0.90.50_arm.ipk</a>
  <br>
  <br>
  <a href="http://pds5.egloos.com/pds/200705/12/82/libsdl-1.2.so.0.7.1">libsdl-1.2.so.0.7.1</a> 
  <!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1565193"
	        dc:identifier="http://shed.egloos.com/1565193"
	        dc:title="zaurus C1000 milkytracker 설치"
	        trackback:ping="http://shed.egloos.com/tb/1565193"/>
       </rdf:RDF>
       --> 
 </설치>
</설치환경>

<ul></ul>