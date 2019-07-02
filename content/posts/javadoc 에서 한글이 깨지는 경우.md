+++
title = "javadoc 에서 한글이 깨지는 경우"
date = "2006-12-04T14:35:00+0900"
categories = [""]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="javadoc 에서 한글이 깨지는 경우@@**@@http://shed.egloos.com/1464235"></span>(http://openframework.or.kr/blog/?p=177 에서 발췌)
<br>
<br>utf-8로 인코딩된 java 파일의 javadoc을 만들 때는 javadoc.exe의 인수로
<br>
<br>-locale ko_KR -encoding UTF-8 -charset UTF-8 -docencoding UTF-8
<br>
<br>넘겨줌
<br>
<br>&lt;메모리가 모자랄 때&gt;
<br>-locale ko_KR -encoding UTF-8 -charset UTF-8 -docencoding UTF-8
<strong> -J-Xms128m -J-Xmx512m</strong>
<br>
<br>이클립스 바로가기의 메모리와는 상관없다!
<br>
<br>
<div style="text-align:center">
 <img class="image_mid" border="0" onmouseover="this.style.cursor='pointer'" alt="" src="/attachment/1464235_1.png" width="600" height="569.407894737" onclick="Control.Modal.openDialog(this, event, 'http://pds5.egloos.com/pds/200703/08/82/a0003782_10031466.png', 608, 577);">
</div> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1464235"
	        dc:identifier="http://shed.egloos.com/1464235"
	        dc:title="javadoc 에서 한글이 깨지는 경우"
	        trackback:ping="http://shed.egloos.com/tb/1464235"/>
       </rdf:RDF>
       -->

<ul></ul>