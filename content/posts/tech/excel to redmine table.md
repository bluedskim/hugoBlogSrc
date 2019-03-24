+++
title = "엑셀 데이터를 레드마인 테이블로 변환하는 Javascript"
date = "2019-03-21T20:38:28+09:00"
tags = ["redmine"]
featured_image = ""
description = ""
view_count = ""
+++
레드마인에 테이블로 데이터를 보여줄 경우가 점점 많아지는데 수작업으로 하려니 너무 힘들어서 만들었다

https://jsfiddle.net/shed/pxc93nz6/

엑셀에서 셀들을 복사한 후 위쪽 textarea에 붙히면 알아서 변환되고 redmine 태그가 복사되는데 
첫번째 줄은 header로 인식해서 bold처리 한다

엑셀(혹은 구글 시트)에서 복사하고
[![터미널 스크린샷](/images/Screenshot 2019-03-21 at 10.29.32 PM.png)](/images/Screenshot 2019-03-21 at 10.29.32 PM.png)

변환한 후 redmine에 붙히면 이렇게 나온다
[![터미널 스크린샷](/images/Screenshot 2019-03-21 at 10.29.14 PM.png)](/images/Screenshot 2019-03-21 at 10.29.14 PM.png)
