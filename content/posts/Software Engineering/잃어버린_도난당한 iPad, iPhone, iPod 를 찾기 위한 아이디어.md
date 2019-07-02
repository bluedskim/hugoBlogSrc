+++
title = "잃어버린/도난당한 iPad, iPhone, iPod 를 찾기 위한 아이디어"
date = "2010-07-17T12:53:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="잃어버린/도난당한 iPad, iPhone, iPod 를 찾기 위한 아이디어@@**@@http://shed.egloos.com/3367467"></span>
<div>
 간략하게 정리하면&nbsp;
</div>
<div>
 <ol>
  <li>iPad 에서 매시간마다 특정 웹페이지를 방문하도록 함(wget 이용)<br><br></li>
  <li>그 웹페이지는 현재 iPad의 IP 주소를 기록함 (&nbsp;<a href="http://pds18.egloos.com/pds/201007/17/82/ipadLog.zip">ipadLog.zip</a>&nbsp;)&nbsp;<br>참조 URL :&nbsp;<a href="http://brazilflavored.com/ipadLog/logs/2010_07_16_log.txt">http://brazilflavored.com/ipadLog/logs/2010_07_16_log.txt</a>&nbsp;&nbsp;<br><br></li>
  <li><a href="http://ipwhois.nic.or.kr/">http://ipwhois.nic.or.kr/</a>&nbsp;에서&nbsp;가장 최근의 IP 주소로 조회하면 해당&nbsp;IP주소관리자 연락처를 알 수 있음<br><br></li>
  <li>IP주소관리자에게&nbsp;전화해서 그 시간에 그 아이피가 할당된 인터넷 모뎀의 대여자가 누구인지, 주소는 어디인지&nbsp;물어본다.<br>안가르쳐주면 경찰에 도난신고</li>
 </ol>
 <div>
  <br>
 </div>
</div>
<div>
 ※ 위의 방법은 탈옥해야 가능
</div>
<div>
 ※ php를 돌릴 수 있는 웹호스팅 필요
</div>※ 이런거를 쉽게 해주는 어플이 있는것으로 알고 있음
<div>
 <br>
 <div>
  다시 상세하게
 </div>
 <div>
  <br>
 </div>
 <div>
  <b>1. 웹서버에 <a href="http://pds18.egloos.com/pds/201007/17/82/ipadLog.zip">iPadLog.php</a> 설치</b>
 </div>
 <div>
  <b>2. Cydia 에서 wget 설치</b>
 </div>
 <div>
  <b>3. /var/root/conToBrazilFlavored.sh 작성</b>
 </div>
 <div>
  <br>
 </div>
 <div>
  &lt;&nbsp;conToBrazilFlavored.sh&nbsp;의 내용 &gt;&nbsp;
 </div>
 <div>
  wget -O ipadLog.php &nbsp;http://brazilflavored.com/ipadLog/ipadLog.php
 </div>
 <div>
  <br>
 </div>
 <div>
  ※&nbsp;실행권한을 줘야 동작함. 터미널에서 chmod 로 권한변경
 </div>
 <div>
  chmod 777&nbsp;/var/root/conToBrazilFlavored.sh
 </div>
 <div>
  <br>
 </div>
 <div>
  <b>4.&nbsp;/Library/LaunchDaemons/conToBrazilFlavored.plist&nbsp;작성</b>
 </div>
 <div>
  <b><br></b>
 </div>
 <div>
  &lt; conToBrazilFlavored.plist 의 내용 &gt;&nbsp;
  <br>
  <hr>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
  <br>&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;
  <br>&lt;plist version="1.0"&gt;
  <br>&lt;dict&gt;
  <br>&lt;key&gt;Label&lt;/key&gt;
  <br>&lt;string&gt;conToBrazilFlavored&lt;/string&gt;
  <br>&lt;key&gt;ProgramArguments&lt;/key&gt;
  <br>&lt;array&gt;
  <br>&lt;string&gt;
  <b><u>/var/root/conToBrazilFlavored.sh</u></b>&lt;/string&gt;
  <br>&lt;/array&gt;
  <br>&lt;key&gt;
  <b><u>StartCalendarInterval</u></b>&lt;/key&gt;
  <br>&lt;dict&gt;
  <br>&lt;key&gt;
  <b><u>Minute</u></b>&lt;/key&gt;
  <br>&lt;integer&gt;
  <b><u>1</u></b>&lt;/integer&gt;
  <br>&lt;/dict&gt;
  <br>&lt;/dict&gt;
  <br>&lt;/plist&gt;
 </div>
 <div>
  <hr>
  <br>
  <div>
   <b>5.&nbsp;conToBrazilFlavored.plist를 시작하기 위해 터미널에서&nbsp;launchctl 명령어 입력</b>
  </div>
  <div>
   launchctl load /Library/LaunchDaemons/conToBrazilFlavored.plist
  </div>
 </div>
