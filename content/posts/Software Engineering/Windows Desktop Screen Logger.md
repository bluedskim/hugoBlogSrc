+++
title = "Windows Desktop Screen Logger"
date = "2008-12-02T22:37:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="Windows Desktop Screen Logger@@**@@http://shed.egloos.com/1843497"></span>
<font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">제목은 거창하지만</span></span></font>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">사실은,</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">윈도우 데스크탑의 화면을 일정 시간 간격으로 웹서버에 업로드하는 일종의 솔류션(?), 아니 프로그램 묶음이라고 할 수 있겠다.</span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;"><br></span></span></font>
</div>
<div>
 <font class="Apple-style-span" face="돋움"><span class="Apple-style-span" style="line-height: normal; white-space: pre; "><span class="Apple-style-span" style="font-size: small;">왜 이런걸 하게 되었나?</span></span></font>
</div>
<div>
 <ol>
  <li>노트북 도난 방지<br><br></li>
  <li>그냥 내가 뭘했었는지 궁금해서</li>
 </ol>
 <div>
  그런데 이걸 쓴다고 해서 노트북 도난 방지가 될까?
 </div>
 <div>
  <br>
 </div>
 <div>
  안된다. -.-...
 </div>
 <div>
  <br>
 </div>
 <div>
  대신 도난된 노트북을 찾는데 결정적 증거가 될 수 있다.
 </div>
 <div>
  (이런 류의 프로그램은 이미 많이 있지만...)
 </div>
 <div>
  <br>
 </div>
 <div>
  아래 샘플 스크린 샷 목록을 보자.
 </div>
 <div>
  <br>
 </div>
 <div>
  <a href="http://shed.ifastnet.com/ssUpload/">http://shed.ifastnet.com/ssUpload/</a>
 </div>
 <div>
  <br>
 </div>
 <div>
  스크린 샷 파일명을 보면&nbsp;
 </div>
 <div>
  <br>
 </div>
 <div>
  [86.40.160.107]20081202-21.09.34_ss.gif
 </div>
 <div>
  <br>
 </div>
 <div>
  이런식인데 [] 사이의 숫자는 컴퓨터의 IP이다. 그 다음 숫자들은 업로드 된 날짜와 시각이다. 2008년 12월 2일 21시 09문 34초에 업로드 된 파일이다.
 </div>
 <div>
  <br>
 </div>
 <div>
  즉 IP 추적이 가능하다는 것이다.
 </div>
 <div>
  <br>
 </div>
 <div>
  이제 설치를 해보자
 </div>
 <div>
  <br>
 </div>
 <div>
  첨부한 파일의 압축을 해제하면 6개 파일이 있다.
 </div>
 <div>
  <br>
 </div>
 <div>
  <a href="http://pds12.egloos.com/pds/200812/02/82/windowsDesktopScreenLogger.zip">windowsDesktopScreenLogger.zip</a>
 </div>
 <div>
  <ol>
   <li>boxcutter.exe :&nbsp;copyrighted by Matt Rasmussen</li>
   <li>nconvert.exe&nbsp;:&nbsp;http://www.xnview.org</li>
   <li>curl.exe :&nbsp;curl-7.19.1-win32-nossl (http://curl.haxx.se/)</li>
   <li>post.bat<br><br></li>
   <li>ssUpload.php&nbsp;</li>
   <li>index.php :&nbsp;by Chris Snyder &nbsp;(csnyder@chxo.com)</li>
  </ol>
  <div>
   1~4까지는 PC에 의 적당한 디렉토리에 둔다.
  </div>
  <div>
   5, 6은 php가 지원되는 웹서버에 업로드 한다.
  </div>
  <div>
   <br>
  </div>
  <div>
   프로그램이 동작하는 순서는 다음과 같다.
  </div>
  <div>
   <ol>
    <li>boxcutter 로 스크린 샷(bmp 형식)을 생성한다.</li>
    <li>nconvert 로 생성된 bmp 파일을 gif로 변환한다. (원본 bmp 사이즈가 넘 크기 때문이다)</li>
    <li>curl 로 gif 파일을&nbsp;웹서버에&nbsp;업로드 요청 한다.<br><br></li>
    <li>ssUpload.php가 요청 IP를 파악해서 파일명을 변경하고 서버의 특정 디렉토리에 저장한다.</li>
    <li>index.php(이미지 목록 프로그램)을 이용해서 스크린샷을 확인한다.&nbsp;</li>
   </ol>
  </div>
  <div>
   그러고 보면 내가 실제로 작성한 프로그램(?)은 post.bat 과 ssUpload.php 밖에 없다.&nbsp;
  </div>
  <div>
   <br>
  </div>
  <div>
   &lt;수정 &amp; 업로드 하기&gt;
  </div>
  <div>
   <ol>
    <li>post.bat 에서 웹서버 주소 부분 수정<br>curl -F "theFileName=@ss.gif;type=image/gif" "<span class="Apple-style-span" style="text-decoration: underline;"><b>http://localhost/ssUpload.php</b></span>"<br><br></li>
    <li>ssUpload.php 4번째 라인에서 파일저장 폴더 부분 수정(그리고 해당 폴더의 권한을 777로 변경)<br>$uploaddir = "/<b><span class="Apple-style-span" style="text-decoration: underline;">ssUpload</span></b>/"; // create upload folder and change owner permission to 777<br><br></li>
    <li>index.php 를 이미지파일 저장경로에 업로드 한다.</li>
   </ol>
   <div>
    수정 &amp; 업로드가 정확히 되었다면&nbsp;post.bat 를 실행해본다.
   </div>
   <div>
    <br>
   </div>
   <div>
    에러메세지가 안뜬다면 성공한거다.
   </div>
   <div>
    <br>
   </div>
   <div>
    웹브라우저로 index.php를 불러서 제대로 업로드 되었는지 확인한다. ex)&nbsp;
    <a href="http://shed.ifastnet.com/ssUpload/index.php">http://shed.ifastnet.com/ssUpload/index.php</a>&nbsp;
   </div>
   <div>
    <br>
   </div>
   <div>
    <br>
   </div>
   <div>
    이제 post.bat를 자동으로 실행시켜 보자.&nbsp;
   </div>
   <div>
    (도둑넘이 스스로 이걸 실행할리 만무하니깐)
   </div>
   <div>
    <br>
   </div>
   <div>
    이것은 윈도우즈의 "예약된 작업" 기능을 이용한다.
   </div>
   <div>
    <br>
   </div>
   <div>
    "예약된 작업" 설정은 다른 자료를 참고하면 되고.
   </div>
   <div>
    <br>
   </div>
   <div>
    <strike>
     주의할 점은 컴퓨터 로그인 계정으로 post.bat를 실행하면 foreground 로 실행된다는 것이다. 즉, 명령프롬프트가 화면에 뜬다는 거다. 열심히 채팅하는데 도스창이 하나 뜨면 상당히 짜증날것이다.
    </strike>
   </div>
   <div>
    <strike>
     <br>
    </strike>
   </div>
   <div>
    <strike>
     그것을 피하는 방법은 현재 로그인한 사용자가 아닌 다른 사용자의 권한으로 실행하도록 하는 것이다.
    </strike>
   </div>
   <div>
    <strike>
     <br>
    </strike>
   </div>
   <div>
    <strike>
     그런데 또하나 문제점은&nbsp;boxcutter.exe(스크린샷 유틸)은 현재 로그인한 사용자 계정으로 실행해야 동작한다는 것이다.
    </strike>
   </div>
   <div>
    <strike>
     <br>
    </strike>
   </div>
   <div>
    <strike>
     그래서 어쩔 수 없이 2개의 스케쥴을 등록해야 하고 2개의 스케쥴이 교대로 동작하도록 해야 한다.
    </strike>
   </div>
   <div>
    <strike>
     <br>
    </strike>
   </div>
   <div style="text-align: center;">
    <div style="text-align:center">
     <img class="image_mid" border="0" onmouseover="this.style.cursor='pointer'" alt="" src="/attachment/1843497_1.jpg" width="600" height="261.845386534" onclick="Control.Modal.openDialog(this, event, 'http://pds11.egloos.com/pds/200812/02/82/a0003782_493533d4e102b.jpg', 802, 350);">
    </div>
   </div>
   <div style="text-align: center;">
    <strike>
     <br>
    </strike>
   </div>
   <div style="text-align: left;">
    <strike>
     즉&nbsp;post.bat&nbsp;의 첫 라인&nbsp;
     <i>boxcutter -f ss.bmp</i> 를 제거한 후 현재 윈도우계정이 아닌 다른 계정으로 실행되도록 스케쥴 등록한다.(위의 그림에서 post)
    </strike>
   </div>
   <div style="text-align: left;">
    <strike>
     "
     <i>boxcutter -f ss.bmp</i>" 작업만 해주는 스케쥴을 또 하나 등록한다(위의 그림에서 boxcutter)
    </strike>
   </div>
   <div style="text-align: left;">
    <br>
   </div>
   <div style="text-align: left;">
    작업등록시 아래와 같은 방식으로 하면 백그라운드로 실행할 수 있다 cmd /c start /min cmd /c D:\Utils\windowsDesktopScreenLogger\capture.bat
   </div>
   <div style="text-align: left;">
    <br>
   </div>
   <div style="text-align: left;">
    이 꽁수에는 단점이 있다.
   </div>
   <div style="text-align: left;">
    <ol>
     <li>개인 정보 유출 : 스크린샷을 주기적으로 찍어서 웹에 올리는 방식.<br><br></li>
     <li>웹서버 공간 부족 : 스크린샷(1280x800) 하나당 60Kbyte 정도이다. 하루에 100장씩 업로드 한다면 하루에만 6메가를 저장공간으로 사용하게 된다. 한시간에 한장 이라 하면 하루에 14장이라 치고 1년에 300메가 정도다. <br>종종 지워주면 되지 않으려나?<br><br></li>
     <li>설정이 복잡하다. -.-</li>
    </ol>
    <div>
     <font class="Apple-style-span" color="#0000EE"><span class="Apple-style-span" style="text-decoration: underline; "><br></span></font>
    </div>
   </div>
  </div>
 </div>
</div> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1843497"
	        dc:identifier="http://shed.egloos.com/1843497"
	        dc:title="Windows Desktop Screen Logger"
	        trackback:ping="http://shed.egloos.com/tb/1843497"/>
       </rdf:RDF>
       -->

<ul></ul>