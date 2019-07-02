+++
title = "Jeus 3.3 에서 file_realm.xml 편집하여 관리자 아이디 변경(관리자 추가)"
date = "2007-06-20T15:05:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Jeus 3.3 에서 file_realm.xml 편집하여 관리자 아이디 변경(관리자 추가)@@**@@http://shed.egloos.com/1588470"></span>~/(제우스디렉토리)/config/(hostname) 폴더 아래에 file_realm.xml 를 열어보면
<br>
<br>제일 아래에 사용자 정의 부분이 있음
<br>
<br>&nbsp;&nbsp;&nbsp; &lt;!-- User Definition --&gt;
<br>&nbsp;&nbsp;&nbsp; &lt;User&gt;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Username&gt;administrator&lt;/Username&gt;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Password&gt;암호&lt;/Password&gt;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Rolename&gt;system&lt;/Rolename&gt;
<br>&nbsp;&nbsp;&nbsp; &lt;/User&gt;
<br>
<br>위의 코드에서 바로 administrator 를 바꾸면 안됨
<br>
<br>그래서 아래를 추가하니 잘됨. ㅠㅠ
<br>
<br>&nbsp;&nbsp;&nbsp; &lt;!-- User Definition --&gt;
<br>&nbsp;&nbsp;&nbsp; &lt;User&gt;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Username&gt;
<span style="font-weight: bold; background-color: rgb(102, 204, 204);">anotheruser</span>&lt;/Username&gt;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Password&gt;암호&lt;/Password&gt;
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Rolename&gt;system&lt;/Rolename&gt;
<br>&nbsp;&nbsp;&nbsp; &lt;/User&gt;
<br>
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1588470"
	        dc:identifier="http://shed.egloos.com/1588470"
	        dc:title="Jeus 3.3 에서 file_realm.xml 편집하여 관리자 아이디 변경(관리자 추가)"
	        trackback:ping="http://shed.egloos.com/tb/1588470"/>
       </rdf:RDF>
       -->

<ul></ul>