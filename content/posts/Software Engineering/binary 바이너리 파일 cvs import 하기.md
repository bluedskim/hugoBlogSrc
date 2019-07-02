+++
title = "binary 바이너리 파일 cvs import 하기"
date = "2006-09-15T13:26:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="binary 바이너리 파일 cvs import 하기@@**@@http://shed.egloos.com/1413686"></span>cvnNT에서 import 시 모든 file은 ascii 로 간주된다.
<br>
<br>binary 파일을 import 하려면 ~/CVSROOT/cvswrappers 를 편집해야 함
<br>
<br>샘플은 아래와 같음
<br>
<br>
<a href="http://pds1.egloos.com/pds/1/200609/15/82/cvswrappers">cvswrappers</a>
<br>
<br>------------------------------------------------------------------------------------------
<br>
<br># This file affects handling of files based on their names.
<br>#
<br># The -t/-f options allow one to treat directories of files
<br># as a single file, or to transform a file in other ways on
<br># its way in and out of CVS.
<br>#
<br># The -m option specifies whether CVS attempts to merge files.
<br>#
<br># The -k option specifies keyword expansion (e.g. -kb for binary).
<br>#
<br># Format of wrapper file ($CVSROOT/CVSROOT/cvswrappers or .cvswrappers)
<br>#
<br>#&nbsp; wildcard&nbsp;&nbsp;&nbsp; [option value][option value]...
<br>#
<br>#&nbsp; where option is one of
<br>#&nbsp; -f&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; from cvs filter&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; value: path to filter
<br>#&nbsp; -t&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; to cvs filter&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; value: path to filter
<br>#&nbsp; -m&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; update methodology&nbsp;&nbsp;&nbsp; value: MERGE or COPY
<br>#&nbsp; -k&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; expansion mode&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; value: b, o, kkv, &amp;c
<br>#
<br>#&nbsp; and value is a single-quote delimited value.
<br># For example:
<br>*.AI -k 'b' -m 'COPY'
<br>*.ai -k 'b' -m 'COPY'
<br>*.AIFC -k 'b' -m 'COPY'
<br>*.aifc -k 'b' -m 'COPY'
<br>*.AIFF -k 'b' -m 'COPY'
<br>*.aiff -k 'b' -m 'COPY'
<br>*.au -k 'b' -m 'COPY'
<br>*.AU -k 'b' -m 'COPY'
<br>*.avi -k 'b' -m 'COPY'
<br>*.AVI -k 'b' -m 'COPY'
<br>*.bin -k 'b' -m 'COPY'
<br>*.BMP -k 'b' -m 'COPY'
<br>*.bmp -k 'b' -m 'COPY'
<br>*.bz -k 'b' -m 'COPY'
<br>*.bz2 -k 'b' -m 'COPY'
<br>*.cab -k 'b' -m 'COPY'
<br>*.class -k 'b' -m 'COPY'
<br>*.CLASS -k 'b' -m 'COPY'
<br>*.des -k 'b' -m 'COPY'
<br>*.DLL -k 'b' -m 'COPY'
<br>*.dll -k 'b' -m 'COPY'
<br>*.doc -k 'b' -m 'COPY'
<br>*.DOC -k 'b' -m 'COPY'
<br>*.dra -k 'b' -m 'COPY'
<br>*.DWG -k 'b' -m 'COPY'
<br>*.dwg -k 'b' -m 'COPY'
<br>*.DXF -k 'b' -m 'COPY'
<br>*.dxf -k 'b' -m 'COPY'
<br>*.ear -k 'b' -m 'COPY'
<br>*.EAR -k 'b' -m 'COPY'
<br>*.EPS -k 'b' -m 'COPY'
<br>*.eps -k 'b' -m 'COPY'
<br>*.EXE -k 'b' -m 'COPY'
<br>*.exe -k 'b' -m 'COPY'
<br>*.FIG -k 'b' -m 'COPY'
<br>*.fig -k 'b' -m 'COPY'
<br>*.FM -k 'b' -m 'COPY'
<br>*.fm -k 'b' -m 'COPY'
<br>*.gif -k 'b' -m 'COPY'
<br>*.GIF -k 'b' -m 'COPY'
<br>*.gz -k 'b' -m 'COPY'
<br>*.GZ -k 'b' -m 'COPY'
<br>*.HQX -k 'b' -m 'COPY'
<br>*.hqx -k 'b' -m 'COPY'
<br>*.ico -k 'b' -m 'COPY'
<br>*.ICO -k 'b' -m 'COPY'
<br>*.ief -k 'b' -m 'COPY'
<br>*.JAR -k 'b' -m 'COPY'
<br>*.jar -k 'b' -m 'COPY'
<br>*.jpe -k 'b' -m 'COPY'
<br>*.JPE -k 'b' -m 'COPY'
<br>*.jpeg -k 'b' -m 'COPY'
<br>*.JPEG -k 'b' -m 'COPY'
<br>*.jpg -k 'b' -m 'COPY'
<br>*.JPG -k 'b' -m 'COPY'
<br>*.mat -k 'b' -m 'COPY'
<br>*.MAT -k 'b' -m 'COPY'
<br>*.mexsg64 -k 'b' -m 'COPY'
<br>*.MEXSG64 -k 'b' -m 'COPY'
<br>*.MEXSOL -k 'b' -m 'COPY'
<br>*.mexsol -k 'b' -m 'COPY'
<br>*.mid -k 'b' -m 'COPY'
<br>*.MID -k 'b' -m 'COPY'
<br>*.midi -k 'b' -m 'COPY'
<br>*.MIDI -k 'b' -m 'COPY'
<br>*.MOV -k 'b' -m 'COPY'
<br>*.mov -k 'b' -m 'COPY'
<br>*.mp3 -k 'b' -m 'COPY'
<br>*.mpe -k 'b' -m 'COPY'
<br>*.MPE -k 'b' -m 'COPY'
<br>*.mpeg -k 'b' -m 'COPY'
<br>*.MPEG -k 'b' -m 'COPY'
<br>*.MPG -k 'b' -m 'COPY'
<br>*.mpg -k 'b' -m 'COPY'
<br>*.OBJ -k 'b' -m 'COPY'
<br>*.obj -k 'b' -m 'COPY'
<br>*.P -k 'b' -m 'COPY'
<br>*.p -k 'b' -m 'COPY'
<br>*.pcx -k 'b' -m 'COPY'
<br>*.PCX -k 'b' -m 'COPY'
<br>*.PDF -k 'b' -m 'COPY'
<br>*.pdf -k 'b' -m 'COPY'
<br>*.PNG -k 'b' -m 'COPY'
<br>*.png -k 'b' -m 'COPY'
<br>*.psd -k 'b' -m 'COPY'
<br>*.PSD -k 'b' -m 'COPY'
<br>*.ppt -k 'b' -m 'COPY'
<br>*.PPT -k 'b' -m 'COPY'
<br>*.PS -k 'b' -m 'COPY'
<br>*.ps -k 'b' -m 'COPY'
<br>*.QT -k 'b' -m 'COPY'
<br>*.qt -k 'b' -m 'COPY'
<br>*.RAM -k 'b' -m 'COPY'
<br>*.ram -k 'b' -m 'COPY'
<br>*.rpm -k 'b' -m 'COPY'
<br>*.RPM -k 'b' -m 'COPY'
<br>*.rtb -k 'b' -m 'COPY'
<br>*.RTB -k 'b' -m 'COPY'
<br>*.RTF -k 'b' -m 'COPY'
<br>*.rtf -k 'b' -m 'COPY'
<br>*.SIT -k 'b' -m 'COPY'
<br>*.sit -k 'b' -m 'COPY'
<br>*.srpm -k 'b' -m 'COPY'
<br>*.swf -k 'b' -m 'COPY'
<br>*.TAR -k 'b' -m 'COPY'
<br>*.tar -k 'b' -m 'COPY'
<br>*.tbz -k 'b' -m 'COPY'
<br>*.tex -k 'b' -m 'COPY'
<br>*.TEX -k 'b' -m 'COPY'
<br>*.TGZ -k 'b' -m 'COPY'
<br>*.tgz -k 'b' -m 'COPY'
<br>*.tif -k 'b' -m 'COPY'
<br>*.TIF -k 'b' -m 'COPY'
<br>*.TIFF -k 'b' -m 'COPY'
<br>*.tiff -k 'b' -m 'COPY'
<br>*.TZ -k 'b' -m 'COPY'
<br>*.tz -k 'b' -m 'COPY'
<br>*.voc -k 'b' -m 'COPY'
<br>*.VOC -k 'b' -m 'COPY'
<br>*.WAR -k 'b' -m 'COPY'
<br>*.war -k 'b' -m 'COPY'
<br>*.WAV -k 'b' -m 'COPY'
<br>*.wav -k 'b' -m 'COPY'
<br>*.wmf -k 'b' -m 'COPY'
<br>*.WMF -k 'b' -m 'COPY'
<br>*.wpd -k 'b' -m 'COPY'
<br>*.WPD -k 'b' -m 'COPY'
<br>*.WPG -k 'b' -m 'COPY'
<br>*.wpg -k 'b' -m 'COPY'
<br>*.XBM -k 'b' -m 'COPY'
<br>*.xbm -k 'b' -m 'COPY'
<br>*.xls -k 'b' -m 'COPY'
<br>*.XLS -k 'b' -m 'COPY'
<br>*.xwd -k 'b' -m 'COPY'
<br>*.XWD -k 'b' -m 'COPY'
<br>*.z -k 'b' -m 'COPY'
<br>*.Z -k 'b' -m 'COPY'
<br>*.zip -k 'b' -m 'COPY'
<br>*.ZIP -k 'b' -m 'COPY'
<br>
<br>------------------------------------------------------------------------------------------
<br>
<br>자세한건
<br>&nbsp;http://www.idevelopment.info/data/Programming/change_management/unix_cvs/PROGRAMMING_Working_with_Binary_Files.shtml 참조
<br>
<br>이걸 몰라서 생고생함. -.-.....
<a href="http://pds1.egloos.com/pds/1/200609/15/82/cvswrappers">cvswrappers</a>
<br> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1413686"
	        dc:identifier="http://shed.egloos.com/1413686"
	        dc:title="binary 바이너리 파일 cvs import 하기"
	        trackback:ping="http://shed.egloos.com/tb/1413686"/>
       </rdf:RDF>
       -->

<ul></ul>