</div>
<div>
 <br>
</div>
<div>
 이제 매시간마다 로그가 쌓임.&nbsp;참조 URL :&nbsp;
 <a href="http://brazilflavored.com/ipadLog/logs/2010_07_16_log.txt">http://brazilflavored.com/ipadLog/logs/2010_07_16_log.txt</a>&nbsp;&nbsp;
</div> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/3367467"
	        dc:identifier="http://shed.egloos.com/3367467"
	        dc:title="잃어버린/도난당한 iPad, iPhone, iPod 를 찾기 위한 아이디어"
	        trackback:ping="http://shed.egloos.com/tb/3367467"/>
       </rdf:RDF>
       -->

<ul><li class="comment_item"> <h4 class="comment_writer_info"> <span class="comment_gravatar"><img src="http://md.egloos.com/img/eg/profile_anonymous.jpg" alt=""></span> <span class="comment_writer"><a href="http://www.teamviewer.com" title="http://www.teamviewer.com" target="_blank">TeamViewer</a></span> <span class="comment_datetime" title="2010/07/19 17:30">2010/07/19 17:30</span> <span class="comment_link"><a name="7811116" href="http://shed.egloos.com/3367467#7811116" title="#">#</a> </span> <span class="comment_admin"> <a href="#" onclick="delComment_view('a0003782','3367467','7811116','','','0'); return false;">삭제</a> <a href="javascript:;" onclick="replyComment('replyform3367467','3367467','7811116',5,'','http://', '', 'http://shed.egloos.com/3367467#cmt','','0'); return false;" title="답글">답글</a> </span> <span class="comment_security"></span> </h4>
 <div id="comment_7811116">
  안녕하세요.
  <br>
  <br>저희는 독일에 위치한 원격 제어 소프트웨어을 개발하는 TeamViewer입니다.
  <br>
  <br>팀뷰어는 윈도우뿐만 아니라 리눅스와 맥킨토시 또한 아이폰과 아이패드에서도 사용가능하며 소프트웨어를 한글어로 제공하고 있습니다.
  <br>
  <br>아이패드용 TeamViewer HD는 아이패드를 통한 데스크톱과의 원격제어로 이동중에도 자유롭게 원격제어 소프트웨어가 제공하는 기존의 장점들을 누릴 수 있습니다.
  <br>
  <br>TeamViewer HD는 iTunes App-Store을 통해 다운받으실 수 있으며, 개인사용자에게는 무료로 제공되며 상업용으로 사용하 실 경우에는 TeamViewer Pro HD의 라이선스를 구입하시면 됩니다. 
  <br>
  <br>자세한 내용은
  <a href="http://www.teamviewer.com/ipad">http://www.teamviewer.com/ipad</a> 을 통해 확인하시기 바랍니다.
  <br>
  <br>문의 사항이 있으시면 info@teamviewer.com 으로 언제든지 연락주시기 바랍니다.
  <br>
  <br>감사합니다.
  <br>Teamviewer Germany
  <br>
 </div> 
 <div id="reply3367467_7811116" class="comment_write reply_write" style="display:none;"></div> </li></ul>