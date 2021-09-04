---
title: "'Back Office' vs 'Back End'"
date: 2021-08-11T10:05:20+09:00
categories: ["tech"]
tags: ["architecture"]
draft: false
---

IT프로젝트에서 back office와 back end를 혼용하면 망할 수 있다.
front office와 front end도 마찬가지.

다음 두 문장을 비교해보자

'_백 **오피스**와 프론트 **오피스**를 별도의 인스턴스로 구성합시다_'

와 

'_백 **엔드**와 프론트 **엔드**를 별도의 인스턴스로 구성합시다._'
는 전혀 다른 말이다.

back office는 운영자 화면(사이트)을 지칭한다고 보면 되고 front office는 사용자 화면이라고 생각하면 된다(front office는 한국 IT에서는 잘 쓰지 않는 용어).

https://www.webopedia.com/definitions/back-office/에서 언급한 "_백 오피스는 백엔드의 지원을 받는다The back office is supported by a back end system._"는 말이 틀린것은 아니지만 오해를 불러올 수 있다. 백 오피스만 백엔드의 지원을 받는 것은 아니다.  당연히 '백 오피스와 프론트 오피스 모두 백엔드의 지원을 받는다'

정리하자면 back office와 front office는 사용자 타겟에 따른 서비스 영역 개념이며 back end와 front end는 시스템 아키텍처 개념이다.

![Front-End,Back-End VS Front Office,Back Office](http://www.plantuml.com/plantuml/png/SoWkIImgAStDuIhEpimhI2nAp5KeoY_DIt7EByfBBL8mDENYAafDBadCIyz9LNWxfUNrmWLlktQycJxbzUGv2jLS2Wfv-Icf2gytR7mpOydRANlUT2rHY0QAAg08WGLqWG3Cy4eiIonEBieiAD5H24fDJ2xn2jPHyCrFoWJQu5XGeAUd1rGM2pKQOIUQ1GW9ogofvUA2UG7YAv3n21uNr4I8UJeA0Hu1EWf-G0rUmI0JOhcua3qAL6k7f1VkH5mA75BpKe213m00)
|:--:|
|<b>Front-End,Back-End VS Front Office,Back Office</b>|

<!--

http://www.plantuml.com/plantuml/uml/SoWkIImgAStDuIhEpimhI2nAp5KeoY_DIt7EByfBBL8mDENYAafDBadCIyz9LNWxfUNrmWLlktQycJxbzUGv2jLS2Wfv-Icf2gytR7mpOydRANlUT2rHY0QAAg08WGLqWG3Cy4eiIonEBieiAD5H24fDJ2xn2jPHyCrFoWJQu5XGeAUd1rGM2pKQOIUQ1GW9ogofvUA2UG7YAv3n21uNr4I8UJeA0Hu1EWf-G0rUmI0JOhcua3qAL6k7f1VkH5mA75BpKe213m00

-->
