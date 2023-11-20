---
title: "PLANTUML - 텍스트 기반 다이어그램 드로잉 툴"
date: 2023-11-18T00:03:09+09:00
draft: false
---

다이어그램을 그릴 수 있는 툴들은 많다.
가장 쉽게 구할 수 있는(?) 파워포인트부터 전통을 자랑하는 Visio, IBM Rational Software 같은 끝판왕급 툴들 그리고 각종 개발툴의 플러그인 형태의 소프트웨어까지.

그런데 갑자기 텍스트 기반 다이어그램 툴이라니.

하지만 개발자가 작성하는 것은 결국 텍스트 파일아닌가. 그렇다면 다이어그램을 텍스트로 작성한다는게 그렇게 이상하지는 않은데...

## [PlantUML](https://github.com/plantuml/plantuml)

2009년에 Arnaud Roques라는 분이 Java로 개발해서 발표한 오픈소스 다이어그램 그리기 툴이다.

'23년 말 현재 지원하는 다이어그램들은 다음과 같다.

## 🧩 UML 다이어그램
1. Sequence diagram
1. Use case diagram
1. Class diagram
1. Object diagram
1. Activity diagram
1. Component diagram
1. Deployment diagram
1. State diagram
1. Timing diagram

## 📈 UML이 아닌 다이어그램
이름은 PlantUML이지만 UML이외의 다이어그램을 더 많이 지원한다.

1. JSON data
1. YAML data
1. EBNF (Extended Backus-Naur Form)
1. Regex (Regular Expression)
1. Network diagram (nwdiag)
1. Salt (Wireframe graphical interface or UI Mockups)
1. Archimate diagram
1. SDL (Specification and Description Language)
1. Ditaa diagram
1. Gantt diagram
1. MindMap diagram
1. WBS (Work Breakdown Structure)
1. Mathematical Notations (AsciiMath, JLaTeXMath)
1. IE/ER (Information Engineering/Entity Relationship)

## PlantUML의 장점은

1. 뭐니뭐니해도 매우 빠른 프로토타이핑이다. 마우스 없이 키보드만으로 엄청난 속도로 다이어그램을 그릴 수 있다.
2. 다이어그램 버전 간의 diff가 가능해진다. 즉 다이어그램 파일을 버전 관리 시스템에서 쉽게 관리할 수 있게된다.

## 물론 단점도 있는데

1. 못생겼다(하지만 진정 예쁜 것을 원한다면 포토샵으로 작업하자).
1. 작업도중에 레이아웃이 확 바뀌는 경우가 있다(이것은 PlnatUML이 기본적으로 최적의 레이아웃을 자동으로 맞춰주기 때문).

## 시퀀스 다이어그램의 최강자

PlantUML로 최고의 속도감을 느낄 수 있는 다이어그램은 시퀀스 다이어그램이다.
PPT로 작업한 시퀀스 다이어그램에 스윔레인을 추가해본 적이 있는가.
이 작업이 얼마나 개발자를 좌절시키는지 해본 사람은 안다.

이 작업을 PlantUML로 어떻게 하는지 동영상으로 확인해보자.
<figure>
    <video src="../../images/PlantUML_sequence_diagram.webm" controls="controls" style="max-width: 730px;" autoplay muted controls loop>
    </video>
  <figcaption>온라인 WYSIWYG PlantUML 편집기 <a href="https://www.planttext.com">PlantText</a></figcaption>
</figure>

재빠르게 문법을 둘러보자.

```
@startuml

James -> Alice: Hello!
Alice -> James : Hi?
James -> Roger : Hi Roger?
Roger -> James : Good James!
Roger -> James : How's Merry?
James -> Roger : Merry is fine.
Roger -> Alice : How are you Alice?
Alice -> Roger : I'm fine. Please call Merry
Roger -> Alice : No prob.
Roger -> Merry : Are you there?
Merry -> Roger : Honey? Can I help you?

@enduml
```
설명이 필요없을만큼 직관적이다.
하지만 다른 다이어그램들은 시퀀스 다이어그램만큼 편리하지는 않은데
렌더링 후에 항목을 추가하다보면 레이아웃이 확 바뀌는 문제가 있기 때문이다.
이것은 나름 PlantUML이 사용자를 대신하여 최선을 다해 레이아웃을 맞추는 과정에서 발생하는 문제라
사용자가 특정을 잘 알고 사용해야 한다.
하지만 이 기능이 단점이라고만 할 수 없는 것이 레이아웃을 작성자가 다시 맞추는 것도 보통 작업이 아니기 때문이다. PlantUML은 이 기능을 [Smart Layout Algorithms](https://plantuml.com/en/faq)라고 부르고 있다.

## 관련 툴

* [Swagger to UML](https://github.com/nlohmann/swagger_to_uml)
* [pikturr](https://github.com/nrekretep/pikturr) : swagger visualizer
* [PlantUML Visualizer](https://chrome.google.com/webstore/detail/plantuml-visualizer/ffaloebcmkogfdkemcekamlmfkkmgkcf) : 크롬 확장
* [Doxygen](https://www.doxygen.nl/manual/config.html#cfg_dot_uml) : Javadoc 생성기
* [VS code용 확장](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml)

그 외에도 많은 툴들이 PlantUML을 지원한다. 목록은 [여기](https://plantuml.com/en/running)에서 확인 할 수 있다