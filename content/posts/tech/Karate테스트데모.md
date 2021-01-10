---
title: "Karate 테스트 데모"
date: 2021-01-09T22:59:55+09:00
draft: false
categories: ["tech"]
tags: ["프로그래밍"]
---

["美 IT업계서 45년 일한 어느 개발자의 여섯가지 조언"](https://zdnet.co.kr/view/?no=20210108154359)이라는 기사의 다섯번째 조언은 바로 '테스트 자동화'다.
그대로 인용하자면 "테스트를 자동화 하면 충분히 시험된 코드를 사용할 수 있어 자신감과 속도감을 가진 개발 작업에 몰두할 수 있다는 논리다".

자동화 테스트를 적극적으로 개발에 활용한 방법론이 바로 TDD(Test-Driven-Development)다. TDD의 테스트는 단위 테스트(Unit Test)이며 모든 기능에 대한 단위테스트를 먼저 작성한 후 개발하도록 하고 있다.

하지만 개발을 진행하다보면 현실적으로 단위테스트를 모두 먼저 만들고 코딩을 진행하는 것이 불가능할 때가 많다.
그래서 단위 테스트 없이 개발하고 사후에 중요한 로직부터 단위 테스트를 개발하는 방식을 많이 쓰게 된다.
하지만 필수 단위 테스트마저 만들기 힘들 때도 있다.
그렇다 하더라 최소한 주요한 워크플로우에 대한 자동화 테스트는 필요하다.

이 글에서 소개하고자 하는  Karate는 HTTP API 테스트 프레임워크이다. 
스크립트 기반으로 간단하게 테스트 시나리오를 만들 수 있어 최근 자주 사용하고 있다. 

# 소개

Karate는 API 자동화 테스트, Mock Servlet, 부하 테스트, UI 테스트를 지원하는 통합 테스트 프레임워크이다.

Cucumber의 Gherkin BDD(Behaviour-Driven Development https://cucumber.io/docs/gherkin/reference )문법을 이용해서 시나리오를 작성할 수 있어 비개발자도 쉽게 이용할 수 있다(라고 하지만 실제로 비개발자가 사용하기에는 쉽지는 않다).

assertion을 작성할 때 JSON 혹은 XML을 그대로 사용할 수 있으며 속도를 향상 시키기 위해 병렬 실행도 가능하다.

* 홈페이지 : https://intuit.github.io/karate/

# 구동

1. Junit test suite : Maven, Gradle 을 이용하여 의존성을 추가한 후 junit 테스트를 작성하여 task형태로 실행. 혹은 Eclipse, IntelliJ 같은 IDE의 플러그인을 이용해서 실행
1. stand-alone : jar 다운로드 후 터미널에서 실행(이 방식을 기준으로 설명을 진행한다)

# 설치

1. 최신버전 https://dl.bintray.com/ptrthomas/karate/karate-0.9.6.zip 을 다운로드(현재 최신 버전을 확인하려면 여기서 확인 
https://dl.bintray.com/ptrthomas/karate)
1. 압축을 해제한 후 터미널(혹은 도스창)에서 해당 경로로 이동. 아래의 모든 파일들은 이 경로에 저장한다

(테스트용 api는 mock api 제공 서비스인 https://reqres.in/ 를 사용했다)

# 샘플

## 설정 파일 작성 : karate-config.js

```
function fn() {
	var config = {
		"여기에 공통 환경 변수를 넣으세요":""
		,"baseUrl": "https://reqres.in"
	};
	return config;
}
```

## feature 파일 작성

하나의 feature 파일에는 여러 개의 feature를 넣을 수 있으며 feature에는 여러 개의 시나리오를 넣을 수 있다.
시나리오는 step들로 구성되어 있다.

아래의 내용을 복사하여 test.feature 라는 이름으로 저장하자.

```
Feature: 사용자

Background:
	* def conf = read('karate-config.js')
	* url baseUrl
	* def email = 'eve.holt@reqres.in';
	* def password = 'pistol';

Scenario: 사용자 crud

	# 사용자 등록
	Given path '/api/register'
	And header Content-Type = 'application/json; charset=utf-8'
	And request 
	"""
		{
		  ,"email" : "#(email)"
		  ,"password" : "#(password)"
		}
	"""		
	When method post
	Then status 200
	# 응답의 id가 있는가?
	And match response.id == '#present'
	# 응답의 id가 1보다 큰가?
	And assert response.id >= 1
	# 응답의 id를 변수에 저장한다.
	* def id = response.id

	# 사용자 상세 조회
	Given path '/api/users/' + id
	When method get	
	Then status 200
	# 응답의 id가 일치?
	And assert response.data.id == id
	# 응답의 이메일이 일치?
	And assert response.data.email == email

	# 사용자 목록에 신규 등록한 사용자가 있는지
	Given path '/api/users'
	When method get	
	Then status 200
	# 응답에 id가 있는가?
	And match response.data[*].id contains id
	# 응답에 이메일이 있는가?
	And match response.data[*].email contains email
```

## 실행

터미널(혹은 도스창)에서 실행한다.

* 리눅스 환경에서 실행 : `./karate ./test.feature`
* 윈도우 환경에서 실행 : `karate.bat test.feature`

## 결과 확인

### 터미널에서 확인
실행 후 터미널에서 결과가 간략하게 출력된다.
```
Karate version: 0.9.6
======================================================
elapsed:   3.14 | threads:    1 | thread time: 1.94 
features:     1 | ignored:    0 | efficiency: 0.62
scenarios:    1 | passed:     1 | failed: 0
======================================================
```

### 결과 리포트를 브라우저에서 확인
테스트가 끝나면 결과가 html로 생성된다. 이 파일을 브라우저로 열어서 결과를 확인한다.

* cucumber : {실행 경로}/target/cucumber-html-reports/overview-features.html

![](https://i.ibb.co/Bf6Dwpc/Cucumber-Reports-Features-Overview.png)

* surefire : {실행 경로}/target/surefire-reports/karate-summary.html

![](https://i.ibb.co/cyR6F39/company.png)

위의 2개 리포트는 내용은 동일하고 형식만 틀리다.

## 마치며

Karate는 아직 베타 버전(0.9.6)으로 아직 성숙한 프로젝트라고 하기는 힘들지만 시나리오 기반 api 자동화 테스트 툴로는 상당이 유용한 프레임워크다. 정식 버전 출시를 기대하고 있다.
