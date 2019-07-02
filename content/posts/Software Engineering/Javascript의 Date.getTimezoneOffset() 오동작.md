+++
title = "Javascript의 Date.getTimezoneOffset() 오동작"
date = "2009-02-04T19:59:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Javascript의 Date.getTimezoneOffset() 오동작@@**@@http://shed.egloos.com/1867704"></span>Windows 의 제어판에서 GMT를 변경했는데
<br>
<br>Javascript의 Date.getTimezoneOffset() 리턴값이 변경되지 않는다면
<br>
<br>Google Chrome, Firefox의 경우 리스타트를 해줘야 한다.
<br>
<br>Internet Explorer는 상관없다.
<br>
<br>&lt;script type="text/javascript"&gt;
<br>&nbsp;&nbsp;&nbsp; var curDateTime = new Date();
<br>&nbsp;&nbsp;&nbsp; var gmtOffsetHour = Math.floor(-(curDateTime.getTimezoneOffset()/60));
<br>&nbsp;&nbsp;&nbsp; if(curDateTime.getTimezoneOffset() &gt; 0) {
<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; gmtOffsetHour = Math.ceil(-(curDateTime.getTimezoneOffset()/60));
<br>&nbsp;&nbsp;&nbsp; }
<br>&nbsp;&nbsp;&nbsp; var gmtOffsetMin = (-(curDateTime.getTimezoneOffset() % 60));
<br>&nbsp;&nbsp;&nbsp; gmtOffsetMin = Math.abs(gmtOffsetMin);
<br>&nbsp;&nbsp;&nbsp; 
<br>&nbsp;&nbsp;&nbsp; var gmtOffst = gmtOffsetHour + ":" + ((gmtOffsetMin == 0) ? "0" : "") + gmtOffsetMin;
<br>&nbsp;&nbsp;&nbsp; alert('gmtOffst=' + gmtOffst);
<br>&lt;/script&gt;
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1867704"
	        dc:identifier="http://shed.egloos.com/1867704"
	        dc:title="Javascript의 Date.getTimezoneOffset() 오동작"
	        trackback:ping="http://shed.egloos.com/tb/1867704"/>
       </rdf:RDF>
       -->

<ul></ul>