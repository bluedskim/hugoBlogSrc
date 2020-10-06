---
title: "VS Code에서 Spring Java + Gradle 프로젝트 리프레시 하기"
date: 2020-10-06T23:09:54+09:00
categories: ["tech"]
tags: ["java","vs code"]
draft: false
---

VS code에서 Java 개발은 아직 갈 길이 먼듯.
가령 Tomcat 기반의  MVC 어플리케이션 개발 시 불편한 점이 많다. 제대로 된 플러그인이 없기 때문 -.-

반면 Spring Boot 기반이라면 웹 MVC라 하더라도 Tomcat이 없어도 개발 내용을 쉽게 확인할 수 있으니 저사양 pc에서는 VS code 만한 개발환경이 없다.

하지만 VS code도 가끔씩 고장날 때가 있는데(그래도 Eclipse 보다는 덜하다)

이 때 해결하는 방법은

1. VS code를 닫았다가 다시 띄우기
1. clean 하기
1. 어쨌든 clean 하기

가 있다.

먼저 증상을 보자.

[![컴파일 오류가 2000개?](/images/Java-Overview-dis_backend-Code-OSS.png)](/images/SJava-Overview-dis_backend-Code-OSS.png)

컴파일 오류가 2000개?

[![컴파일 오류가 2000개?](/images/Java-Overview-dis_backend-Code-OSS_2k.png)](/images/SJava-Overview-dis_backend-Code-OSS_2k.png)

이 증상은 어떤 개발자가 build.gradle에 라이브러리를 추가한 후 버전관리 시스템으로 commit하였는데 이 파일을 업데이트 할 때 종종 발생한다. 

일단 VS code를 닫았다가 다시 띄워보자. 해결 될 수도 있다.

그래도 안된다면 명시적으로 clean을 해보자.

ctrl + shift + p 단축키로 명령창을 띄우고 아래 명령을 입력한다.

	Java: Clean the Java language server workspace

[![압축해제 후 ~/WebQuake-master/Client 아래에 게임데이터용 폴더 id1 생성](/images/Java-Overview-dis_backend-Code-OSS_clean.png)](/images/SJava-Overview-dis_backend-Code-OSS_clean.png)

VS code가 재시작되고 문제가 해결될 것이다.

하지만 그래도 해결이 안된다면? 마지막 방법이 있다. settings.gradle을 열어 엔터키로 라인 한 줄을 추가하고 저장해준다(리눅스를 사용중이라면 settings.gradle을 touch도 같은 효과가 있을 듯)

[![압축해제 후 ~/WebQuake-master/Client 아래에 게임데이터용 폴더 id1 생성](/images/Java-Overview-dis_backend-Code-OSS_touch_settings.gradle.png)](/images/SJava-Overview-dis_backend-Code-OSS_touch_settings.gradle.png)

바로 무슨 일(?)이 일어난다. 궁금하다면 로그를 확인해보자.

[![압축해제 후 ~/WebQuake-master/Client 아래에 게임데이터용 폴더 id1 생성](/images/Java-Overview-dis_backend-Code-OSS_refreshing.png)](/images/SJava-Overview-dis_backend-Code-OSS_refreshing.png)

잠시 후 컴파일 오류가 모두 사라진 것을 확인할 수 있다.

VS code에서 settings.gradle을 수정하면 Java Clean 보다 강력한 정리 작업을 하는 듯 하다.
