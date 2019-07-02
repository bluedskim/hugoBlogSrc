+++
title = "명령 프롬프트에서 윈도우계정추가 & CVS계정추가"
date = "2007-10-15T13:36:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="명령 프롬프트에서 윈도우계정추가 &amp; CVS계정추가@@**@@http://shed.egloos.com/1651427"></span>윈도우서버에 접근방법이 telnet밖에 없을 때 콘솔에서 작업할 수도 있다.
<br>
<br>
<br>###### 윈도우 계정 추가 : 계정 -&gt; mrnam&nbsp;&nbsp;&nbsp;&nbsp; 암호&nbsp; -&gt;&nbsp; qweruiop
<br>NET USER mrnam qweruiop /add /EXPIRES:NEVER
<br>
<br>###### mrnam 계정에 administrators권한 추가
<br>net localgroup administrators mrnam /add
<br>
<br>###### cvs 계정 mrnam을 만들면서 윈도우의 mrnam 계정에 연결
<br>cvs passwd -a -r mrnam mrnam 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1651427"
	        dc:identifier="http://shed.egloos.com/1651427"
	        dc:title="명령 프롬프트에서 윈도우계정추가 &amp; CVS계정추가"
	        trackback:ping="http://shed.egloos.com/tb/1651427"/>
       </rdf:RDF>
       -->

<ul></ul>