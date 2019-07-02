+++
title = "FTP script 샘플"
date = "2007-11-01T17:46:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="FTP script 샘플@@**@@http://shed.egloos.com/1660399"></span>암호 중간에 스페이스 문자가 있을 때 아래와 같이 한다.
<br>
<br>
<br>#!/bin/sh
<br>HOST='ftp.somehost.com'
<br>USER='loginid'
<br>
<span style="font-weight: bold; background-color: rgb(255, 204, 51);">PASSWD='pass word'</span>
<br>
<br>ftp -v -n $HOST &lt;&lt;END_SCRIPT
<br>quote USER $USER
<br>quote PASS $PASSWD
<br>passive
<br>pwd
<br>quit
<br>END_SCRIPT
<br>exit 0
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1660399"
	        dc:identifier="http://shed.egloos.com/1660399"
	        dc:title="FTP script 샘플"
	        trackback:ping="http://shed.egloos.com/tb/1660399"/>
       </rdf:RDF>
       -->

<ul></ul>