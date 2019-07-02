+++
title = "Java + Oracle xmltype insert 시 문제 : Non supported character set : oracle-character-set-840"
date = "2006-12-27T02:24:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Java + Oracle xmltype insert 시 문제 : Non supported character set : oracle-character-set-840@@**@@http://shed.egloos.com/1478411"></span>
<span style="font-weight: bold;">1. 해결책[1]</span>
<br>
<br>JDBC&nbsp;Driver가&nbsp;한글&nbsp;지원을&nbsp;하지&nbsp;않아서&nbsp;나는&nbsp;에러입니다. 
<br>JDBC&nbsp;Driver중에&nbsp;한글&nbsp;패치가&nbsp;된&nbsp;드라이버가&nbsp;있습니다. 
<br>만약&nbsp;없다면&nbsp;classes12.zip과&nbsp;더불어&nbsp;제공되는&nbsp;nls_charset12.zip을&nbsp;클래스패스에&nbsp;추가해&nbsp;주면&nbsp;해결&nbsp;될겁니다. 
<br> 
<br>패치된&nbsp;JDBC&nbsp;Driver는&nbsp;classes12_1.zip이라는&nbsp;이름으로&nbsp;웹&nbsp;자료실에서&nbsp;배포되는&nbsp;곳이&nbsp;있을겁니다.&nbsp;한번&nbsp;찾아보세요.
<br>
<br>출처 : http://www.javajigi.net/servlet/JMBoard?tablename=xml_qna&amp;mode=view&amp;boardpage=16&amp;searchword=&amp;searchscope=&amp;category=&amp;no=2
<br>
<br>
<span style="font-weight: bold;">2. 해결책[2]<br><br><span style="font-weight: bold;"></span></span>
<span style="font-style: italic;">Looks like you got wrong JDBC drivers loaded by the JVM - for 1.4 try ojdbc14.jar (and they better be 9.2.0.2.) and verify that no other drivers are on CLASSPATH.</span>
<br>(클래스패스에 다른 jdbc 드라이버가 있는지 확인해라.)
<br>
<br>그런데 ~/jre/lib/ext/ 는 디폴트 classpath이므로 여기도 반드시 확인해야 한다.
<br>
<br>시스템의 ~/jre/lib/ext/에 classes12.jar 가 있었다. ~/jre/lib/ext/의 classes12.jar 를 없애면 해결할 수 있지만 다른 java 어플이 사용하고 있을수도 있기 때문에 삭제하지 않았고 ~/jre/lib/ext/ 에 nls_charset12.jar 를 추가하여 해결함.
<br>
<br>출처 : http://forums.oracle.com/forums/thread.jspa?messageID=413418&amp;#413418
<br>출처 : http://orafaq.com/usenet/comp.databases.oracle.misc/2005/02/14/0310.htm
<br>
<br>
<br>
<br>제발 디폴트 클래스패스 혹은 시스템 클래스패스에는 진짜 필수적인 라이브러리만 두자. 안그러면 다른 개발자들 고생한다. 특히 다음 차수 프로젝트 하는 개발자들 눈물흘리며 생고생 한다. ㅠㅠ
<br>
<br>그리고 "해결책[2]" 는 네이버에 물어봐도 아무도 안가르쳐준다. 구글에서 간신히 찾았음. 
<br>
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1478411"
	        dc:identifier="http://shed.egloos.com/1478411"
	        dc:title="Java + Oracle xmltype insert 시 문제 : Non supported character set : oracle-character-set-840"
	        trackback:ping="http://shed.egloos.com/tb/1478411"/>
       </rdf:RDF>
       -->

<ul></ul>