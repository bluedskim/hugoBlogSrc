---
title: "Ubuntu 20.04 + VS Code 1.56.2에서 한글 입력 문제 해결하기"
date: 2021-06-08T22:20:30+09:00
categories: ["tech"]
tags: ["Ubuntu", "VS code"]
draft: false
---

Ubuntu 20.04 환경에서 VS Code를 사용할 때 한글입력 시 기역으로 시작하는 글자에 받침이 붙으면 깨진다.

![Ubuntu_20.04 환경에서 VS Code를 사용할 때 한글입력 시 문제](https://user-images.githubusercontent.com/1418601/110890295-198a5900-8333-11eb-8afd-be34fca6d8c2.png)

위의 이미지를 보면 타이틀바의 한글은 깨지지 않지만 편집기 내부의 한글이 깨진다.


vscode의 github에 issue를 올린지 3달이 넘어서 개발자가 이슈를 해결해주었다.

[👈 이슈 내용 보기](https://github.com/microsoft/vscode/issues/118788)

원인은 기본 폰트에 있었다. Ubuntu용 VS Code는 'Droid Sans Mono'가 기본 폰트로 설정되어 있는데 이 폰트가 뭔가 충돌을 일이키는 것 같다.

이 폰트를 설정에서 제거하면 해결 된다.

CMD/CTRL + SHIFT + P 로 Command Palette 를 열고 settings json 이라고 타이핑한 후 'Open Settings (JSON)'를 선택하면 설정 JSON파일을 편집할 수 있다(혹은 CTRL + Comma 단축키로 설정화면에서 수정할 수도 있다)

editor.fontFamily 속성에서 Droid로 시작하는 폰트들을 다 삭제 하고 저장하자.

이제 기역으로 시작하는 글자에 받침이 붙어도 깨지지 않는다.

이 증상은 github.dev의 웹기반 vs code에서도 동일하다(그렇다면 MS가 운영하는 github에서도 리눅스 계열 서버를 사용한다는?).

역시 해결 방법도 동일하다.
