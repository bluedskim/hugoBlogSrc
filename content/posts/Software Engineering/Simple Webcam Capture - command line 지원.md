+++
title = "Simple Webcam Capture - command line 지원"
date = "2008-12-03T20:17:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Simple Webcam Capture - command line 지원@@**@@http://shed.egloos.com/1843801"></span>
<a href="http://mattcollinge.wordpress.com/software/simple-webcam-capture/"><span class="Apple-style-span" style="font-size: small;">http://mattcollinge.wordpress.com/software/simple-webcam-capture/</span></a>
<span class="Apple-style-span" style="font-size: small;"></span>
<div>
 <span class="Apple-style-span" style="font-size: small;"><br></span>
</div>
<div>
 <span class="Apple-style-span" style="font-size: small;">다른 캡쳐프로그램들도 많지만 이건&nbsp;</span>
 <span class="Apple-style-span" style="font-family: 돋움; line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">command line을 지원한다.</span></span>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">즉, "예약된 작업"에 등록하면 특정 시간 간격으로 웹캠을 자동으로 찍고</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">curl 같은 유틸리티를 이용해서 자동으로 서버에 업로드 할 수 있다.</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">(</span><a href="http://shed.egloos.com/1843497"><span class="Apple-style-span" style="font-size: small;">http://shed.egloos.com/1843497</span></a><span class="Apple-style-span" style="font-size: small;"> 참고)</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움" size="3"><span class="Apple-style-span" style="font-size: 13px; line-height: normal; white-space: pre;"><br></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움" size="3"><span class="Apple-style-span" style="font-size: 13px; line-height: normal; white-space: pre;">물론 이런 프로그램은 많이 있다.</span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움" size="3"><span class="Apple-style-span" style="font-size: 13px; line-height: normal; white-space: pre;">그러나 백그라운드에서 사용자가 눈치채지 못하게 하려면 프로그램이 제일인듯하다.</span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; ">
   <div style="text-align:center">
    <img class="image_mid" border="0" onmouseover="this.style.cursor='pointer'" alt="" src="/attachment/1843801_1.jpg" width="577" height="678" onclick="Control.Modal.openDialog(this, event, 'http://pds12.egloos.com/pds/200812/03/82/a0003782_49366a7cdeaaf.jpg', 577, 678);">
   </div></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">command 라인에서 에러(</span><span class="Apple-style-span" style="font-family: 굴림; line-height: 15px; white-space: normal; "><span class="Apple-style-span" style="font-size: small;">Error processing command line options)</span><span class="Apple-style-span" style="font-family: 돋움; line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">가 발생하는 경우가 있는데</span></span></span></span></font>
</div>
<div>
 <span class="Apple-style-span" style="font-size: small;"><br></span>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><a href="http://mattcollinge.wordpress.com/software/simple-webcam-capture/"><span class="Apple-style-span" style="font-size: small;">http://mattcollinge.wordpress.com/software/simple-webcam-capture</span></a><span class="Apple-style-span" style="font-size: small;">/ 에 의하면</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">레지스트리에 몇몇 키가 세팅되어 있지 않아서이다.</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">이건 프로그램을 한번만 제대로 동작시키면 해결된다.</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">또 하나 제약사항은 command line 옵션을 모두 지정하여 실행해야 한다는 것이다.</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">아래는 나의 command line 옵션이다.</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">"E:\Program Files\Simple Webcam Capture\simplecapture.exe" /filename E:\Util\ssUploader\cam.jpg /jpgquality 80 &nbsp;/imgperfect 500 /suffix &nbsp;/imgcaption ##dd-mm-yyyy hh:nn:ss##</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-family: 굴림; line-height: 15px; white-space: normal; "><a href="http://pds10.egloos.com/pds/200812/03/82/simplecapture-setup.exe" style="background-image: url(http://md.egloos.com/img/eg/icon_file.gif); background-repeat: no-repeat; background-attachment: initial; -webkit-background-clip: initial; -webkit-background-origin: initial; background-color: initial; list-style-type: none; list-style-position: initial; list-style-image: initial; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 15px; background-position: 0% 50%; "><span class="Apple-style-span" style="font-size: small;">simplecapture-setup.exe</span></a></span></span></font>
</div> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1843801"
	        dc:identifier="http://shed.egloos.com/1843801"
	        dc:title="Simple Webcam Capture - command line 지원"
	        trackback:ping="http://shed.egloos.com/tb/1843801"/>
       </rdf:RDF>
       -->

<ul></ul>