+++
title = "Sharp Zaurus C1000에 Milkytracker 0.90.50 설치하기"
date = "2008-02-23T14:03:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Sharp Zaurus C1000에 Milkytracker 0.90.50 설치하기@@**@@http://shed.egloos.com/1716505"></span> 음악 신디사이저, 샘플러, 작곡 프로그램인
<br>
<br>milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span> 설치법입니다. (자세한 정보는 
<a href="http://www.milky%3cspan/" style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker.net/?ABOUT) target=_blank&gt;http://www.milky<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net/?ABOUT)</a>
<br>
<br>www.milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net 에서 다운로드 받은 ipk만 설치해서는 동작하지 않습니다.
<br>(SL5500용이라서 그렇다고 하는데 5500에서도 동작하지 않더군요)
<br>
<br>문제는 
<br>
<br>1. 화면이 뒤집혀서 실행됨 : 강제로 rotation 시켜 해결
<br>2. 화면이 뜨는 순간 자우루스 다운됨 : 설치시 같이 제공되는 libSDL 문제인듯. Dosbox(zaurus 용) 설치시 같이 제공되는 libSDL 사용하여 해결.
<br>
<br>
<br>&lt;설치환경&gt;
<br>
<br>- Rom : NYMPH Zaurus Qtopia ROM 060801600
<br>
<br>- Zaurus C1000
<br>
<br>
<br>&lt;설치 순서&gt;
<br>
<br>1. 첨부한 milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>_0.90.50_arm.ipk 를 설치합니다. 'Applications' 탭에 Milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span> 아이콘이 생깁니다.
<br>
<br>2. Milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span> 아이콘을 꾹 누르고 있으면 세부옵션 창이 뜹니다. '어플리케이션을 qvga(320x240)에 최적화 시켜서 실행합니다' 를 선택합니다.
<br>
<br>3. /home/QtPalmtop/bin/milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>_execute.sh 를 아래와 같이 편집합니다.
<br>
<br>#!/bin/bash
<br>/home/milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net/bin/Milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span> -bpp 16 -orientation ROTATE90CW
<br>
<br>(잘 보시면 원본 파일에서 ROTATE 부분만 수정하시면 됩니다. 이걸 수정하지 않으면 화면이 뒤집혀서 보입니다.)
<br>
<br>4. /home/milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net/lib/libSDL-1.2.so.0 을 삭제합니다.
<br>
<br>5. 첨부한 libSDL-1.2.so.0.7.1 를 /home/milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net/lib/ 아래에 넣습니다.
<br>
<br>6. 터미널에서 아래와 같이 입력해서 링크를 걸어줍니다.
<br>
<br>ln&nbsp;&nbsp;-s&nbsp;&nbsp;/home/milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net/lib/libSDL-1.2.so.0.7.1&nbsp;&nbsp;/home/milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>.net/lib/libSDL-1.2.so.0
<br>
<br>
<br>※ 여기에 모듈음악파일 많네요 
<a href="ftp://wuarchive.wustl.edu/pub/aminet/mods/" target="_blank">ftp://wuarchive.wustl.edu/pub/aminet/mods/</a>
<br>
<br>
<br>[뱀꼬리]
<br>
<br>몇년전 5500을 사용하던 때부터 zaurus용 작곡 프로그램을 많이 찾아헤멨었는데 없더군요.
<br>
<br>리눅스용 
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span> 포팅은 내공이 없어 힘들고...
<br>
<br>M
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>2 (www.geocities.jp/uirozaurus/mt2_multi.html) 같은 
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span> 형태의 미디 시퀀서가 있지만 설치할 것도 많을 뿐더러 일본어 인터페이스라. OTL
<br>
<br>자울용 Milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>를 발견하고 부푼마음에 설치했지만 동작이 안되서 좌절하던 중.
<br>
<br>도스용 
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>를 사용해볼까 해서 Dosbox를 설치하고 테스트 해보던 중. Dosbox 설치시 전용 libSDL가 따로 설치되는것을 보고 그놈을 Milky
<span style="color: rgb(255, 0, 30); background-color: rgb(255, 240, 0);">tracker</span>에서 사용해보니 잘 되는군요. ㅋㅋ
<br>
<br>[첨부파일]
<br>
<a href="http://pds8.egloos.com/pds/200802/23/82/milkytracker_0.90.50_arm.ipk">milkytracker_0.90.50_arm.ipk</a>
<br>
<a href="http://pds8.egloos.com/pds/200802/23/82/libSDL_1.2.so.0.7.1">libSDL_1.2.so.0.7.1</a>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1716505"
	        dc:identifier="http://shed.egloos.com/1716505"
	        dc:title="Sharp Zaurus C1000에 Milkytracker 0.90.50 설치하기"
	        trackback:ping="http://shed.egloos.com/tb/1716505"/>
       </rdf:RDF>
       -->

<ul><li class="comment_item"> <h4 class="comment_writer_info"> <span class="comment_gravatar"><img src="http://md.egloos.com/img/eg/profile_anonymous.jpg" alt=""></span> <span class="comment_writer"><a href="http://plan9.co.kr/tt2" title="http://plan9.co.kr/tt2" target="_blank">주성치</a></span> <span class="comment_datetime" title="2008/02/28 13:46">2008/02/28 13:46</span> <span class="comment_link"><a name="6625076" href="http://shed.egloos.com/1716505#6625076" title="#">#</a> </span> <span class="comment_admin"> <a href="#" onclick="delComment_view('a0003782','1716505','6625076','','','0'); return false;">삭제</a> <a href="javascript:;" onclick="replyComment('replyform1716505','1716505','6625076',5,'','http://', '', 'http://shed.egloos.com/1716505#cmt','','0'); return false;" title="답글">답글</a> </span> <span class="comment_security"></span> </h4>
 <div id="comment_6625076">
  방명록이 없는 것 같애서 여기 올립니다. 
  <br>
  <br>자원봉사자별로 30명정도씩 미리 블로그를 둘러보고 가려고
  <br>한번 들려봤습니다. 내일 뵐께요. ^^
  <br>제 블로그에 사진도 있으니 오시면 아는척해주세요~
 </div> 
 <div id="reply1716505_6625076" class="comment_write reply_write" style="display:none;"></div> </li></ul>