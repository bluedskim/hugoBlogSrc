---
title: "mlrBinder를 소개합니다 — 자바에서 Miller를 자연스럽게 호출하고 싶어 만들었습니다"
date: 2026-04-13T12:00:00+09:00
draft: false
description: "mlrBinder 저자가 직접 소개하는 글. Miller(mlr)를 JVM에서 문자열 지옥 없이 다루게 해 주는 라이브러리입니다."
---

**먼저 말씀드립니다.** [mlrBinder](https://github.com/bluedskim/mlrBinder)는 **제가 직접 만들고 있는 프로젝트**입니다. 이 글은 누군가의 리뷰가 아니라, **저자인 제가** “왜 만들었는지, 어떻게 쓰면 좋은지”를 블로그 독자분들께 직접 설명드리기 위해 쓴 소개 겸 안내 글입니다. (이 블로그에서는 Dennis라는 이름으로 표시되고, GitHub·Maven Central에는 `bluedskim`으로 올라가 있습니다.)

---

CSV·JSON·TSV·DKVP처럼 **구분자 기반 텍스트**를 다룰 때 [Miller](https://miller.readthedocs.io/)(`mlr`)는 정말 잘 다듬어진 도구라고 생각합니다. 저도 터미널에서는 거의 습관처럼 쓰게 됩니다. 그런데 같은 작업을 **자바 배치, 서비스, 테스트 코드**로 옮기면 이야기가 조금 달라집니다. 긴 셸 한 줄을 문자열로 이어 붙이거나 `Runtime.exec`에 argv를 손으로 구성하다 보면, **나중에 손보기 부담스럽고** 코드 리뷰에서도 한눈에 들어오지 않습니다.

그래서 **“Miller는 그대로 두고, 호출만 자바답게”** 만들고 싶어 시작한 것이 **mlr-binder**(Maven 아티팩트 이름)이고, 저장소 이름은 **mlrBinder**로 두었습니다. 내부에서는 익숙한 **`mlr` 실행 파일**을 `ProcessBuilder`로 실행하고, 바깥에서는 **`Mlr` 체인**으로 읽기 좋게 조립할 수 있게 했습니다. JNI로 Miller를 JVM에 직접 붙이는 방식이 아니라서, **의존성 하나와 PATH에 있는 `mlr`만으로** 시작할 수 있다는 점도 제가 중요하게 본 부분입니다.

---

## 이렇게 설계한 이유

- **명령 문자열을 덜 쓰게 하고 싶었습니다.** `Mlr` 체인과 `Flag`, `Verb`, `Option`으로 조립하면 IDE에서 이름 바꾸기·정의 이동·리뷰가 훨씬 수월해집니다.
- **컴파일러와 IDE가 도와줄 수 있는 부분은 최대한 활용하고 싶었습니다.** 플래그 이름, 동사 이름, 인자 순서 같은 것은 타입과 시그니처에 녹여 두었습니다. 반대로 `put`·`filter`처럼 **Miller DSL** 자체는 여전히 `mlr` 실행 시점에 검증됩니다. 이 점은 솔직하게 말씀드리면, “전부 컴파일 타임에 잡힌다”는 뜻은 아닙니다.
- **프로젝트에 쉽게 추가할 수 있도록** Maven Central에 **`io.github.bluedskim:mlr-binder`**로 배포해 두었습니다. 아래 예시 버전 **0.2**는 [Central 디렉터리](https://repo1.maven.org/maven2/io/github/bluedskim/mlr-binder/0.2/)에서도 확인하실 수 있습니다.

---

## 설치 — 이렇게만 추가해 보세요

**Java 11 이상**이면 됩니다. 주요 타입이 들어 있는 패키지는 **`net.shed.mlrbinder`**입니다.

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

## 이런 곳에서 쓰기를 염두에 두었습니다

- **데이터 준비·ETL:** JVM 파이프라인 안에서 정렬·절단·조인·변형·집계를 하되, 실행 엔진은 Miller로 두고 싶을 때.
- **백엔드·배치:** 스케줄러·워커에서 같은 `mlr` 흐름을 반복할 때, `Runtime.exec`에 긴 문자열을 넣는 대신 작업 디렉터리와 파일을 API로 다루고 싶을 때.
- **테스트·품질 게이트:** 아래 **「Miller in 10 minutes → 자바」**처럼 [Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/)의 흐름을 테스트로 옮겨, 팀이 고른 Miller 버전 기준으로 동작을 고정하고 싶을 때.
- **팀의 역할이 나뉘어 있을 때:** 분석 쪽은 Miller에 익숙한 방식으로 두고, 애플리케이션 쪽은 **같은 동사(verb)를 자바 의존성 하나**로 맞추고 싶을 때.

---

## Miller 버전과 제가 권하는 사용 방식

저는 개발과 테스트를 Miller **[`mlr` 6.17.0](https://github.com/johnkerl/miller/releases/tag/v6.17.0)** 기준으로 돌리고 있습니다. 가능하면 `PATH`에 이 버전을 두고 사용하시면 제가 확인한 동작과 가장 가깝습니다. 다른 버전도 물론 사용할 수 있지만, 한 번 실행해 보시고 차이만 감안해 주시면 됩니다.

**편의 메서드**도 몇 가지 넣어 두었습니다. 예를 들어 `uniqCountBy`는 자주 쓰는 옵션 묶음을 한 번에 호출하도록 만든 메서드로(`uniq -c -g …`에 대응), 이런 **자바식 이름이 Miller CLI에 그대로 존재하는 것은 아닙니다.** 실제로 실행되는 프로세스는 항상 표준 `mlr`입니다. 각 메서드가 어떤 Miller 명령에 대응하는지는 **Javadoc**에 적어 두었고, `net.shed.mlrbinder` 패키지 요약에도 표로 정리해 두었으니 IDE에서 `Mlr`만 펼쳐 보셔도 흐름을 파악하실 수 있습니다.

**처음 쓰실 때는** 가능하면 **`Mlr` 체인 하나**로 끝내 보시는 것을 권합니다. 전역 플래그는 **`.icsv()`, `.from("…")` 같은 체인 메서드**로, 동사는 **Miller와 같은 이름의 메서드**(`.sort(…)`, `.cat()` 등)로 붙입니다. **`filter`와 `split`만** 자바 쪽 이름과 겹쳐서 `.filterVerb()`, `.splitVerb()`로 제공됩니다. `flag(Flags…)`와 `verb(Mlr.Verbs…)`는 **정말 필요할 때만** 쓰셔도 충분합니다.

---

## 이 라이브러리에 기대한 점

- **Miller 호출이 코드로 읽히게** — 긴 문자열을 이어 붙이기보다 `Flag`, `Verb`, `Option`으로 조립하는 방식을 기본으로 삼았습니다.
- **API로 표현한 부분은 타입이 잡아 주게** — 반대로 Miller DSL이나 필드 이름은 **`mlr` 실행 시점에** 검사된다는 점을 README에도 분명히 적어 두었습니다.
- **Miller를 아주 깊게 몰라도 시작할 수 있게** — 권장 스타일만 따르면 전역 플래그는 **`Mlr` 체인**, 동사는 **같은 이름의 `Mlr` 메서드**로 대부분 해결됩니다. 더 세밀하게 다루고 싶다면 **`Mlr.Verbs`**와 `Flag`, `Objective`, `Option`을 쓰시면 됩니다. (`Verb`는 argv 조각이므로, 애플리케이션 코드에서는 가능하면 `new Verb(...)`보다 팩터리 사용을 권합니다.)
- **실행 구조는 단순하게** — `ProcessBuilder`로 `mlr`을 실행합니다. JVM 안에 Miller를 링크하는 구조는 아닙니다.

---

## 솔직하게 말씀드리는 범위와 한계

- **거의 모든 Miller 동사**에 대응하도록 `net.shed.mlrbinder.verb.Verbs`에 팩터리를 모아 두었고, **`Mlr`의 동사 이름 메서드**와 **`Mlr.Verbs`**가 함께 그쪽을 바라보도록 했습니다. 전역 플래그는 업스트림 [reference-main-flag-list](https://github.com/johnkerl/miller/blob/main/docs/src/reference-main-flag-list.md)를 기준으로 `Flags`에 반영했고, **`Mlr` 체인 메서드**로도 같은 내용을 쓸 수 있게 맞춰 두었습니다(저장소에서는 `python3 utils/gen_flags.py`로 갱신합니다). 문서에 없는 플래그는 `Flags.raw("--name")` / `Flags.raw("--name", "value")`나 `Flag.flag("...")`로 넘기실 수 있습니다. `--mfrom` / `--mload`처럼 가변 인자 뒤에 `--`가 오는 형태는 `Mlr#mfrom` / `#mload`를 쓰시면 됩니다.
- **네이티브 바인딩은 아닙니다.** 외부에서 `mlr`을 실행하는 방식이므로, **바이너리는 반드시 필요**합니다. 대신 배포와 운영은 훨씬 단순해집니다.
- **일부 오류는 `run()` 직전에야** 종료 코드와 stderr로 드러납니다. 이 점은 미리 알고 계시면 덜 당황하실 겁니다.

---

## 저장소를 클론해 주신다면

제가 CI에서도 실행하는 테스트는 이 한 줄입니다.

```bash
./gradlew :lib:test
```

결과는 `lib/build/reports/tests/test/index.html`, 커버리지는 `lib/build/jacocoHtml/index.html`에서 확인하실 수 있습니다([Jacoco](https://docs.gradle.org/current/userguide/jacoco_plugin.html)).

---

## Miller in 10 minutes → 자바 (README와 같은 매핑)

아래는 [Miller in 10 minutes](https://miller.readthedocs.io/en/latest/10min/)에 나오는 `mlr` 한 줄을 **이 라이브러리에서는 어떻게 표현하도록 설계했는지** 저장소 README와 같은 순서로 정리한 부분입니다. **자바 예제는 모두 제가 권하는 스타일**입니다. **`Mlr.inDir(…)`**로 시작하고 CSV가 필요하면 **`.csv()`**를 붙입니다. 또는 **`Mlr.withCsvPreset()`**으로 `mlr` + `--csv`를 미리 설정한 뒤 `workDir`과 파일을 이어 붙여도 됩니다. 전역 플래그는 **`Mlr` 체인에**, 동사는 **이름이 같은 메서드**로 붙입니다(`filter`/`split`만 `.filterVerb` / `.splitVerb`). `--csv`를 한 번 더 넣고 싶다면 **`.csv()`**를 다시 호출하시면 됩니다. 동사 옵션은 `SortFlags`의 `f` / `n` / `nr`, `flag("-f").objective("…")`, `option` / `objective` 등을 쓰시면 되고, 동사를 여러 개 이으면 `run()`에 전달되는 argv에 **`then`이 자동으로 들어갑니다.**

실제 프로젝트에서는 필요한 import만 골라 쓰시면 됩니다. 자주 함께 쓰는 항목은 대략 이렇습니다.

```java
import static net.shed.mlrbinder.Flag.flag;
import static net.shed.mlrbinder.Objective.objective;
import static net.shed.mlrbinder.SortFlags.f;
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;
import static net.shed.mlrbinder.verb.Option.option;

import net.shed.mlrbinder.Mlr;
```

더 많은 패턴은 제가 테스트로도 남겨 둔 `TenMinTutorialE2eTest`, `TenMinTutorialFormatsE2eTest`, `lib/src/test/resources/10min/`을 보시면 그대로 따라가시기 쉽습니다.

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

튜토리얼의 “File formats” 절에 맞춰 입력 형식을 지정합니다.

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

### `filter` / `put` (DSL은 문자열 그대로)

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

### 공백이 있는 필드 이름 (`-nr` 값은 셸에서 따옴표로 감싸지 않아도 하나의 토큰입니다)

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

셸 파이프(`mlr … | mlr …`)는 자바에서는 **`Mlr`를 두 번** 호출하는 흐름으로 생각하시면 됩니다. 첫 단계의 stdout을 파일로 받으려면 `redirectOutputFile`을 쓰고, 두 번째 단계에서는 그 디렉터리에서 해당 파일만 넘기면 됩니다.

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

### `--mfrom` / `--mload` (`--`가 가변 인자 뒤에 오는 경우)

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

튜토리얼의 `put` 예제에 나오는 `$y2`는 문서 오타일 가능성이 있습니다. Miller에서는 제곱을 `$y**2`로 쓰는 편이 맞습니다.

---

## 짧게 한 번 돌려 보고 싶다면

README에도 넣어 둔 예시입니다. IDE에 붙여 넣어 보시면 체인이 어떻게 읽히는지 바로 감이 오실 겁니다.

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

import net.shed.mlrbinder.Mlr;

// 전역 플래그는 체인에, 동사는 이름 그대로
String runResult = Mlr.inDir(workingPath)
	.csv()
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();

// 처음부터 CSV를 전제로 시작할 때
String runResult2 = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file("example.csv")
	.run();
```

### `Mlr` 체인을 만들 때 제가 권하는 요령

- **`Mlr.withCsvPreset()`**이면 이미 `mlr`과 `--csv`가 들어간 상태입니다. 이어서 `.workDir(…)` / `.file(…)`만 붙이시면 됩니다. `--csv`를 한 번 더 넣고 싶다면 **`.csv()`**를 다시 호출하세요.
- **전역 플래그**는 `.icsv()`, `.opprint()`, **`.csv()`**, `.ocsv()`, `.ijson()`, **`.jsonFlag()`**(`--json`), `.idkvp()`, `.tsv()`, `.oxtab()`, `.ixtab()`, `.c2p()`, `.from("path")`, **`.inPlace()`**(`-I`)처럼 체인 메서드로 붙이는 쪽을 먼저 권합니다. `flag(Flags…)`는 그다음 선택지입니다.
- **동사**는 대부분 Miller와 같은 이름의 메서드입니다(예: `.uniq()`, `.histogram()`, `.join(…)`). 예외는 **`filter`** → **`.filterVerb(…)`**, **`split`** → **`.splitVerb(…)`**뿐입니다. 자주 쓰는 조합은 **`.head(n)`**, **`.tail(n)`**, **`.cutFields` / `.cutOrdered` / `.cutExcept`**, **`.stats1("count", "qty")`**, **`.splitBy("shape")`**, **`.putQuiet(…)`**처럼 짧게 부를 수도 있게 해 두었습니다. 이 정도로 부족할 때만 **`.verb(Mlr.Verbs.foo(…))`**를 꺼내 쓰시면 됩니다.

`cut`의 `-o` / `-x` / `-f`는 **`CutFlags`**와 **`.cutOrdered` / `.cutFields`**, 또는 **`.cut(option(…), option(…))`**로 다룰 수 있습니다. `head`/`tail`의 개수는 **`.head(4)`** / **`.tail(4)`** 또는 **`HeadTail.n(4)`**, `stats1`의 `-a`/`-f`/`-g`는 **`StatsFlags`**, `put -q`는 **`.putQuiet(…)`**, `split -g`는 **`.splitBy("shape")`**를 쓰시면 됩니다. 공통 그룹핑은 **`MillerVerbOpts.groupBy("field")`**(예: `head -g`)를 참고해 주세요.

**`SortFlags`**는 **`n("field")`**, **`nr("field")`**, **`f("field")`**, 그리고 `head`용 맨 앞의 `-n`에 해당하는 **`n()`**까지 같은 방식으로 계속 쓰시면 됩니다.

```java
import static net.shed.mlrbinder.SortFlags.n;
import static net.shed.mlrbinder.SortFlags.nr;

String runResult = Mlr.withCsvPreset()
	.workDir(workingPath)
	.sort(n("a"), nr("b"))
	.file(new File("example.csv"))
	.run();

// 튜토리얼과 같은 흐름
String top3 = Mlr.inDir(workingPath)
	.icsv()
	.opprint()
	.sort(nr("index"))
	.head(3)
	.file("example.csv")
	.run();
```

`filter`와 `split`은 자바 예약어와 겹치므로 체인에서는 **`.filterVerb(…)`**, **`.splitVerb(…)`**로 부르게 해 두었습니다.

```java
import static net.shed.mlrbinder.Objective.objective;

Mlr.inDir(workingPath)
	.csv()
	.filterVerb(objective("$index > 1"))
	.file("example.csv")
	.run();
```

**`file(File)`**은 작업 디렉터리가 비어 있을 때 편의상 자동으로 채우도록 해 두었습니다. 절대 경로면 부모 폴더를, 상대 경로면 `user.dir`를 기준으로 잡습니다. 원치 않으시면 `workDir(String)`이나 `workingPath(String)`으로 언제든 덮어쓰실 수 있습니다.

---

## 마무리하며 — 한 번만 들러 주세요

- **저장소·이슈·기여:** [https://github.com/bluedskim/mlrBinder](https://github.com/bluedskim/mlrBinder)
- **Miller 공식 문서:** [https://miller.readthedocs.io/](https://miller.readthedocs.io/)

JVM에서 Miller는 **그대로 사용하되** 호출 방식만 정리하고 싶으시다면, mlr-binder를 의존성에 한 줄 추가해 보시길 권합니다. 버그나 불편한 점, “이런 동사도 체인에 붙이고 싶다” 같은 의견은 **GitHub 이슈**로 보내 주시면 제가 직접 확인하고 반영하겠습니다. 스타나 포크도 큰 힘이 됩니다. 읽어 주셔서 고맙습니다.
