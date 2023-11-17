---
title: "VScode Java코드품질검사 확장 SornarLint vs CodeScene"
date: 2023-11-17T17:38:10+09:00
draft: false
---

코드 리뷰를 받을 수 없는 솔로 개발자 혹은 사실상(?) 솔로 개발자의 필수품-정적 코드 분석기. VS code-Java에도 역시나 있다.

[VS Code 공식 확장 마켓](https://marketplace.visualstudio.com/search?term=java%20code%20quality&target=VSCode&category=Linters&sortBy=Installs)에서 가장 많은 설치 건수를 가지고 있는 2개의 확장 프로그램들을 재빨리 비교해보자.

## SornarLint
* 그 유명한 SonarQube가 VS code 품으로
* SonarSource의 모든 [rule](https://rules.sonarsource.com/java/)들을 그대로 사용가능
* rule 제외 가능. 추가/수정은 불가능
* [마켓플레이스 보기](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarlint-vscode), [SonarLint 공식문서](https://docs.sonarsource.com/sonarlint/vs-code/)

실제 동작 방식을 살펴보자.

아래는 어떤 문제가 있는 소스다.
그래서 해당 구문에 SonarLint가 노란색 물결무의 밑줄을 그어줬다.
그 위에 마우스를 올리면 SonarLint의 경고 내용을 확인할 수 있다.

![htop](../../images/sonarlint_문제가-있는-소스.png)

혹은 problems 창에서 해당 경고를 마우스 오른쪽 버튼으로 클릭 후 "SonarLint Open description of rule 'java:Sxxxx'"를 클릭하면

![htop](../../images/SonarLint_problems.png)

상세 내용을 볼 수 있다.

![htop](../../images/SonarLInt_rule_desc.png)

상세 내용을 보면 다음 내용을 확인 할 수 있는데
1. 어떤 유형의 이슈인지
1. 얼마나 심각한지
1. 이 이슈가 왜 문제인지
1. 어떻게 개선할 수 있는지
1. 기타 참고 사이트 목록

잘 짜여진 학습자료를 보는 느낌이다.

## CodeScene

* [codescene](https://codescene.com/)에서 제공하는 코드 건강(?) 분석 서비스의 무료 stand alone 버전
* rule 편집 가능(.codescene/code-health-rules.json 수정)
* [마켓플레이스 보기](https://marketplace.visualstudio.com/items?itemName=CodeScene.codescene-vscode)
* [CHANGE COUPLING](https://codescene.io/docs/guides/technical/change-coupling.html?_ga=2.151466937.1272763526.1700208707-1057291482.1700208707)이라는 기능을 쓰려면 유료 클라우스 서비스를 사용해야 한다. 이 기능은 모듈 간의 논리적 의존성까지 검사해 준다고. 이 확장은 사실상 이 기능을 홍보하려고 만든 것 같다.

실제 동작 방식을 살펴보자.

이슈를 발견했을 때 해당 메소드 바로 위 편집기에 해당 제목이 뜬다.

![htop](../../images/codeScene_message_in_editor.png)

혹은 problems에도 띄워 준다.

![htop](../../images/codeScene_problems.png)

해당 제목을 클릭하면 상세 정보를 확인할 수 있다.

![htop](../../images/codeScene_message.png)

## 결론
* SonarQube는 코딩 규칙 검사기에 가깝다면 CodeScene은 설계 검사에 가까운 듯 하다. 상호 보완적이므로 둘 다 쓰지 않을 이유가 없다.
* 이 2개의 도구에서 지적하지 않더라도 뭔가 찜찜한 코드가 있을 때 추가로 생성형 AI에게 반드시 물어보자.
