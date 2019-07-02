+++
title = "[Excel] 현재 워크시트의 이름을 셀에 보여주기"
date = "2009-06-11T09:41:00+0900"
categories = [""]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="[Excel] 현재 워크시트의 이름을 셀에 보여주기@@**@@http://shed.egloos.com/1916468"></span>이렇게 해준다.
<br>
<br>
<span style="font-weight: bold;">=RIGHT(CELL("filename", A1), LEN(CELL("filename", A1))-FIND("]", CELL("filename", A1)))</span>
<br>
<a href="%20http://www.ozgrid.com/VBA/return-sheet-name.htm"><br>http://www.ozgrid.com/VBA/return-sheet-name.htm</a> 에도 예제가 있다.
<br>
<br>
<span style="font-weight: bold;">=MID(CELL("filename",A1),FIND("]",CELL("filename",A1))+1,256)<br><br></span>이런 예제도 있다.
<br>
<a href="http://office.microsoft.com/ko-kr/excel/HA101030101042.aspx"><br><span style="font-style: italic;">셀에 현재 Excel 파일 이름, 경로 또는 워크시트 삽입</span>&nbsp; ( http://office.microsoft.com/ko-kr/excel/HA101030101042.aspx )</a>
<span style="font-weight: bold;"><br></span> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1916468"
	        dc:identifier="http://shed.egloos.com/1916468"
	        dc:title="[Excel] 현재 워크시트의 이름을 셀에 보여주기"
	        trackback:ping="http://shed.egloos.com/tb/1916468"/>
       </rdf:RDF>
       -->

<ul></ul>