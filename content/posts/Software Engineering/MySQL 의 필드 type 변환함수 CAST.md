+++
title = "MySQL 의 필드 type 변환함수 CAST"
date = "2008-11-13T00:38:00+0900"
categories = ["Software Engineering"]
tags = ["MySQL"]
description = ""
+++
<span class="copyright_entry" style="display:block;" title="MySQL 의 필드 type 변환함수 CAST@@**@@http://shed.egloos.com/1835243"></span>text 유형 필드에 들어있는 값들을 숫자값 기준으로 정렬하고자 한다면 
<br>
<br>반드시 해당 필드를 CAST함수를 이용해서 변환해야 한다.
<br>
<br>다음 2개의 쿼리를 비교해 보자
<br>
<br>* 쿼리 : select * from 
<span class="syntax"><span class="syntax_alpha syntax_alpha_identifier">prices order by </span></span>price;
<br>* 결과 :
<br>1420
<br>1590
<br>1990
<br>220 
<br>2390
<br>2660
<br>280 
<br>2990
<br>3420
<br>380 
<br>3990
<br>4270
<br>450 
<br>570 
<br>5700
<br>760 
<br>850 
<br>이건 원하는 결과가 아니다. ㅠㅠ.... (애초에 테이블을 만들 때 필드를 숫자 형태로 만들었어야 한다...)
<br>
<br>
<span class="syntax"><span class="syntax_alpha syntax_alpha_identifier">CAST함수를 사용한다면,</span></span>
<br>* 쿼리 : select * from 
<span class="syntax"><span class="syntax_alpha syntax_alpha_identifier">prices order by CAST(</span></span>price AS UNSIGNED);
<br>* 결과 :
<br>220
<br>280 
<br>380 
<br>450 
<br>570 
<br>760 
<br>850 
<br>1060
<br>1420
<br>1590
<br>1990
<br>2390
<br>2660
<br>2990
<br>3420
<br>3990
<br>4270
<br>5700
<br>
<br>제대로 나온다.
<br>
<br>더 자세한 API는 여기에 
<a title="" href="http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html">http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html</a> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1835243"
	        dc:identifier="http://shed.egloos.com/1835243"
	        dc:title="MySQL 의 필드 type 변환함수 CAST"
	        trackback:ping="http://shed.egloos.com/tb/1835243"/>
       </rdf:RDF>
       -->

<ul></ul>