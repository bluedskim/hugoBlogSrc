+++
title = "jsp 에서 request header 모두 찍어보기"
date = "2007-04-25T15:17:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="jsp 에서 request header 모두 찍어보기@@**@@http://shed.egloos.com/1555072"></span>아래코드를 그대로 copy &amp; paste 하면 됨
<br>
<br>Enumeration em = request.getHeaderNames();
<br>
<br>while (em.hasMoreElements()){
<br>
<br>&nbsp;&nbsp; &nbsp;String s = (String)em.nextElement();
<br>&nbsp;&nbsp; &nbsp;
<br>&nbsp;&nbsp; &nbsp;out.println(s +" : ");
<br>&nbsp;&nbsp; &nbsp;
<br>&nbsp;&nbsp; &nbsp;out.println(request.getHeader(s)+"&lt;br&gt;");
<br>
<br>} 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1555072"
	        dc:identifier="http://shed.egloos.com/1555072"
	        dc:title="jsp 에서 request header 모두 찍어보기"
	        trackback:ping="http://shed.egloos.com/tb/1555072"/>
       </rdf:RDF>
       -->

<ul></ul>