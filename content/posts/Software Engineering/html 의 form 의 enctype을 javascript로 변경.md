+++
title = "html 의 form 의 enctype을 javascript로 변경"
date = "2007-07-05T07:54:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="html 의 form 의 enctype을 javascript로 변경@@**@@http://shed.egloos.com/1597101"></span>html 의 form 의 enctype을 명시적으로 지정하지 않으면 기본은 application/x-www-form-urlencoded 이다.
<br>
<br>이것을 javascrtip로 변경하는 샘플이다.
<br>
<br>주의할 점은 javascript로 참조할 때는 
<span style="background-color: rgb(102, 204, 204);">enctype</span>이 아니라 
<span style="background-color: rgb(255, 153, 0);">encoding</span> 이라는 점이다.
<br>
<br>&lt;html&gt;
<br>&lt;script&gt;
<br>
<br>function changeEnctype() {
<br>&nbsp;&nbsp; &nbsp;myform = document.form1;
<br>&nbsp;&nbsp; &nbsp;
<br>&nbsp;&nbsp; &nbsp;alert('원래의 enctype: ' + myform.
<span style="background-color: rgb(255, 153, 0);">encoding</span>);
<br>&nbsp;&nbsp; &nbsp;
<br>&nbsp;&nbsp; &nbsp;myform.
<span style="background-color: rgb(255, 153, 0);">encoding</span>="application/x-www-form-urlencoded";&nbsp;&nbsp; &nbsp;
<br>&nbsp;&nbsp; &nbsp;alert('디폴트로 변경 enctype: ' + myform.
<span style="background-color: rgb(255, 153, 0);">encoding</span>);
<br>&nbsp;&nbsp; &nbsp;
<br>&nbsp;&nbsp; &nbsp;myform.
<span style="background-color: rgb(255, 153, 0);">encoding</span>="multipart/form-data";
<br>&nbsp;&nbsp; &nbsp;alert('원래대로 변경 enctype: ' + myform.
<span style="background-color: rgb(255, 153, 0);">encoding</span>);
<br>}
<br>&lt;/script&gt;
<br>&lt;body&gt;
<br>&lt;form name=form1 method="post" 
<span style="background-color: rgb(102, 204, 204);">enctype</span>="multipart/form-data"&gt;
<br>&lt;input type="button" value="enctype확인" onClick="changeEnctype()"&gt;
<br>&lt;/form&gt;
<br>&lt;/body&gt;
<br>&lt;/html&gt;
<br>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1597101"
	        dc:identifier="http://shed.egloos.com/1597101"
	        dc:title="html 의 form 의 enctype을 javascript로 변경"
	        trackback:ping="http://shed.egloos.com/tb/1597101"/>
       </rdf:RDF>
       -->

<ul></ul>