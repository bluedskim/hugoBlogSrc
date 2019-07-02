+++
title = "java TCP Proxy"
date = "2006-09-29T23:54:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="java TCP Proxy@@**@@http://shed.egloos.com/1423324"></span>
<a href="http://pds2.egloos.com/pds/1/200609/29/82/dodgyTCPProxy.zip" egloo="file">dodgyTCPProxy.zip --&gt; 다운로드</a>
<br>
<br>활용 시나리오는 이렇다
<br>
<br>A사에서는 java로 구현된 sms 발송기 구축를 자사에 요청했다.
<br>
<br>sms 발송기는 A사의 머신에 탑재되어야 하며
<br>
<br>sms 발송요청을 받을 sms 서버는 B사 의 서버이며
<br>
<br>A사의 클라이언트용 머신과 B사의 서버용 머신은 내부네트ㅤㅇㅝㅋ으로 연결되어 있다.
<br>
<br>B사의 sms서버는 내부망의 클라이언트의 요청만 받게 되어 있다. 즉 192.168. 로 시작하는 IP의 클라이언트만 접속을 허용한다. 따라서 본인 pc에서 바로 접속이 불가능ㅤㅎㅏㄷ.
<br>
<br>다행히도 A 사는 개발편의를 위해서 sms 클라이언트용 머신의 telnet과 ftp을 자사에 개방해주었다.
<br>
<br>그러나 개발은 본인 pc에서 진행하기 때문에 테스트를 하려면 개발소스를 A사의 클라이언트 머신에 업로드 후 진행해야 하므로 무지 불편하다.
<br>
<br>그래서 찾아낸 것이 바로 TCP Proxy 이다.
<br>
<br>TCP Proxy를 A사의 클라이언트 머신에 설치하여 본인 pc와 B사 서버사이에 proxy로 사용하여 개발을 진행하는 것이다.
<br>
<br>그러나 문제가 있었으니 바로 byte ordering 문제이다.
<br>
<br>본인 pc는 인텔기반 윈도우 머신이고 sms클라이언트용 머신은 Hp Unix였으니...
<br>
<br>TCP Proxy가 무용지물이라는 거다.
<br>
<br>
<br>(그래서 대안으로 모든 프로토콜을 준수하는 가짜 서버를 개발하여 본인 pc에서 작업하였다. -.-... 엄청난 삽질이다. B 사는 테스트용도의 서버프로그램이 있을거 같은데 미리 제공해주면 좋지 않나?)
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1423324"
	        dc:identifier="http://shed.egloos.com/1423324"
	        dc:title="java TCP Proxy"
	        trackback:ping="http://shed.egloos.com/tb/1423324"/>
       </rdf:RDF>
       -->

<ul></ul>