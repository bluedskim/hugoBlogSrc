+++
title = "Portable Ubuntu 팁"
date = "2009-05-14T01:19:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Portable Ubuntu 팁@@**@@http://shed.egloos.com/1905465"></span>Portable Ubuntu 는 윈도우 시스템 위에서 설치 사용할 수 있는 우분투이다.
<br>속도는 느리지만 리눅스 체험용으로는 충분하다.
<br>
<br>* 처음 설치하기 : 
<a href="http://www.choboweb.com/900">http://www.choboweb.com/900</a>
<br>* 업그레이드 하기(이미지 파일 사이즈 늘이기) &amp; Xming을 최신판으로 교체 하여 속도 향상하기 : 
<a href="http://honeyperl.tistory.com/61">http://honeyperl.tistory.com/61</a>
<br>
<br>
<ol>
 <li><span style="text-decoration: underline;">C 드라이브 말고 다른 드라이브 마운트 하기</span><br>정답은 아니다. 다른 좋은 방법이 있을 듯....<br><br>어쨌든 /etc/portable_ubuntu/portable_ubuntu.conf 를 열어서 <br>5째 라인의 cofs1=<span style="font-weight: bold;">c</span>:\ 를 cofs1=<span style="font-weight: bold;">d</span>:\ 로 수정<br><br></li>
 <li><span style="text-decoration: underline;">Tomcat 을 윈도우에서 접속하기</span><br>8080포트를 열어야 한다.<br>/etc/portable_ubuntu/portable_ubuntu.conf 를 열어서<br>eth0=slirp,00:ff:75:39:D3:C1,tcp:22:22 를 찾아서 <br>아래처럼 고친다<br>eth0=slirp,00:ff:75:39:D3:C1,tcp:22:22<span style="font-weight: bold;">/tcp:8080:8080</span><br></li>
</ol>
<br>
<div style="text-align:center">
 <img class="image_mid" border="0" onmouseover="this.style.cursor='pointer'" alt="" src="/attachment/1905465_1.jpg" width="600" height="198.529411765" onclick="Control.Modal.openDialog(this, event, 'http://pds15.egloos.com/pds/200905/14/82/a0003782_4a0af2ff5539c.jpg', 2720, 900);">
</div>
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1905465"
	        dc:identifier="http://shed.egloos.com/1905465"
	        dc:title="Portable Ubuntu 팁"
	        trackback:ping="http://shed.egloos.com/tb/1905465"/>
       </rdf:RDF>
       -->

<ul></ul>