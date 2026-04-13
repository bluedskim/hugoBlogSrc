---
title: "mlrBinder: Miller(mlr)를 자바에서 fluent API로"
date: 2026-04-13T12:00:00+09:00
draft: false
---

CSV·JSON·TSV·DKVP 같은 구분 텍스트를 다룰 때 [Miller](https://miller.readthedocs.io/)(`mlr`)만큼 손에 익은 도구가 없다면, JVM 쪽 배치·서비스·테스트에서도 같은 워크플로를 쓰고 싶을 때가 있다. 이때 긴 셸 문자열을 이어 붙이거나 `Runtime.exec`에 argv 배열을 손으로 조립하는 대신, **타입과 메서드 이름으로 Miller 호출을 조립**할 수 있게 만든 라이브러리가 [mlrBinder](https://github.com/bluedskim/mlrBinder)다.

## 무엇을 해 주는가

- **실제 `mlr` 프로세스를 실행**한다. JNI로 Miller를 JVM에 묶는 것이 아니라, 조립한 인자 목록으로 `ProcessBuilder`가 `mlr`을 띄운다. 그래서 **업스트림 Miller의 동작**을 그대로 따르면서, 자바 코드만 읽기·리팩터링하기 좋은 형태로 쓸 수 있다.
- **`Mlr` 체인**, `Flag`, `Verb`, `Option` 등으로 호출을 구성해 **문자열 수프**를 줄이고, IDE에서 이름·시그니처로 검토하기 쉽게 만든다.
- Miller DSL(`put`, `filter` 등)은 여전히 문자열로 넘기며, **그 부분은 실행 시점에 `mlr`이 검증**한다는 점은 그대로다.

## 언제 쓰면 좋은가

- ETL·데이터 준비 파이프라인에서 대용량 구분 파일을 정렬·절단·조인·집계할 때
- 스케줄러·워커 같은 **백엔드·배치**에서 반복 가능한 `mlr` 워크플로를 자바로 고정할 때
- 테스트에서 [Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/) 스타일 흐름을 자바로 옮겨 **품질 게이트**로 두고 싶을 때
- 분석 쪽은 Miller에 익숙하고, 애플리케이션 팀은 JVM만 쓰는 **폴리글랏** 환경에서 공통 의존성 하나로 맞출 때

## 설치

**Java 11 이상**, 시스템에 **`mlr`이 PATH에 있거나** 설정한 경로에서 실행 가능해야 한다. 개발·테스트 기준 Miller 버전은 README 기준 **[mlr 6.17.0](https://github.com/johnkerl/miller/releases/tag/v6.17.0)**이다.

[Maven Central](https://repo1.maven.org/maven2/io/github/bluedskim/mlr-binder/0.2/)에 **`io.github.bluedskim:mlr-binder:0.2`**로 올라와 있다. 패키지 네임스페이스는 **`net.shed.mlrbinder`**다.

Maven:

```xml
<dependency>
  <groupId>io.github.bluedskim</groupId>
  <artifactId>mlr-binder</artifactId>
  <version>0.2</version>
</dependency>
```

Gradle (Kotlin DSL):

```kotlin
dependencies {
    implementation("io.github.bluedskim:mlr-binder:0.2")
}
```

## 한 줄 맛보기

README에서 권장하는 스타일은 **전역 플래그는 `Mlr` 체인**, 동사(verb)는 **Miller와 같은 이름의 인스턴스 메서드**(`filter`·`split`만 `.filterVerb()` / `.splitVerb()`)다. 예를 들어 CSV를 읽어 `cat`만 돌리는 흐름은 대략 다음과 같이 쓸 수 있다.

```java
import net.shed.mlrbinder.Mlr;

String out = Mlr.inDir("/path/to/data")
    .csv()
    .cat()
    .file("example.csv")
    .run();
```

쉘에서의 `mlr --csv cat example.csv`에 대응한다. `sort`, `cut`, `head`, `put`, `--from`, 파이프에 가까운 두 단계 처리 등은 저장소 README와 테스트(`TenMinTutorialE2eTest` 등)에 **Miller in 10 minutes 튜토리얼과 1:1에 가깝게** 매핑된 예제가 많다.

## 알아두면 좋은 제한

- **네이티브 바인딩이 아니다** — 반드시 외부 `mlr` 바이너리가 필요하다.
- 잘못된 조합은 **`run()` 시점**에 종료 코드·stderr로 드러난다.
- 일부 자바 메서드는 Miller CLI 그 자체가 아니라 **자주 쓰는 옵션 묶음(sugar)**이며, Javadoc에 대응하는 Miller CLI가 적혀 있다.

## 더 보기

- 소스·이슈·기여: [https://github.com/bluedskim/mlrBinder](https://github.com/bluedskim/mlrBinder)
- Miller 문서: [https://miller.readthedocs.io/](https://miller.readthedocs.io/)

배치나 마이크로서비스에서 구분 텍스트를 Miller로만 처리하고 싶다면, 문자열 조립 대신 **체인 API로 의도를 드러내는** 쪽이 유지보수에 이득일 수 있다. JVM에서 `mlr`을 “도구로 두고 코드로 감싸고” 싶다면 한 번 의존성만 추가해 볼 만하다.
