---
title: "mlrBinder: Miller(mlr)를 자바에서 fluent API로 (README 한글판)"
date: 2026-04-13T12:00:00+09:00
draft: false
---

이 글은 [mlrBinder](https://github.com/bluedskim/mlrBinder) 저장소 README를 **한국어로 옮긴 것**과 같이 읽으면 된다. 코드 블록 안의 식별자·명령행은 원문과 동일하게 두었다.

[Miller](https://miller.readthedocs.io/)(`mlr`)는 CSV, JSON, TSV, DKVP 같은 구분 텍스트를 다루는 강력한 CLI 도구다. **mlr-binder**(저장소 이름: mlrBinder)는 Miller를 **유창한(fluent) 자바 API**로 바꿔 준다. 배치·서비스·테스트에서 손으로 셸 문자열을 짜거나 argv 목록을 복사·붙여넣기 하지 않고도 같은 일을 할 수 있다. **Miller Java Binder**는 실제 `mlr` **프로세스**를 감싸므로, 업스트림 Miller의 의미를 유지하면서 JVM 코드는 읽기 쉽고 리팩터링하기 좋게 남는다.

---

## 왜 쓰는가

- **문자열 수프를 줄인다:** 명령을 이어 붙여 IDE에서 이름을 바꾸거나 리뷰하기 어렵게 만들지 말고, `Mlr` 체인과 `Flag`, `Verb`, `Option`으로 조립한다.
- **실수를 더 일찍 잡는다:** 메서드 이름과 타입이 Miller 구조를 담는다. `put`·`filter` 같은 **Miller DSL 조각**만은 `mlr`이 돌 때까지 검증된다.
- **빠르게 붙인다:** Maven 또는 Gradle 의존성 하나, `PATH`에 있는 `mlr`(또는 설정한 경로), 그다음 `Mlr.inDir(...).csv().sort(...).file(...).run()`이면 된다. JNI 네이티브 층이나 별도 서비스가 없다.
- **Maven Central:** 좌표는 **`io.github.bluedskim:mlr-binder`**이며, 예시 버전 디렉터리는 [Central의 0.2 경로](https://repo1.maven.org/maven2/io/github/bluedskim/mlr-binder/0.2/)와 맞는다.

---

## 설치

**Java 11 이상**이 필요하다. 자바 패키지(타입이 들어 있는 패키지)는 **`net.shed.mlrbinder`**다.

Maven (`pom.xml`):

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

Gradle (Groovy):

```groovy
dependencies {
    implementation 'io.github.bluedskim:mlr-binder:0.2'
}
```

---

## 활용 사례

- **데이터 준비·ETL:** JVM 파이프라인 안에서 대용량 구분 파일이나 JSON을 정렬·절단·조인·변형·집계하고, 엔진은 Miller로 둔다.
- **백엔드·배치 작업:** 스케줄러나 워커에서 반복 가능한 `mlr` 흐름을 돌릴 때, 작업 디렉터리·파일 헬퍼를 쓰고 깨지기 쉬운 `Runtime.exec` 문자열 대신 API를 쓴다.
- **품질 게이트·픽스처:** 아래의 “Miller in 10 minutes → 자바”처럼 [Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/) 스타일 흐름을 테스트에 옮겨, 알려진 Miller 릴리스에 동작을 고정한다.
- **폴리글랏 팀:** 분석가는 Miller에 익숙하게 두고, 애플리케이션 팀은 같은 동사(verb)를 자바에서 **공유 의존성 하나**로 호출한다.

---

## 지원하는 Miller(`mlr`) 버전

이 라이브러리는 Miller **[`mlr` 6.17.0](https://github.com/johnkerl/miller/releases/tag/v6.17.0)**에 맞춰 개발·테스트된다. `PATH`에 그 버전을 설치하거나, 다른 릴리스를 쓸 때는 동작을 직접 확인하는 것이 좋다.

**바인더 전용 “설탕(sugar)”:** 일부 `Mlr` 메서드는 흔한 Miller 동사 옵션을 한 번에 묶는다(예: `uniqCountBy` → `uniq -c -g …`). 이런 **자바 이름은 Miller CLI 기능이 아니다.** 자식 프로세스는 항상 표준 `mlr`이다. 각 설탕 메서드는 Javadoc에 **대응하는 Miller CLI**를 적어 두었고, `net.shed.mlrbinder` 패키지 요약에는 한 표로 모아 두었다(생성된 Javadoc이나 IDE에서 `Mlr`/패키지 빠른 문서 참고).

**권장 스타일:** 가능하면 **`Mlr` 체인 하나**로 끝낸다. 전역 플래그는 **`Mlr`의 전역 플래그 체인 메서드**(`.icsv()`, `.from("…")` 등)로, 동사는 **Miller 동사와 같은 이름의 인스턴스 메서드**(`.sort(…)`, `.cat()` 등; **`filter`/`split`만** `.filterVerb()` / `.splitVerb()`). `flag(Flags…)` + `verb(Mlr.Verbs…)` 조합은 **꼭 필요할 때만** 쓴다.

---

## 목표

- **Miller를 부르는 방식:** 긴 명령 문자열을 이어 붙이지 않고, 가능한 한 **자바 메서드와 객체**로 Miller 동작을 표현한다. `Flag`, `Verb`, `Option`과 관련 타입으로 조립한다.
- **컴파일 타임 검사:** API로 만든 부분(플래그 이름, 동사 이름, 인자 순서 등)은 타입·메서드 시그니처 수준에서 잡을 수 있다. Miller DSL(예: `put` 식)과 필드 이름 유효성은 여전히 **실행 시 `mlr`이 검사**하므로, 컴파일러가 전부를 막을 수는 없다.
- **Miller 문법을 깊게 몰라도 쓰기:** 위 **권장 스타일**을 따르면 전역 플래그는 **`Mlr` 체인**에, 동사는 **Miller 동사와 같은 이름의 `Mlr` 메서드**에 둔다(예외: `filter` → `.filterVerb()`, `split` → `.splitVerb()`). 내부용·고급 조립에는 **`Mlr.Verbs`** 정적 팩터리도 있다. 세밀한 옵션은 Miller와 같은 인자를 `Flag`, `Objective`, `Option`으로 넘긴다. (`Verb`는 argv 조각일 뿐이니, 가능하면 애플리케이션 코드에서 `new Verb(...)`는 피한다.)
- **실행:** 내부적으로 `ProcessBuilder`가 조립된 인자 목록으로 `mlr` 프로세스를 띄운다. `mlr`은 `PATH`에 설치되어 실행 가능해야 하며(또는 설정한 경로), **JVM 안에 Miller를 링크하지 않는다.**

---

## 범위와 한계

- **거의 모든 동사:** Miller 동사마다 팩터리는 `net.shed.mlrbinder.verb.Verbs`에 있고, **`Mlr`의 동사 이름 인스턴스 메서드**와 **`Mlr.Verbs`** 모두 그쪽으로 위임한다. **전역 플래그**는 업스트림 [reference-main-flag-list](https://github.com/johnkerl/miller/blob/main/docs/src/reference-main-flag-list.md)를 따르며 `Flags`의 정적 팩터리로 제공되고, **`Mlr`에 맞는 체인 메서드**도 노출된다(`python3 utils/gen_flags.py`로 재생성). 문서에 없는 플래그는 `Flags.raw("--name")` / `Flags.raw("--name", "value")` 또는 동사 옵션으로 `Flag.flag("...")`를 쓴다. 가변 인자 뒤에 `--`가 오는 `--mfrom` / `--mload` 형태는 `Mlr#mfrom` / `#mload`를 쓴다.
- **네이티브 바인딩이 아니다:** **외부 `mlr`을 실행**할 뿐, JVM 안에 Miller를 넣지 않는다.
- **오류가 드러나는 시점:** 잘못된 조합은 `run()` / `run(InputStreamReader)`에서 종료 코드와 stderr로 나타난다.

---

## 테스트(저장소에서)

```bash
./gradlew :lib:test
```

- 리포트: `lib/build/reports/tests/test/index.html`, 커버리지: `lib/build/jacocoHtml/index.html` ([Jacoco](https://docs.gradle.org/current/userguide/jacoco_plugin.html))

---

## Miller in 10 minutes → 자바

[Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/)에 나오는 `mlr` 호출이 이 라이브러리에서 어떻게 대응하는지 정리한다. **아래 자바 예는 모두 권장 스타일**을 쓴다: **`Mlr.inDir(…)`**로 시작하고 필요하면 **`.csv()`**(`--csv`), 또는 정적 **`Mlr.withCsvPreset()`**(`mlr` + `--csv`를 먼저 두고 `workDir`/파일을 이어 붙임). 전역 플래그는 **`Mlr`에 체인**하고, 동사는 **이름이 같은 인스턴스 메서드**(`filter`/`split` → `.filterVerb` / `.splitVerb`). 같은 체인에 `--csv`를 또 붙이려면 **`.csv()`**를 다시 호출한다. **동사 옵션**은 `SortFlags`의 `f` / `n` / `nr`, `import static …Flag.flag`와 `flag("-f").objective("…")`, `option` / `objective` 등을 쓴다. 동사를 여러 개 이으면 `run()` argv에 **`then`이 자동 삽입**된다.

실제 코드에서는 필요한 것만 고르면 된다. 아래는 공통으로 자주 쓰는 import 예시다.

```java
import static net.shed.mlrbinder.Flag.flag;
import static net.shed.mlrbinder.Objective.objective;
import static net.shed.mlrbinder.SortFlags.f;
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;
import static net.shed.mlrbinder.verb.Option.option;

import net.shed.mlrbinder.Mlr;
```

더 많은 패턴은 `TenMinTutorialE2eTest`, `TenMinTutorialFormatsE2eTest`(튜토리얼의 CSV/JSON/DKVP/TSV 형식 절), `lib/src/test/resources/10min/`을 보라.

### 입출력 플래그와 `cat`

```bash
mlr --csv cat example.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.cat()
	.file("example.csv")
	.run();
```

```bash
mlr --icsv --opprint cat example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.cat()
	.file("example.csv")
	.run();
```

### 파일 형식(CSV, JSON, DKVP, TSV)

튜토리얼 “File formats” 절과 같이, `--csv` / `--json` / `--idkvp` / `--tsv` 등으로 입력 형식을 맞춘다.

```bash
mlr --csv cat shape.csv
mlr --json cat shape.json
mlr --idkvp --ocsv cat shape.dkvp
mlr --tsv cat shape.tsv
```

```java
Mlr.inDir(workingPath).csv().cat().file("shape.csv").run();
Mlr.inDir(workingPath).jsonFlag().cat().file("shape.json").run();
Mlr.inDir(workingPath).idkvp().ocsv().cat().file("shape.dkvp").run();
Mlr.inDir(workingPath).tsv().cat().file("shape.tsv").run();
```

### `head` / `tail` 옵션

```bash
mlr --csv head -n 4 example.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.head(4)
	.file("example.csv")
	.run();
```

```bash
mlr --csv tail -n 4 example.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.tail(4)
	.file("example.csv")
	.run();
```

### `sort`, `cut`

```bash
mlr --icsv --opprint sort -f shape -nr index example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(f("shape"), nr("index"))
	.file("example.csv")
	.run();
```

```bash
mlr --icsv --opprint cut -o -f flag,shape example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.cut(
		option(flag("-o")),
		option(flag("-f").objective("flag,shape")))
	.file("example.csv")
	.run();
```

### `filter` / `put`(DSL은 그대로 문자열)

```bash
mlr --icsv --opprint filter '$color == "red"' example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.filterVerb(objective("$color == \"red\""))
	.file("example.csv")
	.run();
```

```bash
mlr --icsv --opprint put '$[[3]] = "NEW"' example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.put(objective("$[[3]] = \"NEW\""))
	.file("example.csv")
	.run();
```

### 공백이 있는 필드 이름(`-nr` 값은 셸 따옴표 없이도 하나의 토큰)

```bash
mlr --csv cat spaces.csv
```

```java
Mlr.withCsvPreset()
	.workDir(workingPath)
	.cat()
	.file("spaces.csv")
	.run();
```

```bash
mlr --c2p sort -nr 'Total MWh' spaces.csv
```

```java
Mlr.inDir(workingPath)
	.c2p()
	.sort(nr("Total MWh"))
	.file("spaces.csv")
	.run();
```

```bash
mlr --c2p put '${Total KWh} = ${Total MWh} * 1000' spaces.csv
```

```java
Mlr.inDir(workingPath)
	.c2p()
	.put(objective("${Total KWh} = ${Total MWh} * 1000"))
	.file("spaces.csv")
	.run();
```

### 여러 입력 파일

```bash
mlr --csv cat data/a.csv data/b.csv
```

```java
Mlr.inDir(workingPath)
	.csv()
	.cat()
	.file("data/a.csv")
	.file("data/b.csv")
	.run();
```

### `then`으로 동사 연결

```bash
mlr --icsv --opprint sort -nr index then head -n 3 example.csv
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(nr("index"))
	.head(3)
	.file("example.csv")
	.run();
```

튜토리얼의 **셸 파이프**(`mlr … | mlr …`)는 자바에서는 **`Mlr` 호출 두 번**에 대응한다. 첫 단계 표준 출력을 임시 파일로 받으려면 `redirectOutputFile`을 쓰고, 두 번째 단계는 그 디렉터리에서 파일만으로 돌린다(표준 입력 없음).

```bash
mlr --csv sort -nr index example.csv | mlr --icsv --opprint head -n 3
```

```java
import java.nio.file.Files;
import java.nio.file.Path;

Path tmp = Files.createTempDirectory("mlr-pipe");
Path sorted = tmp.resolve("sorted.csv");
Mlr.inDir(workingPath)
	.csv()
	.sort(nr("index"))
	.file("example.csv")
	.redirectOutputFile(sorted.toFile())
	.run();

String pprintTop = Mlr.inDir(tmp.toString())
	.icsv()
	.opprint()
	.head(3)
	.file(sorted.getFileName().toString())
	.run();
```

### `--from`

```bash
mlr --icsv --opprint --from example.csv sort -nr index then head -n 3
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.from("example.csv")
	.sort(nr("index"))
	.head(3)
	.run();
```

### `--mfrom` / `--mload`(가변 인자 뒤의 `--`)

```bash
mlr --csv --mfrom a.csv b.csv -- cat
```

```java
Mlr.inDir(workingPath)
	.csv()
	.mfrom("a.csv", "b.csv")
	.cat()
	.run();
```

### `stats1`처럼 옵션이 많은 동사

```bash
mlr --icsv --opprint --from example.csv stats1 -a count,min,mean,max -f quantity -g shape
```

```java
Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.from("example.csv")
	.stats1(
		flag("-a").objective("count,min,mean,max"),
		flag("-f").objective("quantity"),
		flag("-g").objective("shape"))
	.run();
```

### JSON 입력·출력

```bash
mlr --ijson --ocsv cat example.json
```

```java
Mlr.inDir(workingPath)
	.ijson()
	.ocsv()
	.cat()
	.file("example.json")
	.run();
```

### 제자리 갱신 `-I`

```bash
mlr -I --csv sort -f shape newfile.txt
```

```java
Mlr.inDir(tmpDir)
	.inPlace()
	.csv()
	.sort(f("shape"))
	.file("newfile.txt")
	.run();
```

튜토리얼 `put` 예에서 `$y2`를 쓰는 부분은 문서 오타일 가능성이 크다. Miller에서는 제곱을 `$y**2`로 쓴다.

---

## 예시

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

import net.shed.mlrbinder.Mlr;

// 권장: 전역 플래그 체인 + 동사 이름 메서드
String runResult = Mlr.inDir(workingPath)
	.csv()
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();

// CSV 프리셋에서 시작할 때는 정적 Mlr.withCsvPreset()
String runResult2 = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();
```

### `Mlr`: 전역 플래그 체인 + 동사 이름 인스턴스 메서드(권장)

- **`Mlr.withCsvPreset()`** — 정적 진입: `mlr` + `--csv`(아직 작업 디렉터리 없음; 이어서 `.workDir(…)` / `.file(…)`). 같은 체인에 `--csv`를 하나 더 붙이려면 **`.csv()`**를 다시 호출한다.
- **전역 플래그 체인(권장):** `.icsv()`, `.opprint()`, **`.csv()`**(`--csv` 추가), `.ocsv()`, `.ijson()`, **`.jsonFlag()`**(`--json`), `.idkvp()`, `.tsv()`, `.oxtab()`, `.ixtab()`, `.c2p()`, `.from("path")`, **`.inPlace()`**(`-I`) 등은 `flag(Flags…)`를 거울로 두지만 **체인 형태를 우선**한다.
- **동사(권장):** `Verbs`의 각 동사마다 **`Mlr`에 같은 이름의 인스턴스 메서드**가 있다(예: `.uniq()`, `.histogram()`, `.join(…)`). 예외: **`filter`** → **`.filterVerb(…)`**, **`split`** → **`.splitVerb(…)`**. 편의 오버로드: **`.head(n)`** / **`.tail(n)`**, **`.cutFields` / `.cutOrdered` / `.cutExcept`**, **`.stats1("count", "qty")`**, **`.splitBy("shape")`**, **`.putQuiet(…)`**. 위 패턴이 어색할 때만 **`.verb(Mlr.Verbs.foo(…))`**를 쓴다.

`cut`의 `-o` / `-x` / `-f`에는 **`CutFlags`**와 **`.cutOrdered` / `.cutFields`**, 또는 **`.cut(option(…), option(…))`**를 쓴다. `head`/`tail` 개수: **`.head(4)`** / **`.tail(4)`** 또는 **`HeadTail.n(4)`**. `stats1`의 `-a`/`-f`/`-g`: **`StatsFlags`**. `put -q`: **`.putQuiet(…)`**. `split -g`: **`.splitBy("shape")`**. 공통 그룹핑: **`MillerVerbOpts.groupBy("field")`**(예: `head -g`).

**`SortFlags`**는 **`n("field")` / `nr("field")` / `f("field")`**와 **`n()`**(맨 `-n`, `head`용)을 계속 쓰면 된다.

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

String runResult = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file(new File("example.csv"))
	.run();

// 같은 튜토리얼 흐름
String top3 = Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(nr("index"))
	.head(3)
	.file("example.csv")
	.run();
```

Miller의 `filter` / `split` 동사는 체인에서 **`.filterVerb(…)`**와 **`.splitVerb(…)`**로 호출한다.

```java
import static net.shed.mlrbinder.Objective.objective;

Mlr.inDir(workingPath)
	.csv()
	.filterVerb(objective("$index > 1"))
	.file("example.csv")
	.run();
```

**`file(File)`**은 `workingPath`가 아직 없을 때 자동으로 맞춘다: 절대 경로 파일이면 부모 디렉터리, 상대 경로 파일이면 `user.dir`. 언제든 `workDir(String)` 또는 `workingPath(String)`으로 덮어쓸 수 있다.

---

## 맺음말

- 저장소·이슈·기여: [https://github.com/bluedskim/mlrBinder](https://github.com/bluedskim/mlrBinder)
- Miller 문서: [https://miller.readthedocs.io/](https://miller.readthedocs.io/)

JVM에서 Miller를 **도구로 두고**, 호출은 **체인 API**로 고정하고 싶다면 mlr-binder가 그 역할을 한다. 이 글은 README와 동등한 정보를 한국어 설명으로 덧붙인 형태이니, 버전이 올라가면 저장소 README와 좌표·동작을 함께 확인하면 된다.
