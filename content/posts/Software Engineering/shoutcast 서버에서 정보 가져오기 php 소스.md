+++
title = "shoutcast 서버에서 정보 가져오기 php 소스"
date = "2008-10-02T00:47:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="shoutcast 서버에서 정보 가져오기 php 소스@@**@@http://shed.egloos.com/1817450"></span>http://yoda.ih.nu/ 에 가면 shoutcast 서버에 admin.cgi를 통해 로그인 후 정보를 fetch 해오는 소스가 있는데
<br>
<br>xml을 해석하는 방식이라서 더 깔끔하기는 한데 속도가 많이 느리고 굳이 아이디/암호로 로그인까지 할 필요도 없고 해서 아래 소스를 추천한다.
<br>
<br>복잡하게 'fsockopen함수를 쓰지 말고 file 함수를 쓰면 되지 않느냐?'라고 생각할 수도 있는데
<br>
<br>예를 들면
<br>
<br>$htmlCodes = file('http://live140.impek.com:8090/');
<br>
<br>이런식으로.
<br>
<br>그러나 불가능하다. "404 Resource Not Found
<span style="font-style: italic;"></span>" 가 발생하는데 shoutcast 서버는 agent가 일반적인 브라우져가 아니면 404에러를 발생하는 듯 하다.
<br>
<ul>
 <li>소스파일 다운로드 : <a href="http://pds10.egloos.com/pds/200810/02/82/shoutcastStatus.php.txt">shoutcastStatus.php.txt</a></li>
</ul> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1817450"
	        dc:identifier="http://shed.egloos.com/1817450"
	        dc:title="shoutcast 서버에서 정보 가져오기 php 소스"
	        trackback:ping="http://shed.egloos.com/tb/1817450"/>
       </rdf:RDF>
       -->

<ul></ul>