+++
title = "oracle 특정 테이블들만 export"
date = "2007-06-28T16:46:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="oracle 특정 테이블들만 export@@**@@http://shed.egloos.com/1593312"></span>I:\imsi&gt;exp userid/userpasswd@sidName
<br>
<br>Export: Release 9.2.0.1.0 - Production on 목 Jun 28 16:29:50 2007
<br>
<br>Copyright (c) 1982, 2002, Oracle Corporation.&nbsp; All rights reserved.
<br>
<br>
<br>다음에 접속됨: Oracle9i Enterprise Edition Release 9.2.0.1.0 - Production
<br>With the Partitioning, OLAP and Oracle Data Mining options
<br>JServer Release 9.2.0.1.0 - Production
<br>배열 인출 버퍼 크기 입력: 4096 &gt;
<br>
<br>엑스포트 파일: EXPDAT.DMP &gt;
<br>
<br>(2)U(사용자), 또는 (3)T(테이블): (2)U &gt; T
<br>
<br>테이블 데이터 엑스포트 (yes/no): yes &gt;
<br>
<br>확장 영역 압축 (yes/no): yes &gt;
<br>
<br>KO16MSWIN949 문자 설정과 AL16UTF16 NCHAR 문자 설정에서 엑스포트가 종료되었습니다
<br>
<br>
<br>지정된 테이블을 엑스포트하려고 합니다 via 규정 경로...
<br>엑스포트할 테이블(T) 또는 분할(T:P): (종료하려면 RETURN) &gt; 
<span style="background-color: rgb(255, 204, 0);">ubi_adm_mst</span>
<br>
<br>. . 테이블&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UBI_ADM_MST(를)을 엑스포트 중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 행이 엑스
<br>포트됨
<br>엑스포트할 테이블(T) 또는 분할(T:P): (종료하려면 RETURN) &gt;
<br>
<br>엑스포트가 경고 없이 정상적으로 종료되었습니다.
<br>
<br>I:\imsi&gt; 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1593312"
	        dc:identifier="http://shed.egloos.com/1593312"
	        dc:title="oracle 특정 테이블들만 export"
	        trackback:ping="http://shed.egloos.com/tb/1593312"/>
       </rdf:RDF>
       -->

<ul></ul>