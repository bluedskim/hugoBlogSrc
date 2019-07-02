+++
title = "clickjacking 방지책"
date = "2008-09-28T05:44:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="clickjacking 방지책@@**@@http://shed.egloos.com/1815766"></span>http://www.breakingpointsystems.com/community/blog/clickjacking
<br>
<br>와 
<br>
<br>http://www.planb-security.net/notclickjacking/iframetrick.html 여기에 demo가 있군요. 데모에 의하면 Clickjacking는 브라우저 혹은 pc를 공격하여 무력화 하는것이 목적이 아니라 타 사이트에 저장된 사용자 정보를 빼내기 위한 목적으로 사용된다고 합니다.
<br>
<br>무심코 하는 클릭이 자신이 모르는 사이에 form submit이 될수 있다는 내용이군요.
<br>
<br>Token을 이용해서 유효한 submit인지 체크하면 방지할 수 있을것 같습니다.
<br>
<br>자세한건 여기에 http://phpsec.org/projects/guide/2.html
<br>
<br>html 쓰기 가능한 게시판에서 게시물에 심어져 있는 악의적 자바스크립트가 실행되는 해킹(Cross Site Scripting)하고 비슷한것 같습니다.
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1815766"
	        dc:identifier="http://shed.egloos.com/1815766"
	        dc:title="clickjacking 방지책"
	        trackback:ping="http://shed.egloos.com/tb/1815766"/>
       </rdf:RDF>
       -->

<ul></ul>