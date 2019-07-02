+++
title = "javascript로 해당 html 내부의 모든 링크 목록 뽑아내기"
date = "2007-11-02T16:52:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="javascript로 해당 html 내부의 모든 링크 목록 뽑아내기@@**@@http://shed.egloos.com/1660996"></span>아래 코드를 &lt;/body&gt; 앞에 삽입한 후 브라우저로 불러보면 제일 아래쪽에 링크들 목록이 뜬다.
<br>
<br>&lt;script&gt;
<br>&nbsp;&nbsp;&nbsp; for(i = 0 ; i &lt; document.links.length ; i++ ) {
<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; document.write('&lt;xmp&gt;');
<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; document.write('[' + (i+1) + ']번째 링크 : ' + document.links[i].href + ' ☞ ' + document.links[i].innerHTML);
<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; document.write('&lt;/xmp&gt;');
<br>&nbsp;&nbsp;&nbsp; }
<br>&lt;/script&gt;
<br>
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1660996"
	        dc:identifier="http://shed.egloos.com/1660996"
	        dc:title="javascript로 해당 html 내부의 모든 링크 목록 뽑아내기"
	        trackback:ping="http://shed.egloos.com/tb/1660996"/>
       </rdf:RDF>
       -->

<ul><li class="comment_item"> <h4 class="comment_writer_info"> <span class="comment_gravatar"><img src="http://md.egloos.com/img/eg/profile_anonymous.jpg" alt=""></span> <span class="comment_writer">이혜영</span> <span class="comment_datetime" title="2007/11/02 17:28">2007/11/02 17:28</span> <span class="comment_link"><a name="6399694" href="http://shed.egloos.com/1660996#6399694" title="#">#</a> </span> <span class="comment_admin"> <a href="#" onclick="delComment_view('a0003782','1660996','6399694','','','0'); return false;">삭제</a> <a href="javascript:;" onclick="replyComment('replyform1660996','1660996','6399694',5,'','http://', '', 'http://shed.egloos.com/1660996#cmt','','0'); return false;" title="답글">답글</a> </span> <span class="comment_security"></span> </h4>
 <div id="comment_6399694">
  하이~
  <br>오랜만에 와 봤는데,,, 새 단장 하셨네요?
  <br>reswing도 있구요. 음악방송은 어디서 들을 수 있는 걸까요?
 </div> 
 <div id="reply1660996_6399694" class="comment_write reply_write" style="display:none;"></div> </li></ul>