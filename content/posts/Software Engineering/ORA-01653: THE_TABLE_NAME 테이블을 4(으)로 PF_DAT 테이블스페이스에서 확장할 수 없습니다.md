+++
title = "ORA-01653: THE_TABLE_NAME 테이블을 4(으)로 PF_DAT 테이블스페이스에서 확장할 수 없습니다"
date = "2007-07-23T09:00:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="ORA-01653: THE_TABLE_NAME 테이블을 4(으)로 PF_DAT 테이블스페이스에서 확장할 수 없습니다@@**@@http://shed.egloos.com/1606832"></span>ORA-01653: THE_TABLE_NAME 테이블을 4(으)로 PF_DAT 테이블스페이스에서 확장할 수 없습니다
<br>
<br>1. 테이블 스페이스를 늘려준다.
<br>
<br>alter database datafile 'c:\oracle\oradata\ora92\test_02.dbf' resize 5M;
<br>
<br>2. 테이블 스페이스를 자동으로 사이즈가 늘어날 수 있도록 한다.
<br>alter database datafile 'c:\oracle\oradata\ora92\test_02.dbf' autoextend on next 1M
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1606832"
	        dc:identifier="http://shed.egloos.com/1606832"
	        dc:title="ORA-01653: THE_TABLE_NAME 테이블을 4(으)로 PF_DAT 테이블스페이스에서 확장할 수 없습니다"
	        trackback:ping="http://shed.egloos.com/tb/1606832"/>
       </rdf:RDF>
       -->

<ul></ul>