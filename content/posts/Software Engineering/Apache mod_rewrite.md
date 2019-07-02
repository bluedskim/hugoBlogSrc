+++
title = "Apache mod_rewrite"
date = "2006-10-24T17:36:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Apache mod_rewrite@@**@@http://shed.egloos.com/1438287"></span>
<p>&lt;시나리오&gt;</p>
<p>- 클라이언트가 요청시 쿼리 value 에 항상 쓰레기 값이 붙어서 넘어옴</p>
<p>- 클리이언트 측 프로그램은 변경불가 Never and Ever~~. 어쩔 수 없이 서버쪽에서 수정해야 함 OTL....</p>
<p>&nbsp;</p>
<p>&lt;httpd.conf&gt;</p>
<p>====================================================================================</p>
<p>~~~~</p>
<p>RewriteEngine On</p>
<p>RewriteMap division-handle txt:conf/rewriteMap.txt</p>
<p># 아래꺼 잘됨<br>#RewriteRule /shit/([0-9]+) /rewrite.php?id=$1</p>
<p><strong><span style="COLOR: #000000"># /serviceName/wapGateway?clientID=ver0.1<br></span></strong><strong><span style="COLOR: #000000">&amp;phoneNo=01057401039&amp;pgmid=HW12000<br></span></strong><strong><span style="COLOR: #000000">&amp;bookType=N&amp;division=100<span style="FONT-SIZE: 130%; COLOR: #ffffff; BACKGROUND-COLOR: #cc0000">\t</span>&amp;pageNum=2&amp;maxRowNo=10<br># 위의 URL을<br># /serviceName/wapGateway?clientID=ver0.1<br>&amp;phoneNo=01057401039&amp;pgmid=HW12000<br></span></strong><strong><span style="COLOR: #000000">&amp;bookType=N&amp;division=100&amp;pageNum=2&amp;maxRowNo=10<br># 이렇게 매치시켜야 함</span></strong></p>
<p># fail - 아래와 같은 방식은 안됨<br>#RewriteRule /serviceName/wapGateway?clientID=ver(([0-9]+)|([0-9]*"."[0-9]+))<br>&amp;phoneNo=([0-9]+)&amp;pgmid=HW12000&amp;bookType=([A-Z])&amp;division=([0-9]+)\t<br>&amp;pageNum=([0-9]+)&amp;maxRowNo=([0-9]+)$ /error.php</p>
<p># fail<br>#RewriteRule /serviceName/wapGateway?clientID=([0-9]+) /error.php</p>
<p># success<br>#RewriteRule /serviceName/wapGateway /error.php</p>
<p># <a href="http://localhost/serviceName/wapGateway?clientID=\t&amp;phoneNo=01057401039">http://localhost/serviceName/wapGateway?clientID=\t&amp;phoneNo=01057401039</a><br># success<br>#RewriteCond %{QUERY_STRING} ^clientID=\\t&amp;phoneNo=01057401039$ [NC]</p>
<p># success<br>RewriteCond %{QUERY_STRING} ^clientID=ver0.1&amp;phoneNo=([0-9]+)<br>&amp;pgmid=HW12000&amp;bookType=([A-Z])&amp;division=([0-9]+)\\t<br>&amp;pageNum=([0-9]+)&amp;maxRowNo=([0-9]+)$</p>
<p>#success<br>#RewriteRule ^(.*)$ /error.php</p>
<p>#success but OUT JSP SOURCE!!!<br>#RewriteRule ^(.*)$ /debug.jsp</p>
<p>#success <br>RewriteRule ^(.*)$ <a href="http://localhost/debug.jsp">http://localhost/debug.jsp</a><br>#RewriteRule ^(.*)$ <a href="http://localhost/debug.jsp?clientID=ver0.1&amp;phoneNo=$1&amp;pgmid=HW12000&amp;bookType=$2&amp;division=$3&amp;pageNum=$4&amp;maxRowNo=$5">http://localhost/debug.jsp?clientID=ver0.1<br>&amp;phoneNo=$1&amp;pgmid=HW12000&amp;bookType=$2<br>&amp;division=$3&amp;pageNum=$4&amp;maxRowNo=$5</a></p>
<p>#success<br>#RewriteRule ^(.*)$ <a href="http://localhost:9090/debug.jsp">http://localhost:9090/debug.jsp</a></p>
<p><br>#RewriteRule ^gate.php?id=([0-9]+)$ /rewrite.php?id=$1<br>#RewriteRule ^gate.php$ /error.php</p>
<p>RewriteLog&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "C:/APM_Setup/Server/Apache/logs/rewrite.log"<br>RewriteLogLevel 9</p>
<p>====================================================================================</p>
<p>&lt;rewriteMap.txt&gt;</p>
<p>##<br>##&nbsp; map.txt -- rewriting map<br>##</p>
<p>100\\t 100&nbsp;&nbsp; # <br>200\\t 200&nbsp;&nbsp; # <br>~~~<br>~~~</p>
<p>====================================================================================</p>
<p>&lt;참조 URL&gt;</p>
<p>* mod_rewrite :<br>- <a href="http://www.sitepoint.com/article/guide-url-rewriting">http://www.sitepoint.com/article/guide-url-rewriting</a><br>- <a href="http://www.llstudios.net/directory/13-1">http://www.llstudios.net/directory/13-1</a><br>- <a href="http://www.llstudios.net/directory/4-1">http://www.llstudios.net/directory/4-1</a><br>- <a href="http://www.tech-faq.com/lang/ko/web-design-tutorials.shtml">http://www.tech-faq.com/lang/ko/web-design-tutorials.shtml</a><br>- <a href="http://httpd.apache.org/docs/1.3/mod/mod_rewrite.html">http://httpd.apache.org/docs/1.3/mod/mod_rewrite.html</a></p>* 정규표현식 : 
<br>
<a href="http://kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/x10468.html">http://kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/x10468.html</a>
<br>
<br>&nbsp; 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1438287"
	        dc:identifier="http://shed.egloos.com/1438287"
	        dc:title="Apache mod_rewrite"
	        trackback:ping="http://shed.egloos.com/tb/1438287"/>
       </rdf:RDF>
       -->

<ul></ul>