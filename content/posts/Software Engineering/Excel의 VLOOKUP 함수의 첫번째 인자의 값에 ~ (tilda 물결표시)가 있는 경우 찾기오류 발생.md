+++
title = "Excel의 VLOOKUP 함수의 첫번째 인자의 값에 ~ (tilda 물결표시)가 있는 경우 찾기오류 발생"
date = "2007-12-12T11:59:00+0900"
categories = ["Software Engineering"]
tags = ["VLOOKUP","excel"]
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Excel의 VLOOKUP 함수의 첫번째 인자의 값에 ~ (tilda 물결표시)가 있는 경우 찾기오류 발생@@**@@http://shed.egloos.com/1681224"></span>이런 경우 첫번째 인자에서 ~를 제거하거나 다른 문자로 대치하여야 제대로 동작한다
<br>
<br>
<br>P2 의 값이 "서울~부산" 이라고 할 때
<br>
<br>VLOOKUP(
<span style="background-color: rgb(255, 204, 102);">P2</span>,구간코드,2,FALSE)
<br>
<br>위의 함수를 아래 처럼
<br>
<br>VLOOKUP(
<span style="background-color: rgb(255, 204, 51);">SUBSTITUTE(P2,"~","-")</span>,구간코드,2,FALSE)
<br>
<br>하고
<br>
<br>"구간코드" 에 해당 하는 table_array의 값에도 ~ 를 - 로 대치해야한다.
<br>
<br>링크 : http://www.mrexcel.com/archive2/41300/48504.htm 
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1681224"
	        dc:identifier="http://shed.egloos.com/1681224"
	        dc:title="Excel의 VLOOKUP 함수의 첫번째 인자의 값에 ~ (tilda 물결표시)가 있는 경우 찾기오류 발생"
	        trackback:ping="http://shed.egloos.com/tb/1681224"/>
       </rdf:RDF>
       -->

<ul></ul>