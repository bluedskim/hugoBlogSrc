---
title: "픽셀북(모든 크롬북?)에서 Quake게임 실행하기"
date: 2019-08-13T18:28:39+09:00
tags: ["pixelbook","chromebook","quake","WebGL"]
draft: false
---

Pixelbook은 상당히 사양이 괜찮은 노트북이지만 즐길 수 있는 적당한 FPS게임이 없다. 안드로이드용  FPS는 있지만 뭔가 부족한 느낌이다. 
키보드 지원이 미비하다는게 그 이유 일 듯. 외형상 일반 노트북과 동일한 크롬북에는 클래식 FPS게임이 가장 적당한데 크롬OS용 FPS게임은 들어 본적이 없다.

Quake 소스가 공개된 후로 Webgl로 포팅한 프로젝트가 있어 시도해봤는데 환상적이다.

### WebGL?

브라우저에서 OpenGL ES 를 이용할 수 있게해주는 API

### Quake?

1인칭 슈팅 게임. 현재는 소스가 오픈되어 있어 많은 개발자들이 이것을 이용해서 각종 변종들을 만들고 있다.

### 일단 맛을 보자

* http://nadako.github.io/HaxeQuake/Client/WebQuake.htm
* 크롬 익스텐션으로 맛보기 : https://chrome.google.com/webstore/detail/web-quake/ibkbfanmkmadbbgggonficloplenbefh?hl=en 
	
	(그러나 이 extension으로는 shareware 버전만 가능)

### 제약사항

* 최신 mod 구동 불가 : 소스 공개 후 각종 변종들이 나왔는데 이것들에 기반한 mod들은 돌릴 수 없다
* Internet Explorer에서 동작하지 않음(IE에 뭔가 기대하지 말자)
* 스테레오 음향이 지원되지 않는 듯. 모노로 출력된다

### 설치 순서

1. WebQuake 다운로드
2. web 서버  extension 설치

#### WebQuake 다운로드

1. 링크 : https://github.com/Triang3l/WebQuake/archive/master.zip

	[![master.zip](/images/Screenshot 2019-08-14 at 10.53.04 AM.png)](/images/Screenshot 2019-08-14 at 10.53.04 AM.png)

1. 압축해제 후 (설치 폴더)/WebQuake-master/Client 아래에 게임데이터용 폴더 id1 생성

	[![압축해제 후 ~/WebQuake-master/Client 아래에 게임데이터용 폴더 id1 생성](/images/Screenshot 2019-08-14 at 10.54.25 AM.png)](/images/Screenshot 2019-08-14 at 10.54.25 AM.png)

	[![압축해제 후 ~/WebQuake-master/Client 아래에 게임데이터용 폴더 id1 생성](/images/Screenshot 2019-08-14 at 10.55.08 AM.png)](/images/Screenshot 2019-08-14 at 10.55.08 AM.png)
	
1. id1폴더에 quake shareware에서 추출한 pak0.pak 다운로드 :  http://nadako.github.io/HaxeQuake/Client/id1/pak0.pak

	(혹은 https://github.com/rictorres/quake-ktx-server/raw/master/id1/pak0.pak)
	
1. id1폴더에 [autoexec.cfg](/posts/tech/%ed%81%ac%eb%a1%ac%eb%b6%81%ec%97%90%ec%84%9c%20quake%ea%b2%8c%ec%9e%84%20%ec%8b%a4%ed%96%89%ed%95%98%ea%b8%b0.files/autoexec.cfg) 다운로드 (mouse look, crosshair 활성화하기 위해 필요)

#### web 서버  extension 설치

1. 설치 : https://chrome.google.com/webstore/detail/web-server-for-chrome/ofhbbkphhbklhfoeikjpcbhemlocgigb?hl=en
2. 설정 :  "CHOOSE FOLDER" 클릭 후 (설치 폴더)/WebQuake-master/Client 선택

	[![설정 :  "CHOOSE FOLDER" 클릭 후 (설치 폴더)/WebQuake-master/Client 선택](/images/Screenshot 2019-08-14 at 12.20.12 PM.png)](/images/Screenshot 2019-08-14 at 12.20.12 PM.png)

3. http://127.0.0.1:8887/index.htm 로 이동하면 게임이 뜬다.

	[![in game](/images/Screenshot 2019-08-14 at 12.24.45 PM.png)](/images/Screenshot 2019-08-14 at 12.24.45 PM.png)
