+++
title = "wget 활용 - 헤더정보 보기, 파일을 다운로드 하여 특정이름으로 저장"
date = "2007-11-30T15:30:00+0900"
categories = ["Software Engineering"]
tags = ["wget"]
description = ""
+++
<span class="copyright_entry" style="display:block;" title="wget 활용 - 헤더정보 보기, 파일을 다운로드 하여 특정이름으로 저장@@**@@http://shed.egloos.com/1675050"></span>* 윈도우용 wget : 
<a href="http://pds7.egloos.com/pds/200711/30/82/wget.exe">wget.exe</a>
<br>
<br>C:\&gt;
<span style="background-color: rgb(255, 204, 51);">wget --spider -S http://www.naver.com<span style="background-color: rgb(255, 255, 255);"> --&gt; <span style="font-family: '바탕','Batang';">헤더정보를 console에 뿌린다.</span></span></span>
<br>--15:04:28--&nbsp; http://www.naver.com/
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =&gt; `index.html'
<br>Resolving www.naver.com... done.
<br>Connecting to www.naver.com[202.131.30.82]:80... connected.&nbsp; 
<span style="background-color: rgb(255, 255, 255); color: rgb(51, 102, 255); font-weight: bold; font-family: '바탕','Batang';"><span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0);">--&gt; IP는 </span><span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0);">202.131.30.82 </span><span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0);">다.</span></span>
<br>HTTP request sent, awaiting response...
<br>&nbsp;1 HTTP/1.1 200 OK
<br>&nbsp;2 Date: Fri, 30 Nov 2007 06:04:21 GMT&nbsp;&nbsp; 
<span style="background-color: rgb(255, 255, 255); color: rgb(51, 102, 255); font-weight: bold; font-family: '바탕','Batang';"><span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0);">--&gt; 메인페이지는 오늘 아침 6시 4분 21초에 업데이트 되었다.</span></span>
<br>&nbsp;3 Server: 
<span style="background-color: rgb(255, 255, 255); color: rgb(51, 102, 255); font-weight: bold;">Apache <span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0); font-family: '바탕','Batang';">--&gt; Naver는 메인페이지용 웹서버로 Apache를 쓰고 있다</span></span>
<br>&nbsp;4 Cache-control: no-cache, no-store, must-revalidate
<br>&nbsp;5 Pragma: no-cache
<br>&nbsp;6 P3P: CP="CAO DSP CURa ADMa TAIa PSAa OUR LAW STP PHY ONL UNI PUR FIN COM NAV INT DEM STA PRE" 
<span style="background-color: rgb(255, 255, 255); color: rgb(51, 102, 255); font-weight: bold; font-family: '바탕','Batang';"><span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0);">--&gt; P3P를 쓰고 있다</span></span>
<br>&nbsp;7 Connection: close
<br>&nbsp;8 Content-Type: text/html; charset=euc-kr&nbsp; 
<span style="background-color: rgb(255, 255, 255); color: rgb(51, 102, 255); font-weight: bold; font-family: '바탕','Batang';"><span style="background-color: rgb(255, 255, 255); color: rgb(51, 204, 0);">--&gt; 캐릭터셋으로 euc-kr로 쓰고 있다.</span></span>
<br>200 OK
<br>
<br>C:\&gt;
<span style="background-color: rgb(255, 204, 102);">wget -O good.jpg http://www.hikr.org/files/33971.jpg<span style="background-color: rgb(255, 255, 255);"> <span style="font-family: '바탕','Batang';">--&gt; url에서 파일을 다운로드 하여 good.jpg로 저장한다.</span></span></span>
<br>--15:08:51--&nbsp; http://www.hikr.org/files/33971.jpg
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =&gt; `good.jpg'
<br>Resolving www.hikr.org... done.
<br>Connecting to www.hikr.org[88.198.38.81]:80... connected.
<br>HTTP request sent, awaiting response... 200 OK
<br>Length: 121,292 [image/jpeg]
<br>
<br>100%[====================================&gt;] 121,292&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 44.08K/s&nbsp;&nbsp;&nbsp; ETA 00:00
<br>
<br>15:08:55 (44.08 KB/s) - `good.jpg' saved [121292/121292]
<br>
<br>
<br>
<span style="font-family: '바탕','Batang';">더 자세한 정보는 http://www.cbi.pku.edu.cn/Doc/CS/wget/man.wget.html</span>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1675050"
	        dc:identifier="http://shed.egloos.com/1675050"
	        dc:title="wget 활용 - 헤더정보 보기, 파일을 다운로드 하여 특정이름으로 저장"
	        trackback:ping="http://shed.egloos.com/tb/1675050"/>
       </rdf:RDF>
       -->

<ul><li class="comment_item"> <h4 class="comment_writer_info"> <span class="comment_gravatar"><img src="http://md.egloos.com/img/eg/profile_anonymous.jpg" alt=""></span> <span class="comment_writer"><a href="http://suban.tistory.com" title="http://suban.tistory.com" target="_blank">suban</a></span> <span class="comment_datetime" title="2010/03/09 21:29">2010/03/09 21:29</span> <span class="comment_link"><a name="7623653" href="http://shed.egloos.com/1675050#7623653" title="#">#</a> </span> <span class="comment_admin"> <a href="#" onclick="delComment_view('a0003782','1675050','7623653','','','0'); return false;">삭제</a> <a href="javascript:;" onclick="replyComment('replyform1675050','1675050','7623653',5,'','http://', '', 'http://shed.egloos.com/1675050#cmt','','0'); return false;" title="답글">답글</a> </span> <span class="comment_security"></span> </h4>
 <div id="comment_7623653">
  퍼갈게요~
 </div> 
 <div id="reply1675050_7623653" class="comment_write reply_write" style="display:none;"></div> </li></ul>